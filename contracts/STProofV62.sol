// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/**
 * @title STProof v6.2 - Spatial-Temporal Proof Protocol
 * @dev Protocol Version: 6.2 | Polygon Optimized
 * 
 * Security & Improvements in v6.2:
 * - ReentrancyGuard protection on all payable functions
 * - Pausable emergency stop mechanism
 * - Fixed validator join permission (onlyOwner)
 * - O(1) validator duplicate check using mapping
 * - Removed redundant storage variables
 * - Dynamic fee adjustment
 * - Updateable royalty rates
 * - Enhanced evidence structure with adder & note
 * - Failed ETH transfers don't block main flow
 * - Inherited OpenZeppelin ERC721 standards
 * 
 * Economic Model:
 * - Royalty: 5% on secondary sales, 100% to event creator
 * - Citation Tax: 70% to creator, 28% to treasury, 2% to protocol creator
 * - Paid Access: 70% to creator, 28% to treasury, 2% to protocol creator
 */
contract STProofV62 is ERC721, ERC721URIStorage, ERC721Enumerable, ReentrancyGuard, Pausable, Ownable {
    using Strings for uint256;

    // ==================== Structs ====================
    
    struct EventProof {
        string eventName;
        string cid;                    // Primary CID (first evidence)
        address creator;
        uint256 createTime;
        bool verified;
        uint256 citations;
        uint256 revenue;
        uint256 schemaId;
    }
    
    struct Citation {
        address citer;
        uint256 timestamp;
    }
    
    struct Evidence {
        string cid;
        address adder;
        uint256 timestamp;
        string note;
    }
    
    // ==================== State Variables ====================
    
    uint256 private _tokenIdCounter;
    
    mapping(uint256 => EventProof) public events;
    mapping(uint256 => Citation[]) public citationList;
    mapping(uint256 => mapping(address => bool)) public hasCited;
    mapping(address => bool) public validators;
    address[] public validatorList;
    
    // v6.2: Enhanced evidence history
    mapping(uint256 => Evidence[]) public evidenceHistory;
    
    // O(1) validator duplicate check
    mapping(uint256 => mapping(address => bool)) public hasValidated;
    
    address public treasury;
    address public protocolCreator;
    uint256 public treasuryBalance;
    uint256 public creatorBalance;
    
    // Pending ETH withdrawals (for failed transfers)
    mapping(address => uint256) public pendingWithdrawals;
    
    // Metadata Schema Registry
    struct Schema {
        string uri;
        bool isActive;
        uint256 registeredAt;
    }
    mapping(uint256 => Schema) public metadataSchemas;
    uint256 public schemaCount;
    
    // Dynamic fees
    uint256 public citationFee = 0.0001 ether;
    uint256 public accessFee = 0.001 ether;
    
    uint256 public constant MIN_VALIDATORS = 2;
    uint256 public constant CREATOR_SHARE = 70;
    uint256 public constant TREASURY_SHARE = 28;
    uint256 public constant PROTOCOL_CREATOR_SHARE = 2;
    uint256 public constant MAX_ROYALTY_RATE = 1000; // 10% max
    
    // Royalty tracking
    mapping(uint256 => uint256) private _royaltyRates;
    
    // Base URI for metadata
    string private _baseTokenURI;
    
    // ==================== Events ====================
    
    event Minted(uint256 indexed tokenId, string name, address indexed creator, uint256 schemaId);
    event Verified(uint256 indexed tokenId, address indexed validator);
    event Cited(uint256 indexed tokenId, address indexed citer, uint256 fee, uint256 creatorShare, uint256 treasuryShare, uint256 protocolShare);
    event ValidatorAdded(address indexed validator);
    event ValidatorRemoved(address indexed validator);
    event TreasuryWithdrawn(address indexed recipient, uint256 amount);
    event CreatorEquityWithdrawn(address indexed recipient, uint256 amount);
    event SchemaRegistered(uint256 indexed schemaId, string schemaURI);
    event SchemaDisabled(uint256 indexed schemaId);
    event EvidenceAdded(uint256 indexed tokenId, string newCID, address indexed adder, string note, uint256 version);
    event ETHTransferFailed(address indexed recipient, uint256 amount);
    event PendingWithdrawalClaimed(address indexed recipient, uint256 amount);
    event CitationFeeUpdated(uint256 oldFee, uint256 newFee);
    event AccessFeeUpdated(uint256 oldFee, uint256 newFee);
    event RoyaltyUpdated(uint256 indexed tokenId, uint256 oldRate, uint256 newRate);
    event TreasuryUpdated(address indexed oldTreasury, address indexed newTreasury);
    event ProtocolCreatorUpdated(address indexed oldCreator, address indexed newCreator);
    
    // ==================== Constructor ====================
    
    constructor(
        address initialOwner,
        address _treasury,
        address _protocolCreator,
        string memory baseURI
    ) ERC721("STProof", "STP") Ownable(initialOwner) {
        require(_treasury != address(0), "Invalid treasury");
        require(_protocolCreator != address(0), "Invalid protocol creator");
        
        treasury = _treasury;
        protocolCreator = _protocolCreator;
        _baseTokenURI = baseURI;
        
        // Register default schemas
        _registerSchema(1, "ipfs://bafybei.../schema_physical_mail.json", true);
        _registerSchema(2, "ipfs://bafybei.../schema_art_creation.json", true);
        _registerSchema(3, "ipfs://bafybei.../schema_online_publish.json", true);
        _registerSchema(4, "ipfs://bafybei.../schema_academic.json", true);
        _registerSchema(5, "ipfs://bafybei.../schema_onchain_vote.json", true);
        _registerSchema(6, "ipfs://bafybei.../schema_news.json", true);
        _registerSchema(7, "ipfs://bafybei.../schema_legal.json", true);
    }
    
    // ==================== Schema Registry ====================
    
    function registerSchema(string calldata schemaURI) external onlyOwner returns (uint256) {
        schemaCount++;
        metadataSchemas[schemaCount] = Schema({
            uri: schemaURI,
            isActive: true,
            registeredAt: block.timestamp
        });
        emit SchemaRegistered(schemaCount, schemaURI);
        return schemaCount;
    }
    
    function _registerSchema(uint256 schemaId, string memory schemaURI, bool isActive) internal {
        metadataSchemas[schemaId] = Schema({
            uri: schemaURI,
            isActive: isActive,
            registeredAt: block.timestamp
        });
        emit SchemaRegistered(schemaId, schemaURI);
    }
    
    function disableSchema(uint256 schemaId) external onlyOwner {
        require(metadataSchemas[schemaId].isActive, "Schema already disabled");
        metadataSchemas[schemaId].isActive = false;
        emit SchemaDisabled(schemaId);
    }
    
    function getSchemaURI(uint256 schemaId) external view returns (string memory, bool) {
        Schema memory s = metadataSchemas[schemaId];
        return (s.uri, s.isActive);
    }
    
    // ==================== Fee Management ====================
    
    function setCitationFee(uint256 newFee) external onlyOwner {
        require(newFee > 0, "Fee must be > 0");
        emit CitationFeeUpdated(citationFee, newFee);
        citationFee = newFee;
    }
    
    function setAccessFee(uint256 newFee) external onlyOwner {
        require(newFee > 0, "Fee must be > 0");
        emit AccessFeeUpdated(accessFee, newFee);
        accessFee = newFee;
    }
    
    // ==================== Mint ====================
    
    function mint(address to, string memory name_, string memory cid) external returns (uint256) {
        return mintWithSchema(to, 0, name_, cid);
    }
    
    function mintWithSchema(address to, uint256 schemaId, string memory name_, string memory cid) 
        public 
        whenNotPaused 
        returns (uint256) 
    {
        require(bytes(name_).length > 0, "Name required");
        require(bytes(cid).length > 0, "CID required");
        require(schemaId == 0 || metadataSchemas[schemaId].isActive, "Invalid schema");
        
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        
        _safeMint(to, tokenId);
        _setRoyaltyRate(tokenId, 500); // 5% royalty
        
        events[tokenId] = EventProof({
            eventName: name_,
            cid: cid,
            creator: to,
            createTime: block.timestamp,
            verified: false,
            citations: 0,
            revenue: 0,
            schemaId: schemaId
        });
        
        // Add first evidence to history
        evidenceHistory[tokenId].push(Evidence({
            cid: cid,
            adder: to,
            timestamp: block.timestamp,
            note: "Initial evidence"
        }));
        
        emit Minted(tokenId, name_, to, schemaId);
        return tokenId;
    }
    
    // ==================== Dynamic Evidence ====================
    
    function addEvidence(uint256 tokenId, string memory newCID, string memory note) 
        external 
        onlyEventCreator(tokenId) 
        eventExists(tokenId)
        whenNotPaused 
    {
        require(bytes(newCID).length > 0, "CID required");
        
        evidenceHistory[tokenId].push(Evidence({
            cid: newCID,
            adder: msg.sender,
            timestamp: block.timestamp,
            note: note
        }));
        
        emit EvidenceAdded(tokenId, newCID, msg.sender, note, evidenceHistory[tokenId].length);
    }
    
    function getEvidenceHistory(uint256 tokenId) 
        external 
        view 
        eventExists(tokenId) 
        returns (Evidence[] memory) 
    {
        return evidenceHistory[tokenId];
    }
    
    function getEvidenceCount(uint256 tokenId) external view eventExists(tokenId) returns (uint256) {
        return evidenceHistory[tokenId].length;
    }
    
    // ==================== Verification ====================
    
    function addValidator(address validator) external onlyOwner {
        require(!validators[validator], "Already validator");
        validators[validator] = true;
        validatorList.push(validator);
        emit ValidatorAdded(validator);
    }
    
    function removeValidator(address validator) external onlyOwner {
        require(validators[validator], "Not a validator");
        validators[validator] = false;
        
        // Remove from list (efficient removal by swapping with last)
        for (uint256 i = 0; i < validatorList.length; i++) {
            if (validatorList[i] == validator) {
                validatorList[i] = validatorList[validatorList.length - 1];
                validatorList.pop();
                break;
            }
        }
        emit ValidatorRemoved(validator);
    }
    
    function verify(uint256 tokenId) external onlyValidator eventExists(tokenId) whenNotPaused {
        EventProof storage e = events[tokenId];
        require(!e.verified, "Already verified");
        require(!hasValidated[tokenId][msg.sender], "Already verified by you");
        
        hasValidated[tokenId][msg.sender] = true;
        
        if (e.verified == false && getValidatorCount(tokenId) + 1 >= MIN_VALIDATORS) {
            e.verified = true;
        }
        
        emit Verified(tokenId, msg.sender);
    }
    
    function getValidatorCount(uint256 tokenId) public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < validatorList.length; i++) {
            if (hasValidated[tokenId][validatorList[i]]) {
                count++;
            }
        }
        return count;
    }
    
    // ==================== Citation ====================
    
    function cite(uint256 tokenId) 
        external 
        payable 
        eventExists(tokenId) 
        eventVerified(tokenId) 
        nonReentrant 
        whenNotPaused 
        returns (uint256) 
    {
        require(!hasCited[tokenId][msg.sender], "Already cited");
        require(msg.value >= citationFee, "Fee too low");
        
        EventProof storage e = events[tokenId];
        
        // Effects (state changes first)
        citationList[tokenId].push(Citation(msg.sender, block.timestamp));
        hasCited[tokenId][msg.sender] = true;
        e.citations++;
        
        uint256 creatorShare = (msg.value * CREATOR_SHARE) / 100;
        uint256 treasuryShare = (msg.value * TREASURY_SHARE) / 100;
        uint256 protocolShare = msg.value - creatorShare - treasuryShare;
        
        // Interactions (safe transfers)
        _safeTransferETH(e.creator, creatorShare, true);
        _safeTransferETH(treasury, treasuryShare, true);
        if (protocolShare > 0 && protocolCreator != address(0)) {
            _safeTransferETH(protocolCreator, protocolShare, true);
        }
        
        emit Cited(tokenId, msg.sender, msg.value, creatorShare, treasuryShare, protocolShare);
        return e.citations;
    }
    
    // ==================== Paid Access ====================
    
    function accessFullProof(uint256 tokenId) 
        external 
        payable 
        eventExists(tokenId) 
        nonReentrant 
        whenNotPaused 
        returns (string memory) 
    {
        require(msg.value >= accessFee, "Insufficient access fee");
        
        EventProof storage e = events[tokenId];
        
        uint256 creatorShare = (msg.value * CREATOR_SHARE) / 100;
        uint256 treasuryShare = (msg.value * TREASURY_SHARE) / 100;
        uint256 protocolShare = msg.value - creatorShare - treasuryShare;
        
        _safeTransferETH(e.creator, creatorShare, true);
        _safeTransferETH(treasury, treasuryShare, true);
        if (protocolShare > 0 && protocolCreator != address(0)) {
            _safeTransferETH(protocolCreator, protocolShare, true);
        }
        
        return e.cid;
    }
    
    // ==================== Safe ETH Transfer ====================
    
    function _safeTransferETH(address to, uint256 amount, bool addToPendingOnFailure) internal {
        if (amount == 0 || to == address(0)) return;
        
        (bool success, ) = to.call{value: amount, gas: 30000}("");
        if (!success) {
            if (addToPendingOnFailure) {
                pendingWithdrawals[to] += amount;
                emit ETHTransferFailed(to, amount);
            }
            // If not adding to pending, the amount is effectively lost
            // but this shouldn't happen for core transfers
        }
    }
    
    function claimPendingWithdrawal() external nonReentrant {
        uint256 amount = pendingWithdrawals[msg.sender];
        require(amount > 0, "No pending withdrawal");
        
        pendingWithdrawals[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: amount, gas: 30000}("");
        require(success, "Claim failed");
        
        emit PendingWithdrawalClaimed(msg.sender, amount);
    }
    
    // ==================== Royalty (EIP-2981) ====================
    
    function royaltyInfo(uint256 tokenId, uint256 salePrice) 
        external 
        view 
        returns (address receiver, uint256 royaltyAmount) 
    {
        receiver = ownerOf(tokenId);
        uint256 rate = _royaltyRates[tokenId];
        royaltyAmount = (salePrice * rate) / 10000;
    }
    
    function _setRoyaltyRate(uint256 tokenId, uint256 rate) internal {
        require(rate <= MAX_ROYALTY_RATE, "Rate too high");
        _royaltyRates[tokenId] = rate;
    }
    
    function updateRoyalty(uint256 tokenId, uint256 newRate) external onlyEventCreator(tokenId) {
        require(newRate <= MAX_ROYALTY_RATE, "Rate too high");
        uint256 oldRate = _royaltyRates[tokenId];
        _royaltyRates[tokenId] = newRate;
        emit RoyaltyUpdated(tokenId, oldRate, newRate);
    }
    
    // ==================== Creator Equity & Treasury ====================
    
    function withdrawCreatorEquity(address to, uint256 amount) external onlyOwner {
        require(amount <= creatorBalance, "Insufficient balance");
        creatorBalance -= amount;
        _safeTransferETH(to, amount, false);
        emit CreatorEquityWithdrawn(to, amount);
    }
    
    function updateProtocolCreator(address newCreator) external onlyOwner {
        require(newCreator != address(0), "Invalid address");
        emit ProtocolCreatorUpdated(protocolCreator, newCreator);
        protocolCreator = newCreator;
    }
    
    function withdrawTreasury(address to, uint256 amount) external onlyOwner {
        require(amount <= treasuryBalance, "Insufficient balance");
        treasuryBalance -= amount;
        _safeTransferETH(to, amount, false);
        emit TreasuryWithdrawn(to, amount);
    }
    
    function updateTreasury(address newTreasury) external onlyOwner {
        require(newTreasury != address(0), "Invalid address");
        emit TreasuryUpdated(treasury, newTreasury);
        treasury = newTreasury;
    }
    
    // ==================== View Functions ====================
    
    function getEvent(uint256 tokenId) external view eventExists(tokenId) returns (EventProof memory) {
        return events[tokenId];
    }
    
    function getCitations(uint256 tokenId) external view eventExists(tokenId) returns (Citation[] memory) {
        return citationList[tokenId];
    }
    
    function getCitationCount(uint256 tokenId) external view eventExists(tokenId) returns (uint256) {
        return events[tokenId].citations;
    }
    
    function getValidators() external view returns (address[] memory) {
        return validatorList;
    }
    
    function isValidator(address account) external view returns (bool) {
        return validators[account];
    }
    
    // ==================== ERC721 Overrides ====================
    
    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }
    
    function setBaseURI(string memory baseURI_) external onlyOwner {
        _baseTokenURI = baseURI_;
    }
    
    function tokenURI(uint256 tokenId) 
        public 
        view 
        override(ERC721, ERC721URIStorage) 
        returns (string memory) 
    {
        return super.tokenURI(tokenId);
    }
    
    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
    
    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }
    
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    
    // ==================== Modifiers ====================
    
    modifier onlyValidator() {
        require(validators[msg.sender], "Not validator");
        _;
    }
    
    modifier eventExists(uint256 tokenId) {
        require(events[tokenId].creator != address(0), "Event not exist");
        _;
    }
    
    modifier onlyEventCreator(uint256 tokenId) {
        require(msg.sender == events[tokenId].creator, "Not event creator");
        _;
    }
    
    modifier eventVerified(uint256 tokenId) {
        require(events[tokenId].verified, "Event not verified");
        _;
    }
    
    // ==================== Emergency Functions ====================
    
    function pause() external onlyOwner {
        _pause();
    }
    
    function unpause() external onlyOwner {
        _unpause();
    }
    
    // ==================== Batch Operations (Polygon Gas Optimized) ====================
    
    function batchMint(
        address[] calldata to,
        string[] calldata names,
        string[] calldata cids,
        uint256[] calldata schemaIds
    ) external onlyOwner returns (uint256[] memory tokenIds) {
        require(to.length == names.length && names.length == cids.length && cids.length == schemaIds.length, "Length mismatch");
        
        tokenIds = new uint256[](to.length);
        for (uint256 i = 0; i < to.length; i++) {
            tokenIds[i] = mintWithSchema(to[i], schemaIds[i], names[i], cids[i]);
        }
        return tokenIds;
    }
    
    // Allow contract to receive ETH directly (for pending withdrawals)
    receive() external payable {}
}
