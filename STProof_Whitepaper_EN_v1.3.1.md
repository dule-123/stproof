title: STProof Protocol Whitepaper
description: A universal on-chain attestation and value-capture protocol for "Events". It transforms objectively occurred historical events into immutable, permanent records in the digital world through multi-source evidence cross-verification, trusted timestamps, decentralized storage, and on-chain anchoring.
version: 4.2
date: 2026-04-2
keywords: [Blockchain, Event Attestation, NFT, Notarization, Decentralized Verification, Citation Tax, STProof, Fact Anchoring]
categories: [Technical Whitepaper, Blockchain Protocol]
language: en-US
---

# STProof Protocol Whitepaper
**Version 4.2 | April 2, 2026**

## Title Page
STProof: We certify **events**, not assets.
Proof exists with physical objects, and even without.
All that happens shall be stored; all stored proofs shall be trusted.

## Abstract
Physical objects belong to the physical world.
Events belong to the blockchain world.
NFTs lock only **events**, not objects.

---

# Table of Contents
1. Introduction: The Challenge of Recording Facts in the Physical World
2. STProof: The Event Certification Protocol
    2.1 Definition
    2.2 Core Elements
    2.3 Event Templates: The Extensible Foundation of the Protocol
    2.4 Evidence Collection and Verification Standards
    2.5 Physical Object Retention Mechanism (Optional Module)
    2.6 Minting and Moderation: Balancing Openness and Order
3. The Relationship Between Physical Objects and NFTs: The Event Certification Model
4. Protocol Architecture
5. Economic Model: Equality-First Incentive Mechanism
    5.1 Roles and Revenue Sources
    5.2 Minting and Verification Mechanisms
    5.3 Resale Royalties
    5.4 On-Chain Citation: The Value of Facts Comes from Use
    5.5 Dual-Layer Mechanism and Paid Access
    5.6 Multi-Dimensional Extension of Event Value
    5.7 Summary of the Three-Tier Value Capture Model
    5.8 Protocol Treasury Management
    5.9 Economic Model Advantages
    5.10 Creator Equity
6. Compliance and Legal Considerations
7. Smart Contract Implementation
8. First Use Case: First-Day Cover Mailing Event Certification (Physical Event Template)
9. Future Outlook: Event Template Roadmap and Ecosystem Development
    9.1 Physical Event Templates
    9.2 Non-Physical Event Templates
    9.3 Hybrid Event Templates
    9.4 AI-Assisted Verification
    9.5 Physical Verification Trigger Mechanism
    9.6 Judicial Recognition
    9.7 Ecosystem Positioning
10. Ecosystem Launch Path and Roadmap
11. Protocol Boundaries
12. Conclusion

---

# Full English Translation (Complete & Polished)
## 1. Introduction: The Challenge of Recording Facts in the Physical World
Human civilization depends on recording “facts.” From stone carvings and parchment to digital archives, we have always sought more reliable ways to preserve history. Yet today, amid the explosion of information and AI forgery technologies, the **authenticity of facts** faces unprecedented challenges.

- Traditional recording relies on centralized institutions (notaries, archives, experts), which suffer from high costs, vulnerability to tampering, and difficulty in cross-border verification.
- Blockchain and NFTs provide decentralized, tamper-proof carriers, but most NFTs only anchor “digital files” and lack rigid connections to real-world events.
- Oracles feed off-chain data (prices, weather) on-chain but only handle API-standardized data, not unique, non-standard events requiring human judgment.

Was a stamp really mailed on its first day? Was a painting really made by a certain artist? Was a cultural relic really unearthed at a certain site? These questions cannot be answered by APIs, yet they form an essential part of human history and culture.

The STProof protocol was created to fill this gap.

## 2. STProof: The Event Certification Protocol
### 2.1 Definition
STProof is a universal on-chain certification and value-capture protocol for **events**. It certifies **objective historical events** — not physical assets or digital content — enabling a consistent, trusted mechanism across all scenarios and forms.

Three categories of events are supported:

| Event Type | Definition | Examples |
|---|---|---|
| Physical Event | A physical object serves as the on-site carrier | First-day cover mailing, artwork creation, porcelain firing, relic excavation |
| Non-Physical Event | Pure digital or behavioral events with no physical form | Online publication, on-chain voting, opinion statement, academic release |
| Hybrid Event | Physical elements exist but are non-core, or coexist with digital | News scene (with footage), performance (with ticket), legal deposit (with document) |

### Core Philosophy
- Physical objects belong to the physical world; events belong to the blockchain world. NFTs lock only events, not objects — **completely eliminating RWA risks**.
- Recording facts should have **no financial barrier**. Everyone, rich or poor, deserves the right to create permanent on-chain proof of real experiences.
- The value of an event comes from **being used**. The citation tax links value to influence, not speculation.

### 2.2 Core Elements
Every event certification includes five core elements:

| Element | Description | Physical Example | Non-Physical Example |
|---|---|---|---|
| Time | Exact real timestamp | 2026-03-24 11:24 | 2026-03-24 15:30 UTC |
| Location | Real geographic or digital location | Tin Shui Wai Post Office, Hong Kong | URL, on-chain address, venue |
| Subject | Participants in the event | Sender, recipient | Author, platform, witness |
| Fact | Specific content of the event | First-day cover sent by registered mail | Article “XXX” first published |
| Evidence | Multi-source supporting materials | GPS, postal receipt, footage | On-chain timestamp, digital signature, archive snapshot |

### 2.3 Event Templates: Extensible Foundation
The protocol does not predefine evidence rules for all events. Instead, it provides a **template layer** — the community can define verification standards for different event types.

Templates define:
- Evidence requirements
- Qualified verifiers
- Expected citation scenarios
- Optional modules (physical retention, physical verification)

Template governance:
- Any community member may propose a new template
- Templates pass via validator network or DAO vote
- Template creators earn a share of usage fees

This design enables unlimited extensibility. The first-day cover is only the first example of a physical event template, not the entire protocol.

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

Physical objects act only as historical proof of the event. They do **not** represent ownership, rights, or value mapping to the NFT. The protocol strictly separates physical and blockchain domains.

### 2.6 Minting and Moderation: Balancing Openness and Order
The protocol follows the equal-rights principle: **anyone can mint by paying gas only**.
To ensure authenticity and legality, it uses a soft moderation system:
- Post-mint verification: Unverified events are marked “dubious”
- Dispute arbitration: Community challenges resolved by validators/DAO
- Template guidance: Encourage high-public-value events, not trivial private records

## 3. Physical Objects and NFTs: The Event Certification Model
STProof certifies **events**, not assets. Physical objects are only carriers; they have no ownership, value, or collateral binding to on-chain certificates.

NFTs do **not** represent:
- Ownership of physical assets
- Usage, disposal, or revenue rights
- RWA-linked value

They only record key historical events:
- Creation / production
- Issuance / circulation / mailing
- Completion / excavation / restoration / destruction

Physical and on-chain assets are fully independent, linked only by historical fact. This eliminates dual ownership, repeated certification, and RWA regulatory risks.

## 4. Protocol Architecture
| Layer | Function | Implementation |
|---|---|---|
| Event Template Layer | Defines verification rules | Community proposals + smart contract templates |
| Validator Network | Multi-sig event verification | Institutional + community validators |
| Evidence Storage Layer | Stores multi-source evidence | IPFS/Arweave + trusted timestamps |
| NFT Asset Layer | Anchors events on-chain | ERC-721 dynamic NFT (metadata updatable) |
| Economic Model Layer | Distributes fees and royalties | Smart contract auto-distribution + payment gateway |

## 5. Economic Model: Equality-First Incentive Mechanism
Core belief: Recording facts should have **no financial barrier**. Technology should not create new inequality.

Traditional NFT value depends on secondary-market prices — speculation. Event NFT value should come from **being trusted and cited**.

STProof pioneers the **citation tax**: value is determined by usage, not hype. Every citation is a public vote for truth.

### 5.1 Roles and Revenue Sources
| Role | Contribution | Revenue Source |
|---|---|---|
| Event Initiator | Collects evidence, mints NFT | Royalties, citation fees, access fees |
| Volunteer Validator | Verifies events | Reputation points, community recognition |
| Incentivized Validator | Verifies events | Validation fees (ETH) |
| Template Creator | Designs event rules | Template usage fees |
| Protocol Treasury | Protocol development & maintenance | 30% of citation fees; 30% of validation fees |

### 5.2 Minting and Verification
Anyone can mint an Event NFT by paying gas only — no extra minting fee.

Two verification modes:
| Mode | Cost | Speed | Use Case |
|---|---|---|---|
| Community Volunteer Verification | Free | Slow | Personal memories, family records |
| Incentivized Verification | Initiator pays | Fast | Commercial, urgent certification |

### 5.3 Resale Royalties
5% of resale price (EIP-2981 compliant) — **100% to event initiator**.

### 5.4 On-Chain Citation: Value from Usage
The core value of an Event NFT is **citation**, not resale.

Any user or contract may call the `cite` function and pay a small fee (suggested 0.0001 ETH). Distribution:
- 70% to event initiator
- 30% to protocol treasury

Each citation is recorded permanently on-chain, boosting credibility and authority.

### 5.5 Dual-Layer Mechanism and Paid Access
| Layer | Content | Access | Fee Model |
|---|---|---|---|
| Public Package | Thumbnails, key summaries, low-res footage | Public IPFS gateway | Free |
| Full Package | High-res footage, raw receipts, full GPS, timestamp certificates | Protocol paid gateway | Per-use / subscription |

### 5.6 Multi-Dimensional Extension of Event Value
Citation tax is the foundation. Additional value dimensions:
- Scarcity & uniqueness
- Timeliness & historical significance
- Evidence strength
- Social resonance & emotional value
- Utility & application value
- Composite value & narrative chains

### 5.7 Three-Tier Value Capture Summary
| Income Source | Trigger | Rate | Distribution |
|---|---|---|---|
| Royalty | NFT resale | 5% | 100% to initiator |
| Citation Fee | On-chain `cite` call | 0.0001 ETH | 70% initiator / 30% treasury |
| Access Fee | Full-package download | 0.001 ETH | 70% initiator / 30% treasury |

### 5.8 Protocol Treasury Management
- Income: 30% of citation fees; 30% of validation fees
- Governance: Initial 2/3 multi-sig (founder, core contributors, community reps)
- Uses: Template development, audits, hackathons, community rewards, gas subsidies
- Transparency: All income and spending public on-chain

### 5.9 Economic Model Advantages
- Zero-threshold participation
- Voluntary payments
- Multi-layer value capture
- Multi-dimensional value extension
- Sustainable cash flow
- No regulatory risk (no token, no security)

### 5.10 Creator Equity
To ensure long-term iteration, maintenance, and ecosystem security, the **STProof Protocol Creator** holds transparent, on-chain-verifiable, **personal exclusive rights**:

1. **Permanent Protocol Service Reward**
2% of **all on-chain citation fees, paid access fees, and incentivized validation fees** permanently belongs to the Protocol Creator, for technical development, audits, and ecosystem growth.

2. **Genesis Template Exclusive Revenue**
When official core templates designed by the Creator are used, the Creator earns **3% of template usage fees** as ongoing incentive for rule design and standard setting.

3. **Governance and Security Privileges**
The Protocol Creator **permanently retains a multi-sig seat in the Protocol Treasury** and holds proposal rights for core parameters (fee structures, verification rules, template standards, dispute mechanisms) to ensure stability, compliance, and protection from malicious control.

4. **Revenue Execution**
All rewards are automatically distributed by smart contract directly to the Creator’s wallet, are **legally personal income**, and are immutable on-chain.

## 6. Compliance and Legal Considerations
### 6.1 Non-Financial Infrastructure
STProof is fact-proofing infrastructure, not a financial protocol. It avoids regulatory red lines:
- **Not RWA**: NFTs do not anchor physical asset ownership or revenue
- **Not virtual currency**: No token issuance; ETH used only for gas
- **Not a security**: No fundraising, dividends, or profit promises

### 6.2 Judicial Recognition
STProof’s multi-source evidence + trusted timestamp + IPFS model meets legal standards for electronic evidence in major jurisdictions, including China’s Supreme People’s Court rulings.

### 6.3 Risk Mitigation
- De-financialize narrative: Avoid “investment,” “appreciation,” “dividend”
- Content moderation
- Onshore/offshore operational separation
- Data privacy compliance
- Regulatory filing where required

## 7. Smart Contract Implementation
### 7.1 Standard
Built on Ethereum **ERC-721**, extended with:
- EIP-2981 royalties
- Dynamic metadata
- Dual-track verification
- On-chain citation

### 7.2 Core Interface
```solidity
interface ISTProof {
    function mint(address to, uint256 templateId, string memory uri) external;
    function mintWithIncentive(address to, uint256 templateId, string memory uri, address[3] memory validators) external payable;
    function setTokenURI(uint256 tokenId, string memory newURI) external;
    function verifyAsVolunteer(uint256 tokenId) external;
    function cite(uint256 tokenId) external payable;
    function getCitationCount(uint256 tokenId) external view returns (uint256);

    function createTemplate(
        string memory name,
        uint256 citationFee,
        uint256 accessFee,
        uint256 royaltyRate,
        bytes memory verificationRules
    ) external returns (uint256 templateId);
}
```

## 8. First Use Case: First-Day Cover Mailing Event
- Event: First-day cover mailed from Tin Shui Wai Post Office, Hong Kong, March 24, 2026
- Evidence: Time, GPS, full footage, official postal receipt, tracking number
- Storage: Trusted timestamp + IPFS layered storage
- Purpose: Validate end-to-end event certification for physical events

## 9. Future Outlook
### 9.1 Physical Event Templates
First-day covers / philately, artwork creation, cultural relics, porcelain & crafts

### 9.2 Non-Physical Event Templates
Online publication, on-chain voting, opinion statements, academic publishing

### 9.3 Hybrid Event Templates
News scenes, legal deposits, performances & events

### 9.4 AI-Assisted Verification
Open-source toolkit to detect AI forgeries, verify evidence consistency, check official records, and assist human validators.

### 9.5 Physical Verification Trigger Mechanism
For disputed physical events, third-party physical testing (carbon dating, fiber analysis, 3D scanning) may be triggered to validate on-chain records.

### 9.6 Judicial Recognition
Push for global court and arbitration adoption.

### 9.7 Ecosystem Positioning
STProof is the **heavy-duty truth layer** for high-value, cross-verified, arbitrateable events — complementary to lightweight protocols like EAS.

## 10. Ecosystem Launch Roadmap
- Phase 1 (Q2 2026): Seed users & example library
- Phase 2 (Q3–Q4 2026): Institutional citations & value demonstration
- Phase 3 (2027): Community governance & ecosystem expansion
- Long-term: Global truth infrastructure

## 11. Protocol Boundaries
STProof does NOT:
- Apply to purely subjective events
- Support unverifiable private events
- Guarantee physical authenticity of objects
- Provide custody, insurance, or legal advice
- Promise commercial returns from citation fees

## 12. Conclusion
STProof began with a simple question: *How to prove a first-day cover was really mailed on its first day?*

Using GPS, postal records, multi-source footage, trusted timestamps, IPFS, and dynamic NFTs, we built a verifiable, immutable event-recording framework.

STProof: We certify **events**, not assets.
Proof exists with physical objects, and even without.
All that happens shall be stored; all stored proofs shall be trusted.

Physical objects belong to the physical world.
Events belong to the blockchain world.
NFTs lock only events, not objects.

In an era of rampant AI forgery, STProof provides a path to resist unreality and anchor truth.

Recording facts should have no financial barrier.
The value of an event comes from being used.
Every citation is a vote for truth.

---

## Appendix
- Public evidence1 CID: `bafybeiahcapghchssb3syum5wxigbl22cnykeeyk7igv55rpw6qk3hywte`
- Public evidence2 CID: `bafybeiea2wkroneiqp2jvr5xs6lmaue2jhzinbvszzzpxoth6k2a7fwl3e`
- Contract: https://sepolia.etherscan.io/address/0x9590807968d5cdD4c8dd72394aA7BfB4E8Efb4C4
- Website: https://stproof.org
- Discord: https://discord.gg/stproof

This Version 4.2 is subject to iteration.
Final interpretation belongs to the STProof community.

---
