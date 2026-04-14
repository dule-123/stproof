---
layout: page
title: STProof Protocol Whitepaper v5.2
hide: true
---

# STProof Protocol Whitepaper 

**Version v5.2 | April 2026**

**Core Positioning: Digital Civilization Fact Layer | Event Certification Infrastructure Protocol**

**Genesis Event: STProof Self-Referential Experiment (Meta Event)**

**Core Methodology: Zero-Knowledge Thought Attestation**

**Core DNA: Metadata Standardization**

---

## Title Page

**STProof: Certify events, not assets.**

Proof exists with physical objects, and even without.

All that happens shall be stored; all stored proofs shall be trusted.

**Core Declaration**

Physical objects belong to the physical world; events belong to the blockchain world.

NFTs lock only **events**, not objects.

Recording facts should have no financial barrier. Technology should not create new inequality.

**Genesis Anchor**

The first certified event of this protocol is the birth of STProof itself.

Using STProof to certify STProof completes the self-referential loop of digital civilization.

---

## Abstract

STProof (Spatial-Temporal Proof) is a universal on-chain certification and value-capture protocol for **objective historical events**. Through multi-source evidence cross-verification, trusted timestamps, decentralized storage, and on-chain anchoring, it transforms real events into permanent, immutable digital records.

The protocol certifies **events themselves** — not physical assets, not digital content, not any form of real-world asset mapping — completely eliminating RWA risks.

The protocol adopts **Zero-Knowledge Thought Attestation** as its underlying methodology and **Metadata Standardization** as its core DNA, making every event NFT a **programmable, composable, and parseable** digital fact unit.

The economic model adheres to **equality-first** principles: anyone can mint an Event NFT by paying only gas fees, with no additional barriers. Event value comes from **being cited, used, and trusted**.

To ensure long-term protocol iteration, technical maintenance, and ecosystem security, the **Protocol Creator enjoys a permanent, transparent, on-chain verifiable 2% equity**.

---

## Table of Contents

1. Introduction: The Challenge of Recording Facts in the Physical World
2. STProof: The Event Certification Protocol
   - 2.1 Definition
   - 2.2 Core Elements
   - 2.3 Event Templates: The Extensible Foundation
   - 2.4 Evidence Collection and Verification Standards
   - 2.5 Physical Object Retention Mechanism (Optional)
   - 2.6 Minting and Moderation: Balancing Openness and Order
   - 2.7 Core Methodology: Zero-Knowledge Thought Attestation
3. The Relationship Between Physical Objects and NFTs: The Event Certification Model
4. Protocol Architecture
5. **Metadata Standardization: The Universal Expression Layer of Event DNA**
   - 5.1 Why Metadata Standardization?
   - 5.2 Design Principles
   - 5.3 STProof Metadata Standard v1
   - 5.4 Event Type Schema Registry
   - 5.5 Smart Contract Enhancements (v6 Direction)
   - 5.6 Indexers and Cross-Protocol Composability
   - 5.7 Value Delivered by Metadata Standardization
6. Economic Model: Equality-First Incentive Mechanism
   - 6.1 Roles and Revenue Sources
   - 6.2 Minting and Verification Mechanisms
   - 6.3 Resale Royalties
   - 6.4 On-Chain Citation: Value Comes from Use
   - 6.5 Dual-Layer Mechanism and Paid Access
   - 6.6 Multi-Dimensional Extension of Event Value
   - 6.7 Summary of the Three-Tier Value Capture Model
   - 6.8 Protocol Treasury Management
   - 6.9 Economic Model Advantages
   - 6.10 Creator Equity
7. Compliance and Legal Considerations
8. Smart Contract Implementation
9. First Use Case: STProof Self-Referential Experiment (Meta Event)
10. Future Outlook: Event Template Roadmap and Ecosystem Development
11. Ecosystem Launch Path and Roadmap
12. Protocol Boundaries
13. Conclusion

---

## 1. Introduction: The Challenge of Recording Facts in the Physical World

Human civilization depends on recording "facts." From stone carvings and parchment to digital archives, we have always sought more reliable ways to preserve history. Yet today, amid the explosion of information and AI forgery technologies, the **authenticity of facts** faces unprecedented challenges.

- Traditional recording relies on centralized institutions (notaries, archives, experts), which suffer from high costs, vulnerability to tampering, and difficulty in cross-border verification.
- Blockchain and NFTs provide decentralized, tamper-proof carriers, but most NFTs only anchor "digital files" and lack rigid connections to real-world events.
- Oracles feed off-chain data (prices, weather) on-chain but only handle API-standardized data, not unique, non-standard events requiring human judgment.

Was a stamp really mailed on its first day? Was a painting really made by a certain artist? Was a cultural relic really unearthed at a certain site? Was an article really first published at a specific time?

These questions cannot be answered by APIs, yet they form an essential part of human history and digital civilization.

The STProof protocol was created to fill this gap.

---

## 2. STProof: The Event Certification Protocol

### 2.1 Definition

STProof is a universal on-chain certification and value-capture protocol for **events**. It certifies **objective historical events** — not physical assets or digital content — enabling a consistent, trusted mechanism across all scenarios and forms.

Three categories of events are supported:

| Event Type | Definition | Examples |
|------------|------------|----------|
| Physical Event | Physical object serves as the on-site carrier | First-day cover mailing, artwork creation, porcelain firing, relic excavation |
| Non-Physical Event | Pure digital or behavioral events with no physical form | Online publication, on-chain voting, opinion statement, academic release |
| Hybrid Event | Physical elements exist but are non-core, or coexist with digital | News scene (with footage), performance (with ticket), legal deposit (with document) |

**Core Philosophy**:

- Physical objects belong to the physical world; events belong to the blockchain world. NFTs lock only events, not objects — **completely eliminating RWA risks**.
- Recording facts should have **no financial barrier**. Everyone, rich or poor, deserves the right to create permanent on-chain proof of real experiences.
- The value of an event comes from **being used**. The citation tax links value to influence, not speculation.

### 2.2 Core Elements

Every event certification includes five core elements:

| Element | Description | Physical Example | Non-Physical Example |
|---------|-------------|------------------|----------------------|
| Time | Exact real timestamp | 2026-03-24 11:24 | 2026-03-24 15:30 UTC |
| Location | Real geographic or digital location | Tin Shui Wai Post Office, Hong Kong | URL, on-chain address, venue |
| Subject | Participants in the event | Sender, recipient | Author, platform, witness |
| Fact | Specific content of the event | First-day cover sent by registered mail | Article "XXX" first published |
| Evidence | Multi-source supporting materials | GPS, postal receipt, footage | On-chain timestamp, digital signature, archive snapshot |

### 2.3 Event Templates: The Extensible Foundation

The protocol does not predefine evidence rules for all events. Instead, it provides a **template layer** — the community can define verification standards for different event types.

Templates define:

- Evidence requirements
- Qualified verifiers
- Expected citation scenarios
- Optional modules (physical retention, physical verification)

**Template Governance**:

- Any community member may propose a new template
- Templates pass via validator network or DAO vote
- Template creators earn a share of usage fees

### 2.4 Evidence Collection and Verification Standards

All events follow these universal principles:

- **Multi-source independence**: Evidence from at least two independent sources
- **Cross-verification**: Shared unique identifiers form a closed loop
- **Trusted timestamp**: Evidence sealed by an officially recognized timestamp authority
- **Decentralized storage**: Evidence stored on IPFS/Arweave with a content-addressed CID
- **Layered disclosure**: Public package for display; private package for targeted verification

### 2.5 Physical Object Retention Mechanism (Optional)

Only for events with physical objects. The initiator may:

- **Destroy the object**: Make the NFT the sole on-chain representation
- **Retain the object**: Keep the original as ultimate arbitration evidence (may escrow with a trusted third party)

Physical objects act only as historical proof of the event. They do **not** represent ownership, rights, or value mapping to the NFT.

### 2.6 Minting and Moderation: Balancing Openness and Order

The protocol follows the equal-rights principle: **anyone can mint by paying gas only**. To ensure authenticity and legality, it uses a soft moderation system:

- **Post-mint verification**: Unverified events are marked "dubious"
- **Dispute arbitration**: Community challenges resolved by validators/DAO
- **Template guidance**: Encourage high-public-value events, not trivial private records

### 2.7 Core Methodology: Zero-Knowledge Thought Attestation

STProof's underlying methodology is **Zero-Knowledge Thought Attestation** — not cryptographic zero-knowledge proofs, but a practical attestation system based on social consensus, logical reasoning, and multi-source verification.

**Three Principles**:

1. **Completeness**: A real event can always construct a verifiable evidence chain.
2. **Soundness**: A fake event cannot pass the evidence verification.
3. **Zero-Knowledge**: Verifiers only learn that "the event is true," without accessing sensitive information, original images/IP, trade secrets, or private content.

---

## 3. The Relationship Between Physical Objects and NFTs: The Event Certification Model

STProof certifies **events**, not assets. Physical objects are only carriers; they have no ownership, value, or collateral binding to on-chain certificates.

**Physical objects belong to the physical world; events belong to the blockchain world.**

**NFTs lock only events, not objects.**

NFTs do **not** represent:

- Ownership of physical assets
- Usage, disposal, or revenue rights
- RWA-linked value

They only record key historical events:

- Creation / production
- Issuance / circulation / mailing
- Completion / excavation / restoration / destruction

---

## 4. Protocol Architecture

| Layer | Function | Implementation |
|-------|----------|----------------|
| Event Template Layer | Defines verification rules | Community proposals + smart contract templates |
| Validator Network | Multi-sig event verification | Institutional + community validators |
| Evidence Storage Layer | Stores multi-source evidence | IPFS/Arweave + trusted timestamps |
| NFT Asset Layer | Anchors events on-chain | ERC-721 dynamic NFT |
| Economic Model Layer | Distributes fees and royalties | Smart contract auto-distribution |

---

## 5. Metadata Standardization: The Universal Expression Layer of Event DNA

### 5.1 Why Metadata Standardization?

The core value of an event NFT lies not only in "whether it is verified" but also in **"what event it is, how it is understood, and how it is reused."**

In the current NFT ecosystem, metadata is often unstructured strings or arbitrarily defined JSON. This leads to:

| Problem | Description |
|---------|-------------|
| ❌ Type unrecognizable | Third-party apps cannot automatically identify event types |
| ❌ Cross-protocol composability difficult | DeFi/insurance protocols cannot directly read "citation count" |
| ❌ Indexing difficult | Search engines and marketplaces cannot filter by event attributes |
| ❌ Expression inconsistent | Different event types cannot be expressed under the same framework |

STProof proposes **Metadata Standardization** as the core DNA of the protocol.

### 5.2 Design Principles

| Principle | Description |
|-----------|-------------|
| **On-chain + Off-chain synergy** | On-chain stores proof state; off-chain stores large metadata |
| **Compatible with existing standards** | Fully compatible with ERC-721 Metadata Extension |
| **Extensible event types** | Supports any event type via `schemaId` |
| **Verifiability** | On-chain CID ensures metadata immutability |
| **Standardized querying** | Supports subgraphs, oracles, and indexers |

### 5.3 STProof Metadata Standard v1

**Off-chain JSON Schema (IPFS Storage)**:

```json
{
  "name": "Event Name",
  "description": "Event Description",
  "image": "ipfs://...",
  "external_url": "https://stproof.org/event/...",
  "attributes": [
    { "trait_type": "event_type", "value": "physical_mail" },
    { "trait_type": "verification_status", "value": "verified" },
    { "trait_type": "citation_count", "value": 12 },
    { "trait_type": "citation_revenue_eth", "value": "0.0012" },
    { "trait_type": "validators_count", "value": 3 }
  ],
  "stproof": {
    "version": "1",
    "schemaId": 1,
    "eventId": "contractAddress-tokenId",
    "eventName": "First Day Cover - Tin Shui Wai",
    "cid": "ipfs://...",
    "creator": "0x...",
    "createTime": 1744185600,
    "verified": true,
    "citations": 12,
    "revenue": "0.0012",
    "validators": ["0x..."],
    "evidence": {
      "publicPackage": "ipfs://...",
      "privatePackage": "ipfs://..."
    },
    "template": { "id": 1, "name": "Physical Mail Template" }
  }
}
```

**On-chain Core State**:

| Field | Type | Description |
|-------|------|-------------|
| `eventName` | string | Event name |
| `cid` | string | IPFS evidence package root CID |
| `creator` | address | Event initiator |
| `createTime` | uint256 | Minting timestamp |
| `verified` | bool | Verification status |
| `citations` | uint256 | Citation count |
| `revenue` | uint256 | Accumulated citation revenue |
| `validators` | address[] | List of validator addresses |

### 5.4 Event Type Schema Registry

| schemaId | Type | Required Fields | Example Scenario |
|----------|------|-----------------|------------------|
| 1 | Physical Mail | `from`, `to`, `trackingNumber`, `gps` | First-day cover, registered mail |
| 2 | Art Creation | `artist`, `medium`, `creationDate` | Painting, sculpture |
| 3 | Online Publication | `platform`, `url`, `publishTx` | Article, social media |
| 4 | Academic Publication | `doi`, `journal`, `authors` | Paper, preprint |
| 5 | On-chain Vote | `proposalId`, `voteOption`, `votingPower` | DAO governance |
| 6 | News Scene | `journalist`, `location`, `timestamp` | Breaking news |
| 7 | Legal Deposit | `caseId`, `court`, `witness` | Judicial evidence |

### 5.5 Smart Contract Enhancements (v6 Direction)

```solidity
// Metadata Registry
mapping(uint256 => string) public metadataSchemas;
function registerSchema(uint256 schemaId, string calldata schemaURI) external onlyOwner;

// Enhanced tokenURI
function tokenURI(uint256 tokenId) public view override returns (string memory);

// Mint with schema binding
function mintWithSchema(address to, uint256 schemaId, string memory eventName, string memory cid) external returns (uint256);
```

### 5.6 Indexers and Cross-Protocol Composability

| Component | Use Case |
|-----------|----------|
| The Graph Subgraph | Automatic indexing, complex queries |
| Oracles | Read citation counts and verification status |
| EAS / Other Protocols | Reference STProof events as trusted fact sources |

### 5.7 Value Delivered by Metadata Standardization

| Value Dimension | Description |
|-----------------|-------------|
| **Composability** | DeFi, DAO, insurance protocols can directly call event state |
| **Discoverability** | Marketplaces and explorers can filter by event type/attributes |
| **Long-term readability** | Standardized JSON remains parseable even if frontend disappears |
| **Cross-chain interoperability** | Metadata standards extendable to multiple chains |
| **AI / Automation** | Structured data can be understood and used by AI agents |

---

## 6. Economic Model: Equality-First Incentive Mechanism

### 6.1 Roles and Revenue Sources

| Role | Contribution | Revenue Source |
|------|--------------|----------------|
| Event Initiator | Collects evidence, mints NFT | Royalties, citation fees, access fees |
| Volunteer Validator | Verifies events | Reputation points, community recognition |
| Incentivized Validator | Verifies events | Validation fees (ETH) |
| Template Creator | Designs event rules | Template usage fees |
| Protocol Treasury | Protocol development & maintenance | 28% of citation fees; 30% of validation fees |

### 6.2 Minting and Verification

Anyone can mint an Event NFT by paying gas only — no extra minting fee.

| Mode | Cost | Speed | Use Case |
|------|------|-------|----------|
| Community Volunteer Verification | Free | Slow | Personal memories, family records |
| Incentivized Verification | Initiator pays | Fast | Commercial, urgent certification |

### 6.3 Resale Royalties

5% of resale price (EIP-2981 compliant) — **100% to event initiator**.

### 6.4 On-Chain Citation: Value Comes from Use

Any user or contract may call the `cite` function and pay a small fee. The fee is automatically distributed:

- **70%** to event initiator
- **28%** to protocol treasury
- **2%** permanently to protocol creator

### 6.5 Dual-Layer Mechanism and Paid Access

| Layer | Content | Access | Fee Model |
|-------|---------|--------|-----------|
| Public Package | Thumbnails, key summaries, low-res footage | Public IPFS gateway | Free |
| Full Package | High-res footage, raw receipts, full GPS, timestamp certificates | Protocol paid gateway | Per-use / subscription |

### 6.6 Multi-Dimensional Extension of Event Value

- Scarcity & uniqueness
- Timeliness & historical significance
- Evidence strength
- Social resonance & emotional value
- Utility & application value
- Composite value & narrative chains

### 6.7 Summary of the Three-Tier Value Capture Model

| Income Source | Trigger | Rate | Distribution |
|---------------|---------|------|--------------|
| Royalty | NFT resale | 5% of sale price | 100% to initiator |
| Citation Fee | On-chain `cite` call | 0.0001 ETH | 70% initiator / 28% treasury / 2% creator |
| Access Fee | Full-package download | 0.001 ETH | 70% initiator / 28% treasury / 2% creator |

### 6.8 Protocol Treasury Management

- Income: 28% of citation fees; 30% of validation fees
- Governance: Initial **2/3 multi-sig** (founder, core contributors, community reps)
- Uses: Template development, audits, hackathons, community rewards, gas subsidies

### 6.9 Economic Model Advantages

- Zero-threshold participation
- Voluntary payments
- Multi-layer value capture
- Multi-dimensional value extension
- Sustainable cash flow
- No regulatory risk (no token, no security)

### 6.10 Creator Equity

To ensure long-term protocol iteration, technical maintenance, and ecosystem security, the STProof Protocol Creator enjoys the following transparent, on-chain verifiable rights:

1. **Permanent Protocol Service Reward**: 2% of all on-chain citation fees, paid access fees, and incentivized validation fees permanently belongs to the Protocol Creator.
2. **Genesis Template Exclusive Revenue**: When official core templates designed by the Creator are used, the Creator earns 3% of template usage fees.
3. **Governance and Security Privileges**: Permanently retains a multi-sig seat in the Protocol Treasury, with proposal rights for core parameters.
4. **Revenue Execution**: All rewards are automatically distributed by smart contract directly to the Creator's wallet, on-chain verifiable.

---

## 7. Compliance and Legal Considerations

### 7.1 Protocol Positioning: Non-Financial Infrastructure

The protocol's core is fact proofing, not financial transactions. It clearly avoids:

- Not RWA
- Not virtual currency
- Not a security

### 7.2 Judicial Recognition

STProof's multi-source evidence + trusted timestamp + IPFS model meets legal standards for electronic evidence in major jurisdictions.

### 7.3 Risk Mitigation

- De-financialize narrative
- Content moderation
- Onshore/offshore operational separation
- Data privacy compliance

---

## 8. Smart Contract Implementation

### 8.1 Standards

- ERC-721
- EIP-2981 Royalties
- Dynamic metadata
- Dual-track verification
- On-chain citation
- Template management

### 8.2 Core Interface

```solidity
interface ISTProof {
    function mint(address to, uint256 templateId, string memory uri) external;
    function mintWithIncentive(address to, uint256 templateId, string memory uri, address[3] memory validators) external payable;
    function setTokenURI(uint256 tokenId, string memory newURI) external;
    function verifyAsVolunteer(uint256 tokenId) external;
    function cite(uint256 tokenId) external payable;
    function getCitationCount(uint256 tokenId) external view returns (uint256);
    function createTemplate(...) external returns (uint256 templateId);
}
```

---

## 9. First Use Case: STProof Self-Referential Experiment (Meta Event)

### 9.1 Event Background

- Event Name: STProof Protocol Whitepaper v5.2 Official Release & Genesis Anchor
- Event Type: Non-physical digital native event (self-referential experiment)
- Core Goal: Certify the birth of STProof itself, completing a digital civilization-level self-referential loop

### 9.2 Evidence Collection

- Time evidence: Whitepaper timestamp, GitHub commit time, on-chain block time
- Location evidence: Ethereum mainnet block height, contract address, document hash coordinates
- Behavioral evidence: Document version history, commit logs, community announcements
- Official evidence: IPFS hash, multi-sig signatures, timestamp certificates

### 9.3 Significance

1. Proves STProof can operate completely independently of the physical world
2. Validates the purity and generality of Zero-Knowledge Thought Attestation
3. Establishes the protocol's genesis root of trust
4. Provides a standard template for all digital native events

---

## 10. Future Outlook: Event Template Roadmap and Ecosystem Development

Including physical event templates, non-physical event templates, hybrid event templates, AI-assisted verification, physical verification trigger mechanism, judicial recognition, becoming Web3 infrastructure, and complementary positioning with lightweight protocols.

---

## 11. Ecosystem Launch Path and Roadmap

- **Phase 1**: Genesis Anchor (Self-Referential Experiment)
- **Phase 2**: Institutional Citations & Value Demonstration
- **Phase 3**: Community Governance & Ecosystem Expansion
- **Long-term Vision**: Digital Civilization Fact Layer

---

## 12. Protocol Boundaries

STProof does NOT apply to:

- Purely subjective events
- Unverifiable private events
- Guarantee of physical authenticity of objects
- Provision of custody or insurance
- Promise of commercial returns from citation fees
- Provision of legal advice

---

## 13. Conclusion

STProof began with a simple question: *How to prove a first-day cover was really mailed on its first day?*

Using GPS, postal records, multi-source footage, trusted timestamps, IPFS, and dynamic NFTs, we built a verifiable, immutable event-recording framework.

- **Physical objects belong to the physical world; events belong to the blockchain world.**
- **NFTs lock only events, not objects.**
- **Recording facts has no financial barrier. Value comes from use.**
- **Metadata standardization makes event NFTs programmable, composable, and parseable.**

Every citation is a vote for truth.

In an era of rampant AI forgery, STProof provides a path to resist unreality and anchor truth.

The protocol is open source. We invite everyone who believes that "facts need to be permanently recorded" to join this experiment.

---

## Appendix

- Self-referential case public evidence package CID: bafybeial45ll7mvqfvnbuk4ddgezajmhzzzoub7bdjwnx3wa65hox4maii
- Smart contract code: https://sepolia.etherscan.io/address/0x037eb54EF9dae9A2Ae33bFB9ba170F1067B925CB
- Protocol website: https://stproof.org

---

## Version History

- **v1.3**: Initial framework
- **v4.2**: Economic model finalized, production-ready
- **v5.1**: Added Zero-Knowledge Thought Attestation, self-referential experiment, permanent creator equity
- **v5.2**: Comprehensive final edition | Full economic model + Zero-Knowledge Thought Attestation + **Metadata Standardization DNA**

Final interpretation rights belong to the STProof community.

---

**This is the complete STProof Protocol Whitepaper v5.2 (English Edition), ready to copy and replace the old version.**
