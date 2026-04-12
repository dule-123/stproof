// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title STProof - Spatial-Temporal Proof Protocol
 * @dev Protocol Version: 5.2 | Compliant with STProof Whitepaper v5.2
 * 
 * @notice This NFT certifies the occurrence of an event only, and does NOT 
 *         represent ownership, authenticity, or any rights related to physical objects.
 *         Physical objects belong to the physical world; events belong to the 
 *         blockchain world. NFT locks only events, not objects.
 * 
 * @notice Core Methodology: Zero-Knowledge Thought Attestation
 *         - Completeness: A real event can always construct a verifiable evidence chain
 *         - Soundness: A fake event cannot pass the evidence verification
 *         - Zero-Knowledge: Verifiers only learn that "the event is true", 
 *           without accessing sensitive information, original images/IP, 
 *           trade secrets, or private content.
 * 
 * @dev Genesis Event: STProof Self-Referential Experiment (Meta Event)
 *      The first NFT minted by this contract can certify the birth of STProof itself,
 *      completing the self-referential loop of digital civilization.
 * 
 * Economic Model (Whitepaper v5.2):
 * - Royalty: 5% on secondary sales, 100% to event creator
 * - Citation Tax: 70% to creator, 28% to treasury, 2% to protocol creator
 * - Paid Access: 70% to creator, 28% to treasury, 2% to protocol creator
 * - Template Fee: 3% to template creator (reserved for future)
 */
contract STProof {
    // ==================== Structs ====================
    
    struct EventProof {
        string eventName;
        string cid;
        address creator;
        uint256 createTime;
        bool verified;
        uint256 citations;
        uint256 revenue;
        address[] validators;
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
    
    address public treasury;
    address public protocolCreator;
    uint256 public treasuryBalance;
    uint256 public creatorBalance;
    
    uint256 public constant CITATION_FEE = 0.0001 ether;
    uint256 public constant ACCESS_FEE = 0.001 ether;
    uint256 public constant MIN_VALIDATORS = 2;
    uint256 public constant CREATOR_SHARE = 70;
    uint256 public constant TREASURY_SHARE = 28;
    uint256 public constant PROTOCOL_CREATOR_SHARE = 2;
    
    address private _owner;
    
    // ==================== Events ====================
    
    event Minted(uint256 indexed tokenId, string name, address indexed creator);
    event Verified(uint256 indexed tokenId, address indexed validator);
    event Cited(uint256 indexed tokenId, address indexed citer, uint256 fee, uint256 creatorShare, uint256 treasuryShare, uint256 protocolCreatorShare);
    event AccessPaid(uint256 indexed tokenId, address indexed payer, uint256 fee);
    event ValidatorJoined(address indexed validator);
    event TreasuryWithdrawn(address indexed recipient, uint256 amount);
    event CreatorEquityWithdrawn(address indexed recipient, uint256 amount);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    
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
    
    modifier eventVerified(uint256 tokenId) {
        require(events[tokenId].verified, "Event not verified");
        _;
    }
    
    // ==================== Constructor ====================
    
    constructor(address owner, address _treasury, address _protocolCreator) {
        _owner = owner;
        treasury = _treasury;
        protocolCreator = _protocolCreator;
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
    
    // ==================== ERC721 ====================
    
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;
    
    string private _name = "STProof";
    string private _symbol = "STP";
    
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
            validators: new address[](0)
        });
        emit Minted(tokenId, name_, to);
        return tokenId;
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
        emit Cited(tokenId, msg.sender, msg.value, eventCreatorShare, treasuryShare, protocolCreatorShare);
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
        emit AccessPaid(tokenId, msg.sender, msg.value);
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
    
    // ==================== ERC165 ====================
    
    function supportsInterface(bytes4 interfaceId) public pure returns (bool) {
        return
            interfaceId == 0x01ffc9a7 ||
            interfaceId == 0x80ac58cd ||
            interfaceId == 0x5b5e139f ||
            interfaceId == 0x2a55205a;
    }
}
