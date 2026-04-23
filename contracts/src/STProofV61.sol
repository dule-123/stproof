// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title STProof v6.1 - Spatial-Temporal Proof Protocol
 * @dev Protocol Version: 6.1 | Compliant with STProof Whitepaper v5.2 + Dynamic Evidence
 * 
 * New in v6.1:
 * - addEvidence() - Append new evidence CID to existing NFT
 * - getEvidenceHistory() - Query all evidence CIDs of an event
 * - EvidenceAdded event - Notify consumers when evidence is updated
 * 
 * Economic Model (same as v6):
 * - Royalty: 5% on secondary sales, 100% to event creator
 * - Citation Tax: 70% to creator, 28% to treasury, 2% to protocol creator
 * - Paid Access: 70% to creator, 28% to treasury, 2% to protocol creator
 */
contract STProofV61 {
    // ==================== Structs ====================
    
    struct EventProof {
        string eventName;
        string cid;                    // Primary CID (first evidence)
        address creator;
        uint256 createTime;
        bool verified;
        uint256 citations;
        uint256 revenue;
        address[] validators;
        uint256 schemaId;
    }
    
    struct Citation {
        address citer;
        uint256 timestamp;
    }
    
    // ==================== State Variables ====================
    
    uint256 private _tokenIdCounter;
    
    mapping(uint256 => EventProof) public events;
    mapping(uint256 => Citation[]) public citations;
    mapping(uint256 => mapping(address => bool)) public hasCited;
    mapping(address => bool) public validators;
    address[] public validatorList;
    
    // v6.1: Evidence history (dynamic append)
    mapping(uint256 => string[]) public evidenceHistory;
    mapping(uint256 => uint256) public evidenceCount;
    
    address public treasury;
    address public protocolCreator;
    uint256 public treasuryBalance;
    uint256 public creatorBalance;
    
    // Metadata Schema Registry
    mapping(uint256 => string) public metadataSchemas;
    uint256 public schemaCount;
    
    uint256 public constant CITATION_FEE = 0.0001 ether;
    uint256 public constant ACCESS_FEE = 0.001 ether;
    uint256 public constant MIN_VALIDATORS = 2;
    uint256 public constant CREATOR_SHARE = 70;
    uint256 public constant TREASURY_SHARE = 28;
    uint256 public constant PROTOCOL_CREATOR_SHARE = 2;
    
    address private _owner;
    
    // ERC-721 Metadata Extension
    string private _name = "STProof";
    string private _symbol = "STP";
    string private _baseURI = "https://stproof.org/api/metadata/";
    
    // tokenURI overrides (for dynamic metadata)
    mapping(uint256 => string) private _tokenURIs;
    
    // ==================== Events ====================
    
    event Minted(uint256 indexed tokenId, string name, address indexed creator, uint256 schemaId);
    event Verified(uint256 indexed tokenId, address indexed validator);
    event Cited(uint256 indexed tokenId, address indexed citer, uint256 fee);
    event ValidatorJoined(address indexed validator);
    event TreasuryWithdrawn(address indexed recipient, uint256 amount);
    event CreatorEquityWithdrawn(address indexed recipient, uint256 amount);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event SchemaRegistered(uint256 indexed schemaId, string schemaURI);
    
    // v6.1: New event for evidence update
    event EvidenceAdded(uint256 indexed tokenId, string newCID, uint256 timestamp, uint256 version);
    
    // ==================== Modifiers ====================
    
    modifier onlyOwner() {
        require(msg.sender == _owner, "Not owner");
        _;
    }
    
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
    
    // ==================== Constructor ====================
    
    constructor(address initialOwner, address _treasury, address _protocolCreator) {
        _owner = initialOwner;
        treasury = _treasury;
        protocolCreator = _protocolCreator;
        
        // Register default schemas
        _registerSchema(1, "ipfs://bafybei.../schema_physical_mail.json");
        _registerSchema(2, "ipfs://bafybei.../schema_art_creation.json");
        _registerSchema(3, "ipfs://bafybei.../schema_online_publish.json");
        _registerSchema(4, "ipfs://bafybei.../schema_academic.json");
        _registerSchema(5, "ipfs://bafybei.../schema_onchain_vote.json");
        _registerSchema(6, "ipfs://bafybei.../schema_news.json");
        _registerSchema(7, "ipfs://bafybei.../schema_legal.json");
    }
    
    // ==================== Schema Registry ====================
    
    function registerSchema(string calldata schemaURI) external onlyOwner returns (uint256) {
        schemaCount++;
        metadataSchemas[schemaCount] = schemaURI;
        emit SchemaRegistered(schemaCount, schemaURI);
        return schemaCount;
    }
    
    function _registerSchema(uint256 schemaId, string memory schemaURI) internal {
        metadataSchemas[schemaId] = schemaURI;
        emit SchemaRegistered(schemaId, schemaURI);
    }
    
    function getSchemaURI(uint256 schemaId) external view returns (string memory) {
        return metadataSchemas[schemaId];
    }
    
    // ==================== ERC-721 Metadata Extension ====================
    
    function name() public view returns (string memory) {
        return _name;
    }
    
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
    function setBaseURI(string memory baseURI_) external onlyOwner {
        _baseURI = baseURI_;
    }
    
    function setTokenURI(uint256 tokenId, string memory _tokenURI) external onlyOwner eventExists(tokenId) {
        _tokenURIs[tokenId] = _tokenURI;
    }
    
    function tokenURI(uint256 tokenId) public view eventExists(tokenId) returns (string memory) {
        if (bytes(_tokenURIs[tokenId]).length > 0) {
            return _tokenURIs[tokenId];
        }
        
        EventProof storage e = events[tokenId];
        
        string memory json = string(abi.encodePacked(
            '{"name":"', e.eventName, '",',
            '"description":"STProof Event NFT",',
            '"attributes":[',
                '{"trait_type":"verified","value":"', e.verified ? "true" : "false", '"},',
                '{"trait_type":"citations","value":', _uint2str(e.citations), '}',
            '],',
            '"stproof_cid":"', e.cid, '"',
            "}"
        ));
        
        return string(abi.encodePacked(_baseURI, json));
    }
    
    function _uint2str(uint256 value) internal pure returns (string memory) {
        if (value == 0) return "0";
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits--;
            buffer[digits] = bytes1(uint8(48 + value % 10));
            value /= 10;
        }
        return string(buffer);
    }
    
    // ==================== ERC-721 Core ====================
    
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;
    
    function balanceOf(address owner_) public view returns (uint256) {
        require(owner_ != address(0), "Zero address");
        return _balances[owner_];
    }
    
    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner_ = _owners[tokenId];
        require(owner_ != address(0), "Token not exist");
        return owner_;
    }
    
    function getApproved(uint256 tokenId) public view returns (address) {
        require(_owners[tokenId] != address(0), "Token not exist");
        return _tokenApprovals[tokenId];
    }
    
    function isApprovedForAll(address owner_, address operator) public view returns (bool) {
        return _operatorApprovals[owner_][operator];
    }
    
    function approve(address to, uint256 tokenId) public {
        address owner_ = ownerOf(tokenId);
        require(msg.sender == owner_ || isApprovedForAll(owner_, msg.sender), "Not authorized");
        _tokenApprovals[tokenId] = to;
    }
    
    function setApprovalForAll(address operator, bool approved) public {
        _operatorApprovals[msg.sender][operator] = approved;
    }
    
    function transferFrom(address from, address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "Not authorized");
        require(to != address(0), "Zero address");
        _transfer(from, to, tokenId);
    }
    
    function safeTransferFrom(address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId, "");
    }
    
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "Not authorized");
        _safeTransfer(from, to, tokenId, data);
    }
    
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        address owner_ = ownerOf(tokenId);
        return (spender == owner_ || getApproved(tokenId) == spender || isApprovedForAll(owner_, spender));
    }
    
    function _safeTransfer(address from, address to, uint256 tokenId, bytes memory data) internal {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, data), "Transfer not accepted");
    }
    
    function _transfer(address from, address to, uint256 tokenId) internal {
        require(ownerOf(tokenId) == from, "Wrong from");
        require(to != address(0), "Zero address");
        _approve(address(0), tokenId);
        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;
    }
    
    function _approve(address to, uint256 tokenId) internal {
        _tokenApprovals[tokenId] = to;
    }
    
    function _checkOnERC721Received(address from, address to, uint256 tokenId, bytes memory data) internal returns (bool) {
        if (to.code.length == 0) {
            return true;
        }
        (bool success, bytes memory returndata) = to.call(abi.encodeWithSignature("onERC721Received(address,address,uint256,bytes)", msg.sender, from, tokenId, data));
        return success && returndata.length > 0 && abi.decode(returndata, (bytes4)) == 0x150b7a02;
    }
    
    function _safeMint(address to, uint256 tokenId) internal {
        _mint(to, tokenId);
        require(_checkOnERC721Received(address(0), to, tokenId, ""), "Transfer not accepted");
    }
    
    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "Zero address");
        require(_owners[tokenId] == address(0), "Already minted");
        _balances[to] += 1;
        _owners[tokenId] = to;
    }
    
    // ==================== EIP-2981 Royalty ====================
    
    mapping(uint256 => address) private _royaltyRecipients;
    mapping(uint256 => uint256) private _royaltyRates;
    
    function royaltyInfo(uint256 tokenId, uint256 salePrice) public view returns (address receiver, uint256 royaltyAmount) {
        receiver = _royaltyRecipients[tokenId];
        uint256 rate = _royaltyRates[tokenId];
        royaltyAmount = (salePrice * rate) / 10000;
    }
    
    function _setTokenRoyalty(uint256 tokenId, address recipient, uint256 rate) internal {
        require(rate <= 10000, "Rate too high");
        _royaltyRecipients[tokenId] = recipient;
        _royaltyRates[tokenId] = rate;
    }
    
    // ==================== Mint ====================
    
    function mint(address to, string memory name_, string memory cid) external returns (uint256) {
        return mintWithSchema(to, 0, name_, cid);
    }
    
    function mintWithSchema(address to, uint256 schemaId, string memory name_, string memory cid) public returns (uint256) {
        require(bytes(name_).length > 0, "Name required");
        
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;
        
        _safeMint(to, tokenId);
        _setTokenRoyalty(tokenId, to, 500);
        
        events[tokenId] = EventProof({
            eventName: name_,
            cid: cid,
            creator: to,
            createTime: block.timestamp,
            verified: false,
            citations: 0,
            revenue: 0,
            validators: new address[](0),
            schemaId: schemaId
        });
        
        // v6.1: Add first evidence to history
        evidenceHistory[tokenId].push(cid);
        evidenceCount[tokenId] = 1;
        
        emit Minted(tokenId, name_, to, schemaId);
        return tokenId;
    }
    
    // ==================== v6.1: Dynamic Evidence ====================
    
    /**
     * @dev Add new evidence CID to an existing NFT
     * @param tokenId The token ID to add evidence to
     * @param newCID The new IPFS CID pointing to additional evidence
     */
    function addEvidence(uint256 tokenId, string memory newCID) external onlyEventCreator(tokenId) eventExists(tokenId) {
        require(bytes(newCID).length > 0, "CID required");
        
        evidenceHistory[tokenId].push(newCID);
        evidenceCount[tokenId]++;
        
        emit EvidenceAdded(tokenId, newCID, block.timestamp, evidenceCount[tokenId]);
    }
    
    /**
     * @dev Get all evidence CIDs for a token (including primary and appended)
     * @param tokenId The token ID to query
     * @return Array of all evidence CIDs in chronological order
     */
    function getEvidenceHistory(uint256 tokenId) external view eventExists(tokenId) returns (string[] memory) {
        return evidenceHistory[tokenId];
    }
    
    /**
     * @dev Get evidence count for a token
     * @param tokenId The token ID to query
     * @return Number of evidence entries
     */
    function getEvidenceCount(uint256 tokenId) external view eventExists(tokenId) returns (uint256) {
        return evidenceCount[tokenId];
    }
    
    // ==================== Verification ====================
    
    function verify(uint256 tokenId) external onlyValidator eventExists(tokenId) {
        EventProof storage e = events[tokenId];
        require(!e.verified, "Already verified");
        
        for (uint i = 0; i < e.validators.length; i++) {
            require(e.validators[i] != msg.sender, "Already verified by you");
        }
        
        e.validators.push(msg.sender);
        
        if (e.validators.length >= MIN_VALIDATORS) {
            e.verified = true;
        }
        
        emit Verified(tokenId, msg.sender);
    }
    
    function join() external {
        require(!validators[msg.sender], "Already validator");
        validators[msg.sender] = true;
        validatorList.push(msg.sender);
        emit ValidatorJoined(msg.sender);
    }
    
    // ==================== Citation ====================
    
    function cite(uint256 tokenId) external payable eventExists(tokenId) eventVerified(tokenId) returns (uint256) {
        EventProof storage e = events[tokenId];
        require(!hasCited[tokenId][msg.sender], "Already cited");
        require(msg.value >= CITATION_FEE, "Fee too low");
        
        citations[tokenId].push(Citation(msg.sender, block.timestamp));
        hasCited[tokenId][msg.sender] = true;
        e.citations++;
        
        uint256 eventCreatorShare = (msg.value * CREATOR_SHARE) / 100;
        uint256 treasuryShare = (msg.value * TREASURY_SHARE) / 100;
        uint256 protocolCreatorShare = msg.value - eventCreatorShare - treasuryShare;
        
        (bool success, ) = payable(e.creator).call{value: eventCreatorShare}("");
        require(success, "Event creator payment failed");
        e.revenue += eventCreatorShare;
        
        if (treasuryShare > 0) {
            (success, ) = payable(treasury).call{value: treasuryShare}("");
            require(success, "Treasury payment failed");
            treasuryBalance += treasuryShare;
        }
        
        if (protocolCreatorShare > 0 && protocolCreator != address(0)) {
            (success, ) = payable(protocolCreator).call{value: protocolCreatorShare}("");
            require(success, "Protocol creator payment failed");
            creatorBalance += protocolCreatorShare;
        }
        
        emit Cited(tokenId, msg.sender, msg.value);
        return e.citations;
    }
    
    // ==================== Paid Access ====================
    
    function accessFullProof(uint256 tokenId) external payable eventExists(tokenId) returns (string memory) {
        require(msg.value >= ACCESS_FEE, "Insufficient access fee");
        
        EventProof storage e = events[tokenId];
        
        uint256 eventCreatorShare = (msg.value * CREATOR_SHARE) / 100;
        uint256 treasuryShare = (msg.value * TREASURY_SHARE) / 100;
        uint256 protocolCreatorShare = msg.value - eventCreatorShare - treasuryShare;
        
        (bool success, ) = payable(e.creator).call{value: eventCreatorShare}("");
        require(success, "Event creator payment failed");
        
        if (treasuryShare > 0) {
            (success, ) = payable(treasury).call{value: treasuryShare}("");
            require(success, "Treasury payment failed");
            treasuryBalance += treasuryShare;
        }
        
        if (protocolCreatorShare > 0 && protocolCreator != address(0)) {
            (success, ) = payable(protocolCreator).call{value: protocolCreatorShare}("");
            require(success, "Protocol creator payment failed");
            creatorBalance += protocolCreatorShare;
        }
        
        return e.cid;
    }
    
    // ==================== View Functions ====================
    
    function getEvent(uint256 tokenId) external view eventExists(tokenId) returns (EventProof memory) {
        return events[tokenId];
    }
    
    function getCitations(uint256 tokenId) external view eventExists(tokenId) returns (Citation[] memory) {
        return citations[tokenId];
    }
    
    function getValidators() external view returns (address[] memory) {
        return validatorList;
    }
    
    function getCitationCount(uint256 tokenId) external view eventExists(tokenId) returns (uint256) {
        return events[tokenId].citations;
    }
    
    // ==================== Creator Equity ====================
    
    function withdrawCreatorEquity(address to, uint256 amount) external {
        require(msg.sender == protocolCreator, "Only protocol creator");
        require(amount <= creatorBalance, "Insufficient balance");
        creatorBalance -= amount;
        (bool success, ) = payable(to).call{value: amount}("");
        require(success, "Withdraw failed");
        emit CreatorEquityWithdrawn(to, amount);
    }
    
    function updateProtocolCreator(address newCreator) external onlyOwner {
        require(newCreator != address(0), "Invalid address");
        protocolCreator = newCreator;
    }
    
    // ==================== Treasury ====================
    
    function withdrawTreasury(address to, uint256 amount) external onlyOwner {
        require(amount <= treasuryBalance, "Insufficient balance");
        treasuryBalance -= amount;
        (bool success, ) = payable(to).call{value: amount}("");
        require(success, "Withdraw failed");
        emit TreasuryWithdrawn(to, amount);
    }
    
    function updateTreasury(address newTreasury) external onlyOwner {
        require(newTreasury != address(0), "Invalid address");
        treasury = newTreasury;
    }
    
    // ==================== Ownable ====================
    
    function owner() public view returns (address) {
        return _owner;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
    
    // ==================== ERC165 ====================
    
    function supportsInterface(bytes4 interfaceId) public pure returns (bool) {
        return
            interfaceId == 0x01ffc9a7 ||  // ERC165
            interfaceId == 0x80ac58cd ||  // ERC721
            interfaceId == 0x5b5e139f ||  // ERC721Metadata
            interfaceId == 0x2a55205a;    // EIP-2981
    }
}
