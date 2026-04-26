// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title STProof v6.3 - Event NFT with Manual Withdrawal & Attestation
 * @dev Inherits v6.2 features + manual revenue claim + validator attestations
 * 
 * New in v6.3:
 * - Revenue is held in contract, creators/treasury/protocolCreator must withdraw manually.
 * - Attestations: validators can add signed comments (CIDs) to any event.
 * - No automatic transfers → reduces securities risk.
 */
contract STProofV63 {
    // ==================== Structs ====================
    
    struct EventProof {
        string eventName;
        string cid;
        address creator;
        uint256 createTime;
        bool verified;
        uint256 citations;
        uint256 revenue;                // total claimed revenue (for info only)
        address[] validators;
        uint256 schemaId;
        uint256 editionNumber;
        uint256 totalEditions;
    }
    
    struct Citation {
        address citer;
        uint256 timestamp;
    }
    
    struct Attestation {
        address validator;
        string commentCID;
        uint256 timestamp;
    }
    
    // ==================== State Variables ====================
    
    uint256 private _tokenIdCounter;
    
    mapping(uint256 => EventProof) public events;
    mapping(uint256 => Citation[]) public citations;
    mapping(uint256 => mapping(address => bool)) public hasCited;
    mapping(address => bool) public validators;
    address[] public validatorList;
    
    // Evidence history
    mapping(uint256 => string[]) public evidenceHistory;
    mapping(uint256 => uint256) public evidenceCount;
    
    // Fixed edition prevention
    mapping(string => bool) public evidenceCIDMinted;
    
    // Revenue pending – manual withdrawal
    mapping(address => uint256) public pendingCreatorRevenue;   // for event creators
    uint256 public pendingTreasuryRevenue;
    uint256 public pendingProtocolCreatorRevenue;
    
    // Attestations
    mapping(uint256 => Attestation[]) public attestations;
    
    address public treasury;
    address public protocolCreator;
    uint256 public treasuryBalance;      // already withdrawn by treasury
    uint256 public creatorBalance;       // already withdrawn by protocol creator
    
    uint256 public constant CITATION_FEE = 0.0001 ether;
    uint256 public constant ACCESS_FEE = 0.001 ether;
    uint256 public constant MIN_VALIDATORS = 2;
    uint256 public constant CREATOR_SHARE = 70;
    uint256 public constant TREASURY_SHARE = 28;
    uint256 public constant PROTOCOL_CREATOR_SHARE = 2;
    
    address private _owner;
    
    string private _name = "STProof";
    string private _symbol = "STP";
    string private _baseURI = "https://stproof.org/api/metadata/";
    mapping(uint256 => string) private _tokenURIs;
    
    // ==================== Events ====================
    
    event Minted(uint256 indexed tokenId, string name, address indexed creator, uint256 schemaId, uint256 edition, uint256 total);
    event Verified(uint256 indexed tokenId, address indexed validator);
    event Cited(uint256 indexed tokenId, address indexed citer, uint256 fee, uint256 creatorShare, uint256 treasuryShare, uint256 protocolShare);
    event ValidatorJoined(address indexed validator);
    event TreasuryWithdrawn(address indexed recipient, uint256 amount);
    event CreatorEquityWithdrawn(address indexed recipient, uint256 amount);
    event RevenueWithdrawn(address indexed recipient, uint256 amount, string role); // "creator", "treasury", "protocol"
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event EvidenceAdded(uint256 indexed tokenId, string newCID, uint256 timestamp, uint256 version);
    event EditionSetMinted(string indexed cid, uint256 totalEditions, address creator);
    event AttestationAdded(uint256 indexed tokenId, address indexed validator, string commentCID, uint256 timestamp);
    
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
    }
    
    // ==================== Ownership ====================
    
    function owner() public view returns (address) {
        return _owner;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
    
    // ==================== ERC721 Core ====================
    
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;
    
    function name() public view returns (string memory) {
        return _name;
    }
    
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
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
        require(_checkOnERC721Received(from, to, tokenId, data), "Transfer failed");
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
        if (to.code.length == 0) return true;
        (bool success, bytes memory ret) = to.call(abi.encodeWithSignature("onERC721Received(address,address,uint256,bytes)", msg.sender, from, tokenId, data));
        return success && ret.length > 0 && abi.decode(ret, (bytes4)) == 0x150b7a02;
    }
    
    function _safeMint(address to, uint256 tokenId) internal {
        _mint(to, tokenId);
        require(_checkOnERC721Received(address(0), to, tokenId, ""), "Transfer failed");
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
        royaltyAmount = (salePrice * _royaltyRates[tokenId]) / 10000;
    }
    
    function _setTokenRoyalty(uint256 tokenId, address recipient, uint256 rate) internal {
        require(rate <= 10000, "Rate too high");
        _royaltyRecipients[tokenId] = recipient;
        _royaltyRates[tokenId] = rate;
    }
    
    // ==================== Single Mint (legacy) ====================
    
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
            schemaId: schemaId,
            editionNumber: 0,
            totalEditions: 0
        });
        
        evidenceHistory[tokenId].push(cid);
        evidenceCount[tokenId] = 1;
        
        emit Minted(tokenId, name_, to, schemaId, 0, 0);
        return tokenId;
    }
    
    // ==================== Fixed‑Edition Batch Mint ====================
    
    function mintEditionSet(
        address to,
        uint256 schemaId,
        string memory eventName,
        string memory cid,
        uint256 totalEditions
    ) external returns (uint256[] memory tokenIds) {
        require(totalEditions > 0 && totalEditions <= 10000, "Invalid edition count");
        require(bytes(eventName).length > 0, "Name required");
        require(!evidenceCIDMinted[cid], "Event already minted as fixed set");
        
        evidenceCIDMinted[cid] = true;
        tokenIds = new uint256[](totalEditions);
        
        for (uint256 i = 0; i < totalEditions; i++) {
            uint256 tokenId = _tokenIdCounter;
            _tokenIdCounter++;
            
            _safeMint(to, tokenId);
            _setTokenRoyalty(tokenId, to, 500);
            
            events[tokenId] = EventProof({
                eventName: eventName,
                cid: cid,
                creator: to,
                createTime: block.timestamp,
                verified: false,
                citations: 0,
                revenue: 0,
                validators: new address[](0),
                schemaId: schemaId,
                editionNumber: i + 1,
                totalEditions: totalEditions
            });
            
            evidenceHistory[tokenId].push(cid);
            evidenceCount[tokenId] = 1;
            
            emit Minted(tokenId, eventName, to, schemaId, i + 1, totalEditions);
            tokenIds[i] = tokenId;
        }
        
        emit EditionSetMinted(cid, totalEditions, to);
    }
    
    // ==================== Dynamic Evidence ====================
    
    function addEvidence(uint256 tokenId, string memory newCID) external onlyEventCreator(tokenId) eventExists(tokenId) {
        require(bytes(newCID).length > 0, "CID required");
        evidenceHistory[tokenId].push(newCID);
        evidenceCount[tokenId]++;
        emit EvidenceAdded(tokenId, newCID, block.timestamp, evidenceCount[tokenId]);
    }
    
    function getEvidenceHistory(uint256 tokenId) external view eventExists(tokenId) returns (string[] memory) {
        return evidenceHistory[tokenId];
    }
    
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
    
    // ==================== Attestations (NEW) ====================
    
    function addAttestation(uint256 tokenId, string memory commentCID) external onlyValidator eventExists(tokenId) {
        require(bytes(commentCID).length > 0, "Comment CID required");
        attestations[tokenId].push(Attestation({
            validator: msg.sender,
            commentCID: commentCID,
            timestamp: block.timestamp
        }));
        emit AttestationAdded(tokenId, msg.sender, commentCID, block.timestamp);
    }
    
    function getAttestations(uint256 tokenId) external view eventExists(tokenId) returns (Attestation[] memory) {
        return attestations[tokenId];
    }
    
    // ==================== Citation (Manual Revenue) ====================
    
    function cite(uint256 tokenId) external payable eventExists(tokenId) eventVerified(tokenId) returns (uint256) {
        EventProof storage e = events[tokenId];
        require(!hasCited[tokenId][msg.sender], "Already cited");
        require(msg.value >= CITATION_FEE, "Fee too low");
        
        citations[tokenId].push(Citation(msg.sender, block.timestamp));
        hasCited[tokenId][msg.sender] = true;
        e.citations++;
        
        uint256 creatorShare = (msg.value * CREATOR_SHARE) / 100;
        uint256 treasuryShare = (msg.value * TREASURY_SHARE) / 100;
        uint256 protocolShare = msg.value - creatorShare - treasuryShare;
        
        // Store pending revenue instead of sending immediately
        pendingCreatorRevenue[e.creator] += creatorShare;
        pendingTreasuryRevenue += treasuryShare;
        pendingProtocolCreatorRevenue += protocolShare;
        
        // Keep revenue field as total ever earned (for info)
        e.revenue += creatorShare;
        
        emit Cited(tokenId, msg.sender, msg.value, creatorShare, treasuryShare, protocolShare);
        return e.citations;
    }
    
    function accessFullProof(uint256 tokenId) external payable eventExists(tokenId) returns (string memory) {
        require(msg.value >= ACCESS_FEE, "Fee too low");
        EventProof storage e = events[tokenId];
        
        uint256 creatorShare = (msg.value * CREATOR_SHARE) / 100;
        uint256 treasuryShare = (msg.value * TREASURY_SHARE) / 100;
        uint256 protocolShare = msg.value - creatorShare - treasuryShare;
        
        pendingCreatorRevenue[e.creator] += creatorShare;
        pendingTreasuryRevenue += treasuryShare;
        pendingProtocolCreatorRevenue += protocolShare;
        
        return e.cid;
    }
    
    // ==================== Manual Withdrawal ====================
    
    function withdrawRevenue() external {
        uint256 amount = pendingCreatorRevenue[msg.sender];
        require(amount > 0, "No pending revenue");
        pendingCreatorRevenue[msg.sender] = 0;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Withdrawal failed");
        emit RevenueWithdrawn(msg.sender, amount, "creator");
    }
    
    function withdrawTreasury() external {
        require(msg.sender == treasury, "Only treasury");
        uint256 amount = pendingTreasuryRevenue;
        require(amount > 0, "No pending revenue");
        pendingTreasuryRevenue = 0;
        (bool success, ) = payable(treasury).call{value: amount}("");
        require(success, "Withdrawal failed");
        treasuryBalance += amount;
        emit RevenueWithdrawn(treasury, amount, "treasury");
    }
    
    function withdrawProtocolCreator() external {
        require(msg.sender == protocolCreator, "Only protocol creator");
        uint256 amount = pendingProtocolCreatorRevenue;
        require(amount > 0, "No pending revenue");
        pendingProtocolCreatorRevenue = 0;
        (bool success, ) = payable(protocolCreator).call{value: amount}("");
        require(success, "Withdrawal failed");
        creatorBalance += amount;
        emit RevenueWithdrawn(protocolCreator, amount, "protocol");
    }
    
    // ==================== Metadata & Views ====================
    
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
        string memory json;
        
        if (e.totalEditions > 0) {
            json = string(abi.encodePacked(
                '{"name":"', e.eventName, ' #', _uint2str(e.editionNumber), '",',
                '"description":"STProof Event NFT - Fixed Edition (', _uint2str(e.totalEditions), ')",',
                '"attributes":[',
                    '{"trait_type":"Edition","value":"', _uint2str(e.editionNumber), '/', _uint2str(e.totalEditions), '"},',
                    '{"trait_type":"Verified","value":"', e.verified ? "true" : "false", '"},',
                    '{"trait_type":"Citations","value":', _uint2str(e.citations), '}',
                '],',
                '"stproof_cid":"', e.cid, '"',
                "}"
            ));
        } else {
            json = string(abi.encodePacked(
                '{"name":"', e.eventName, '",',
                '"description":"STProof Event NFT",',
                '"attributes":[',
                    '{"trait_type":"Verified","value":"', e.verified ? "true" : "false", '"},',
                    '{"trait_type":"Citations","value":', _uint2str(e.citations), '}',
                '],',
                '"stproof_cid":"', e.cid, '"',
                "}"
            ));
        }
        
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
    
    // ==================== Management ====================
    
    function updateProtocolCreator(address newCreator) external onlyOwner {
        require(newCreator != address(0), "Invalid address");
        protocolCreator = newCreator;
    }
    
    function updateTreasury(address newTreasury) external onlyOwner {
        require(newTreasury != address(0), "Invalid address");
        treasury = newTreasury;
    }
    
    // ==================== ERC165 ====================
    
    function supportsInterface(bytes4 interfaceId) public pure returns (bool) {
        return
            interfaceId == 0x01ffc9a7 ||
            interfaceId == 0x80ac58cd ||
            interfaceId == 0x5b5e139f ||
            interfaceId == 0x2a55205a;
    }
}
