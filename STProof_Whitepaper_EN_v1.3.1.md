title: STProof Protocol Whitepaper
description: A universal on-chain attestation and value-capture protocol for "Events". It transforms objectively occurred historical events into immutable, permanent records in the digital world through multi-source evidence cross-verification, trusted timestamps, decentralized storage, and on-chain anchoring.
version: 1.3
date: 2026-03-27
keywords: [Blockchain, Event Attestation, NFT, Notarization, Decentralized Verification, Citation Tax, STProof, Fact Anchoring]
categories: [Technical Whitepaper, Blockchain Protocol]
language: en-US
---

# STProof Protocol Whitepaper
**Version 1.3 | March 27, 2026**

**Title Page**
**STProof: We attest events, not objects.**
*Provable with an object, provable without.*
*All that occurs can be stored; all that is stored can be trusted.*

**Abstract**
*Physical objects belong to the physical world; events belong to the blockchain world.*
*NFTs lock events, not items.*

**Abstract**
STProof (Spatial-Temporal Proof) is a universal on-chain attestation and value-capture protocol for "Events". It transforms objectively occurred historical events into immutable, permanent records in the digital world through multi-source evidence cross-verification, trusted timestamps, decentralized storage, and on-chain anchoring.

The protocol's attestation target is unified as the **event itself**, not any physical asset or digital content. For events with physical objects (e.g., mailed covers, artworks, artifacts), the object serves merely as the onsite carrier of the event. For events without physical objects (e.g., online publications, on-chain votes, opinion statements), the protocol directly notarizes the event.

**Core Philosophy**: Recording facts should have no financial barrier. Regardless of wealth, everyone has the right to establish a permanent on-chain credential for the real events they experience.

**Value Mechanism**: STProof introduces the "**Citation Tax**" mechanism. The value of an event is no longer determined by the bids of a few collectors but by how often it is believed and used. Each citation is a vote for truth.

**First Implemented Template**: A First Day Cover mailed from the Tin Shui Wai Post Office in Hong Kong on March 24, 2026, has completed full life-cycle evidence collection and storage, serving as a demonstration case for the "Event with Physical Object Template".

**Table of Contents**
1.  Introduction: The Challenge of Recording Facts in the Physical World
2.  STProof: The Event Attestation Protocol
    - 2.1 Definition
    - 2.2 Core Elements
    - 2.3 Event Templates: The Scalable Foundation of the Protocol
    - 2.4 Evidence Collection and Verification Standards
    - 2.5 Physical Object Retention Mechanism (Optional Module)
    - 2.6 Minting and Review: Balancing Openness and Order
3.  The Relationship Between Physical Objects and NFTs: The Event Attestation Model
4.  Protocol Architecture
5.  Economic Model: An Equity-Prioritized Incentive Mechanism
    - 5.1 Roles and Revenue Sources
    - 5.2 Minting and Verification Mechanisms
    - 5.3 Resale Royalty
    - 5.4 On-Chain Citation: The Value of Facts Comes from Being Used
    - 5.5 Two-Tier Mechanism and Paid Access
    - 5.6 Protocol Treasury Management
6.  Compliance and Legal Considerations
7.  Smart Contract Implementation
8.  First Case Study: Attestation of a First Day Cover Mailing Event (Event with Physical Object Template)
9.  Future Outlook: Event Template Roadmap and Ecosystem Development
    - 9.1 Event Templates with Physical Objects
    - 9.2 Event Templates without Physical Objects
    - 9.3 Hybrid Event Templates
    - 9.4 AI-Assisted Verification
    - 9.5 Physical Verification Trigger Mechanism
    - 9.6 Judicial Recognition
    - 9.7 Ecosystem Positioning: Complementing Lightweight Protocols
10. Ecosystem Launch Path and Roadmap
11. Boundaries of the Protocol
12. Conclusion

---
## 1. Introduction: The Challenge of Recording Facts in the Physical World
Human civilization relies on the recording of "facts". From stone carvings and parchment to digital archives, we have always sought more reliable ways to preserve history. However, in an era of information explosion and parallel advances in AI forgery technology, the "authenticity" of facts faces unprecedented challenges.

-   **Traditional recording methods** rely on centralized institutions (notary offices, archives, appraisal experts) but suffer from high costs, susceptibility to tampering, and difficulties in cross-border verification.
-   **Blockchain and NFTs** provide decentralized, immutable carriers, but the vast majority of NFTs only anchor "digital files", lacking a rigid connection to facts in the physical world.
-   **Oracles** can feed off-chain data (like prices, weather) on-chain but can only handle standardized, API-able data. They cannot cope with unique, non-standard events that require human judgment.

Was a stamp truly mailed on its first day? Did a painting genuinely come from a certain artist? Was an artifact truly unearthed at a specific site? These questions cannot be answered by an API, yet they constitute vital parts of human history and culture.

The birth of the STProof protocol aims to fill this gap.

---
## 2. STProof: The Event Attestation Protocol
### 2.1 Definition
STProof is a universal on-chain attestation and value-capture protocol for "**Events**". The protocol's attestation target is unified as **objectively occurred historical events**, not any physical asset or digital content itself, thereby achieving a consistent, trustworthy mechanism across all scenarios and forms.

All three types of events fall within the protocol's scope.

**Core Philosophy**:
*Physical objects belong to the physical world; events belong to the blockchain world. NFTs lock events, not items. Thus, it is fundamentally and completely free from RWA.*
*Recording facts should have no financial barrier. Regardless of wealth, everyone has the right to establish a permanent on-chain credential for the real events they experience.*
*The value of an event comes from being used. The Citation Tax mechanism links value to influence, not to speculation.*

### 2.2 Core Elements
Each event attestation includes five core elements:

**Table 1: Core Elements of Event Attestation**

| Element | Description | Example with Physical Object | Example without Physical Object |
| :--- | :--- | :--- | :--- |
| **Time** | The real time the event occurred. | 2026-03-24 11:24 | 2026-03-24 15:30 UTC |
| **Space** | The real location where the event occurred. | Tin Shui Wai Post Office, Hong Kong | URL, On-chain Address, Meeting Venue |
| **Subject** | The participants of the event. | Sender, Recipient | Author, Publishing Platform, Witness |
| **Fact** | The specific content/action of the event. | The First Day Cover was sent via registered mail. | The article "XXX" was first published. |
| **Evidence** | Multi-source materials supporting the fact. | GPS track, postal receipt, imagery | On-chain timestamp, digital signature, archive snapshot |

### 2.3 Event Templates: The Scalable Foundation of the Protocol
The protocol does not preset evidence rules for all events. Instead, it provides a template layer—the community can define verification standards for different event types.

**Template Definition includes**:
*   **Evidence Requirements**: What dimensions of evidence are needed.
*   **Verifier Profile**: Who is qualified to verify this type of event.
*   **Citation Scenarios**: Who will cite it and why.
*   **Optional Modules**: Whether to enable physical object retention, physical verification, etc.

**Template Governance**:
*   Any community member can propose a new template.
*   Templates require approval via a vote by the verifier network or DAO.
*   Template creators receive a share of the template usage fees.

This design gives the protocol unlimited scalability. The First Day Cover is just the first case of the "Event with Physical Object Template", not the entirety of the protocol.

### 2.4 Evidence Collection and Verification Standards
Regardless of event type, the protocol adheres to the following general principles:
*   **Multi-Source Independence**: Evidence should come from at least two independent sources. The more independent sources, the stronger the evidence.
*   **Cross-Verification**: Evidence from different sources should contain a common unique identifier, forming a closed loop.
*   **Trusted Timestamp**: The evidence package must be solidified via a nationally recognized timestamp authority, proving its existence before a specific point in time.
*   **Decentralized Storage**: The evidence package is uploaded to IPFS/Arweave, obtaining a Content Identifier (CID) to ensure content immutability.
*   **Tiered Disclosure**: Evidence can be divided into a "**Public Package**" and a "**Private Package**". The public package is for market display; the private package is for directed verification.

Specific evidence rules are defined by the Event Template. For example:
*   **Event with Physical Object Template**: Requires GPS track, official records, imagery.
*   **Event without Physical Object Template**: Requires on-chain timestamp, digital signature, third-party archive.
*   **News Scene Template**: Requires multi-angle imagery, timestamp, witness signatures.

### 2.5 Physical Object Retention Mechanism (Optional Module)
*   **Applicability**: Only applicable to event types accompanied by physical objects. Not applicable to events without objects.
*   For events with objects, the physical object serves as the original material evidence of the event's occurrence. Its retention method is decided by the initiator:
    *   **Destroy the Object**: Makes the NFT the sole on-chain representation of the event, achieving complete digitization.
    *   **Retain the Object**: Keeps the physical original as "ultimate arbitration" evidence. Can choose to custody the object with a trusted third party.

**It must be clarified**: The retention of the physical object serves only as historical witness to the event's authenticity. It does **not** represent any asset ownership, profit rights, or form an ownership binding, value mapping, or asset collateral relationship with the NFT. The protocol consistently adheres to the principle: "**Events belong to the blockchain world; objects belong to the physical world.**"

The protocol will later introduce a "Physical Verification Trigger Mechanism" (see Section 9.5), allowing application for physical inspection of the object in case of dispute.

### 2.6 Minting and Review: Balancing Openness and Order
The protocol adheres to the equity principle of "**Anyone can mint by paying only the Gas fee**". Simultaneously, to ensure the authenticity and legality of on-chained events, the protocol introduces a soft review mechanism through community governance:
*   **Post-Minting Verification**: After minting, an event must be verified by the verifier network. Events that fail verification will be marked as "**Questionable**", affecting their reputation and citability.
*   **Content Dispute Arbitration**: Any community member can challenge an event's content, subject to arbitration by community verifiers or a DAO.
*   **Template Guidance**: Guides users to record events of public value via "Event Templates", rather than encouraging random recording of private trivialities.

This model of "**Open Minting + Post-Hoc Verification + Reputation Constraints**" strikes a balance between openness and order.

---
## 3. The Relationship Between Physical Objects and NFTs: The Event Attestation Model
STProof's attestation target is unified as **objectively occurred historical events**, not any physical asset or digital content itself. For events accompanied by physical objects, the object serves merely as the onsite carrier of the event and does **not** form an ownership binding, value mapping, or asset collateral relationship with the on-chain credential. For purely digital/behavioral events without objects, the protocol directly notarizes, attests, and incentivizes the event itself.

*Physical objects belong to the physical world; events belong to the blockchain world.*
*NFTs lock events, not items.*

The core innovation of the STProof protocol lies in redefining the relationship between physical objects and digital credentials. It abandons the traditional "object mapping" mindset, shifting to an "**event attestation**" paradigm.

The protocol adopts an **Event-Based Provenance** model. The on-chain NFT does **not** represent any physical asset. It does **not** constitute a certificate of ownership, usage rights, disposal rights, or profit rights for the object, nor does it form an RWA (Real World Asset) mapping relationship with the object.

The **sole** object of attestation and record for the NFT is the key historical events in the birth and circulation process of the object, including but not limited to:
*   Creation/Production Event: Creation, making, firing, signing.
*   Issuance/Circulation Event: Issuance, mailing, origin.
*   Completion/Termination Event: Completion, excavation, restoration, destruction.

The physical object, as the onsite carrier of the event, maintains its independent property rights, commercial value, and collection attributes. It has **no** subordinate, binding, pledge, collateral, or value underpinning relationship with the on-chain NFT.

The two are linked **only in historical fact**; they are completely separate and independent in terms of rights, assets, and financial attributes.

Thus, STProof NFTs become pure **event credentials**, not asset credentials, fundamentally avoiding risks of dual ownership, duplicate attestation, and RWA regulation from the ground up.

For events without objects, the above principles apply—except the "onsite carrier" does not exist. The NFT directly anchors the event itself, making it even more pure.

---
## 4. Protocol Architecture
STProof consists of the following layers:

**Table 2: STProof Protocol Architecture**

| Layer | Function | Implementation |
| :--- | :--- | :--- |
| **Event Template Layer** | Defines verification rules for different event types. | Community proposals, smart contract templates. |
| **Verifier Network** | Performs multi-signature verification on event authenticity. | Institutional verifiers + Community verifiers. |
| **Evidence Storage Layer** | Stores multi-source evidence materials. | IPFS/Arweave + Trusted Timestamp. |
| **NFT Asset Layer** | Anchors events as on-chain assets. | ERC-721 dynamic NFT, supports metadata updates. |
| **Economic Model Layer** | Distributes verification fees, royalties, citation fees, access fees. | Smart contract auto-distributes ETH/USDC + Paid gateway. |

---
## 5. Economic Model: An Equity-Prioritized Incentive Mechanism
STProof adheres to a core philosophy: **Recording facts should have no financial barrier. Regardless of wealth, everyone has the right to establish a permanent on-chain credential for the real events they experience. Technology should not create new inequalities.**

Traditional NFT value discovery relies on secondary market resale prices, which is essentially a "speculation logic"—waiting for the next person willing to pay a higher price. But the value of an Event NFT should not come from the speculation of a few, but from the breadth of its belief and citation in society.

STProof pioneers the "**Citation Tax**" mechanism, returning an event's value to its essence: **The more it is used, the more valuable it is.** Citation count becomes a transparent indicator of an event's influence. Each on-chain citation is a public endorsement of its authenticity, driving high-quality Event NFTs towards value discovery based on facts.

Based on this concept, the protocol designs three parallel value-capture mechanisms, ensuring everyone can participate equally while allowing fact creators to receive continuous returns from the diffusion of their influence.

### 5.1 Roles and Revenue Sources

**Table 3: Protocol Participant Roles and Revenue**

| Role | Contribution | Revenue Source |
| :--- | :--- | :--- |
| **Event Initiator** | Collects evidence, mints NFT. | Royalty (resale), Citation Fee (on-chain citation), Access Fee (paid download). |
| **Verifier (Volunteer)** | Verifies event authenticity, provides signature endorsement. | Reputation points, community recognition. |
| **Verifier (Incentivized)** | Verifies event authenticity, provides signature endorsement. | Verification Fee (ETH). |
| **Template Creator** | Designs verification rules for new event types. | Template Usage Fee (ETH). |
| **Protocol Treasury** | Used for subsidies, audits, community development. | Citation Fee share (30%), Incentivized Verification Fee share (30%). |

### 5.2 Minting and Verification Mechanisms
Anyone can mint an Event NFT by paying only the Gas fee, with no additional minting cost. The protocol provides two verification modes for initiators to choose based on their situation:

**Table 4: Minting and Verification Modes**

| Mode | Cost | Verification Speed | Applicable Scenarios |
| :--- | :--- | :--- | :--- |
| **Community Volunteer Verification** | Free | Slower | Personal memories, family records, non-urgent events. |
| **Incentivized Verification** | Voluntarily paid by initiator | Fast | Events requiring rapid attestation, commercial use. |

### 5.3 Resale Royalty
For each NFT resale, a **5% royalty** of the transaction price (complying with EIP-2981 standard) is charged, **100% of which goes to the Event Initiator**, incentivizing the original recorder of the fact.

### 5.4 On-Chain Citation: The Value of Facts Comes from Being Used
STProof believes the core value of an Event NFT lies not in being resold, but in being **cited**. The Citation Tax is the true instrument reflecting an event's value and the core process for value discovery of high-quality Event NFTs. The more an Event NFT is cited, the greater its influence in society and the stronger its authority as a "fact".

To this end, the protocol introduces a **Citation Fee mechanism**. Any user or smart contract can declare a citation to an Event NFT by calling the `cite` function and paying a small fee (suggested 0.0001 ETH, approx. $0.2). This fee is automatically distributed by the smart contract:
*   **70%** to the Event Initiator.
*   **30%** to the Protocol Treasury.

Each citation is permanently recorded on-chain, becoming credibility proof for the Event NFT. A higher citation count indicates the event is believed and used by more people, increasing its value. Citation records can be directly called by third-party applications (like search engines, credit scoring systems), creating a positive feedback loop.

This mechanism transforms Event NFTs from "collectibles" into "infrastructure", allowing fact creators to receive continuous returns from the diffusion of influence, rather than relying on a few resales.

**Citation Tax Application Scenarios**:

**Table 5: Citation Tax Use Cases**

| Scenario | Who Cites | Why Cite | Value |
| :--- | :--- | :--- | :--- |
| **Academic Research** | Scholars, graduate students | Use STProof attestation as a literature source in papers, proving the authenticity of research basis. | Enhances paper credibility, provides verifiable original evidence for research. |
| **News Reporting** | Journalists, news agencies | Cite on-chain credentials of live events as factual basis, combating deepfakes. | Increases reporting credibility, reduces fact-checking costs. |
| **Auction Houses/Antique Platforms** | Auction houses, trading platforms | Display STProof attestation on product pages; one citation completes trust endorsement. | Reduces buyer doubts, increases transaction success rate. |
| **Court Evidence** | Lawyers, parties | Submit STProof attestation as electronic evidence, citing on-chain records. | Simplifies evidence submission, enhances evidence effectiveness. |
| **Social Media** | General users | Cite an Event NFT to prove a statement is true (e.g., "I was indeed on site"). | Establishes personal credibility in an environment of information chaos. |
| **Smart Contract Calls** | Developers, DeFi protocols | Use event authenticity as a condition for contract execution (e.g., insurance claims, prediction market settlement). | Enables "fact-driven automation". |

### 5.5 Two-Tier Mechanism and Paid Access
To allow users unfamiliar with on-chain operations to contribute to the value of facts, the protocol designs a two-tier evidence access mechanism:

**Table 6: Two-Tier Evidence Access**

| Tier | Content | Access Method | Pricing Model |
| :--- | :--- | :--- | :--- |
| **Public Package** | Thumbnails, key evidence summaries, low-resolution imagery. | IPFS public gateway, CID public. | Free |
| **Full Package** | High-resolution imagery, original receipts, complete GPS track, timestamp certificates, etc. | Accessed via protocol's paid gateway. | Pay-per-view / Subscription |

### 5.6 Multi-Dimensional Extension of Event Value
While the Citation Tax is the core mechanism for STProof to capture event influence, event value is multi-dimensional. The protocol will gradually introduce more value dimensions in the future for a more comprehensive value discovery:

**Table 7: Multi-Dimensions of Event Value**

| Value Dimension | Connotation | Manifestation | Relation to Citation Tax |
| :--- | :--- | :--- | :--- |
| **Scarcity & Uniqueness** | The more irreproducible, globally unique an event is, the higher its value. | "Uniqueness Index"labeled  in NFT attributes, assessed by community or algorithm. | Scarce events are more likely to be cited, indirectly increasing total Citation Tax. |
| **Timeliness & Historical Stage** | The time node of the event's occurrence itself holds significance. | Label "Historical Period" in metadata, making time a value factor. | Historical node events may be repeatedly cited. |
| **Evidence Chain Strength** | The more sufficient the evidence, the more cross-verification, the higher the credibility. | Protocol rates evidence packages (number of independent sources, third-party authoritative endorsement). | High-credibility events have higher citation probability. |
| **Social Resonance & Emotional Value** | Events that evoke widespread emotional resonance have higher value. | Quantify resonance via on-chain "tipping" mechanism or social platform interaction data. | Resonant events may be cited by more ordinary users. |
| **Practicality & Application Value** | The event itself can be called by other applications to generate profit. | Set "Application Revenue Share", distributing  revenue when event is used commercially. | Can complement Citation Tax, requiring new mechanism development. |
| **Combinatorial Value & Narrative Chain** | Multiple events combined form a narrative chain, whose aggregate value exceeds the sum of individual events. | Support "Event Collection" NFTs, whose value is determined by internal event citations and combined scarcity. | Collection events can be cited as a whole, generating higher citation fees. |

**Core Principle**: Citation Tax is the foundation for continuous cash flow; other dimensions act as value amplifiers, affecting citation probability and secondary market pricing. In the future, the protocol will gradually incorporate these dimensions into the value capture system via reputation scoring, dynamic fee rates, application sharing, etc., making event value discovery more comprehensive.

### 5.7 Three-Layer Value Capture Model Summary

**Table 8: Three-Layer Value Capture Model**

| Revenue Source | Trigger Condition | Rate/Amount | Distribution | Target Audience |
| :--- | :--- | :--- | :--- | :--- |
| **Royalty** | NFT resale | 5% of the transaction price | Initiator 100% | Collectors, Investors |
| **On-Chain Citation Fee** | On-chain call to `cite` | 0.0001 ETH per citation | Initiator 70% + Treasury 30% | Developers, Researchers, Users needing public declarations |
| **Paid Access Fee** | Download Full Package via gateway | 0.001 ETH per view or Subscription | Initiator 70% + Treasury 30% | General public, Media, Institutions |

The three are complementary:
*   **Royalty** captures scarcity value.
*   **Citation Fee** captures influence value.
*   **Access Fee** captures knowledge dissemination value.

### 5.8 Protocol Treasury Management
*   **Revenue Sources**: Citation Fee share (30%), Incentivized Verification Fee share (30%).
*   **Initial Management**: Controlled by a 2/3 multi-signature wallet, members including protocol initiators, core contributors, community representatives.
*   **Fund Usage**: Subsidize new template development, smart contract audits, hackathon events, community rewards, subsidize Gas fees (for economically disadvantaged initiators).
*   **Allocation Process**: Community members can propose and apply for funds, executed after multi-signature vote. All income and expenditure are publicly recorded on-chain.

### 5.9 Advantages of the Economic Model

**Table 9: Economic Model Advantages**

| Advantage | Explanation |
| :--- | :--- |
| **Zero-Barrier Participation** | Anyone can mint NFT by paying Gas fee, no additional fees. |
| **Voluntary Payment** | Users needing fast verification can pay voluntarily, not mandatory. |
| **Multi-Layered Value Capture** | Royalty, Citation Fee, Access Fee operate in parallel,Adapt to different user behaviors. |
| **Multi-Dimensional Value Extension** | Dimensions like scarcity, evidence strength, social resonance are gradually incorporated. |
| **Sustainability** | Citation and Access Fees provide long-term cash flow for Protocol Treasury. |
| **No Regulatory Risk** | No token issuance, not a security. |

---
## 6. Compliance and Legal Considerations
The STProof protocol was designed with full consideration of domestic and international regulatory environments, committed to operating within a compliant framework.

### 6.1 Protocol Positioning: Non-Financial Infrastructure
The protocol's core is **fact notarization**, not financial trading. According to the "Notice on Further Preventing and Disposing of Virtual Currency and Related Risks" ("2.6 Notice") issued by the People's Bank of China and seven other ministries in February 2026, the protocol explicitly avoids the following red lines:
*   **Not RWA**: NFTs do **not** anchor ownership or profit rights of physical assets; they only record the event itself.
*   **Not Virtual Currency**: The protocol does **not** issue any tokens; it only uses ETH as technical fuel.
*   **Not a Security**: No fundraising, no dividends, No commitment to profits.

### 6.2 Judicial Recognition
The Supreme People's Court has clarified the legal effect of blockchain notarization. Multiple courts (e.g., Hangzhou Internet Court, Wenzhou Data Resource Tribunal) have also recognized digital collectibles as legally protected online virtual property. STProof's multi-source evidence + trusted timestamp + IPFS storage model meets the requirements for "electronic evidence" in judicial practice, possessing legal effect .

### 6.3 Risk Isolation and Compliance Recommendations
To minimize legal risks, protocol operators (protocol initiators and community) should take the following measures:
1.  **De-financialize the Narrative**: Strictly prohibit using terms like "investment", "appreciation", "dividends" to describe NFTs. Emphasize their "archive", "credential", "citation" attributes.
2.  **Content Review**: Conduct necessary pre-minting review of event content to ensure it does not involve illegal or sensitive information.
3.  **Separation of Domestic and Overseas**: The protocol itself is an open-source public utility; secondary market trading is conducted via overseas compliant entities on overseas platforms, avoiding direct provision of trading services to the mainland Chinese public.
4.  **Data Compliance**: Personal information (e.g., addresses, phone numbers) in public packages is redacted to protect privacy.
5.  **Qualification Filing**: If providing public display website services within China in the future, file according to the "Blockchain Information Service Management Regulations"; if involving operational services, obtain the corresponding permits.

### 6.4 Future Outlook
STProof is committed to becoming the global infrastructure for "fact attestation". As regulatory policies in various countries gradually clarify, the protocol will actively communicate with regulators, promote legal recognition of on-chain notarization, and provide reliable guarantees for ordinary people's right to record facts.

---
## 7. Smart Contract Implementation
### 7.1 Contract Standards
STProof uses smart contracts compliant with the ERC-721 standard, extended with the following functions:
*   **EIP-2981 Royalty**: Automatically distributes resale royalties (100% to Event Initiator).
*   **Dynamic Metadata**: Supports `setTokenURI` function for phased updates of event records.
*   **Dual-Track Verification**: Supports both volunteer and incentivized verification modes.
*   **On-Chain Citation**: Supports `cite` function, recording citations and distributing citation fees.

### 7.2 Core Interface
solidity
interface ISTProof {
    // Mint Event NFT (specify template)
    function mint(address to, uint256 templateId, string memory uri) external;
    function mintWithIncentive(address to, uint256 templateId, string memory uri, address[3] memory validators) external payable;

    // Update metadata
    function setTokenURI(uint256 tokenId, string memory newURI) external;

    // Verification
    function verifyAsVolunteer(uint256 tokenId) external;

    // Citation
    function cite(uint256 tokenId) external payable;
    function getCitationCount(uint256 tokenId) external view returns (uint256);

    // Template Management
    function createTemplate(string memory name, uint256 citationFee, uint256 accessFee, uint256 royaltyRate, bytes memory verificationRules) external returns (uint256 templateId);
}


---
## 8. First Case Study: Attestation of a First Day Cover Mailing Event
To validate protocol feasibility, the initiator (a experienced First Day Cover collector) completed a full event attestation experiment on March 24, 2026.

### 8.1 Event Background
*   **Theme**: Hongkong Post's "Xu Bai Zhai Collection" stamp series issued on March 24, 2026.
*   **Event**: On the first day of issue, a First Day Cover was sent via registered mail from Tin Shui Wai Post Office.
*   **Goal**: Record the complete life cycle from mailing, receipt, to physical object destruction.

### 8.2 Evidence Collection

**Table 10: First Day Cover Case Evidence Collection**

| Evidence Dimension | Collection Method | Result |
| :--- | :--- | :--- |
| **Time** | Post office clock photo, purchase receipt, GPS log. | Multi-source timestamps consistent. |
| **Space** | Mobile GPS recorded KML track (34 waypoints, precision 8 decimal places). | Coordinates 114.004° E, 22.451° N. |
| **Action** | Full-process photo record (purchase, filling, canceling, posting). | Continuous imagery evidence. |
| **Official Record** | Registered mail receipt (Tracking No. RE176993145HK), Hongkong Post website query screenshot. | Verifiable via official system. |
| **Unique Identifier** | Cover serial number HK-FDC-20060324001, consistent with tracking number and coordinates across all evidence. | Closed-loop anchoring. |

*(Note: Image placeholders from the original document are omitted in this text translation.)*

### 8.3 Evidence Solidification and Storage
*   **Trusted Timestamp**: Evidence package applied for a UnionTrust Timestamp on 2026-03-24 16:47:01, Certificate No. TSA-01-20260324896637266.
*   **IPFS Tiered Storage**:
    *   **Public Package**: Contains cover photos, GPS track, postal screenshots (personal info redacted),CID is publicly queryable. 
    *   **Private Package**: Contains all all original materials (including address, phone), CID held only by initiator for directed verification.

### 8.4 Case Significance
*   Proves the feasibility of the STProof protocol in a real-world scenario.
*   Establishes a replicable evidence collection template.
*   Demonstrates the superiority of "dynamic NFT" capability for recording event life cycles.
*   Provides a paradigm for subsequent event types (artworks, artifacts, legal, purely digital events, etc.).

---
## 9. Future Outlook
### 9.1 Event Templates with Physical Objects

**Table 11: Templates for Events with Physical Objects**

| Template | Evidence Requirements | Verifier Profile | Target User Group |
| :--- | :--- | :--- | :--- |
| **First Day Cover/Philately** | GPS, postal records, imagery. | Philatelic association experts,experienced collectors. | Philatelists, stamp dealers. |
| **Artwork Creation** | Creation process documentation, material testing, exhibition history. | Art critics, gallery owners, appraisal experts. | Artists, galleries, collectors. |
| **Archaeology/Artifacts** | Excavation site documentation, stratigraphic info, restoration records. | Archaeologists, museum researchers. | Archaeological institutions, museums. |
| **Ceramics/Handicrafts** | Firing records, signatures, provenance chain. | Master craftsmen, appraisal experts. | Artisans, collectors. |

### 9.2 Event Templates without Physical Objects

**Table 12: Templates for Events without Physical Objects**

| Template | Evidence Requirements | Verifier Profile | Target User Group |
| :--- | :--- | :--- | :--- |
| **Online Publication** | On-chain timestamp, digital signature, third-party archive. | Developers, archiving services. | Authors, media, developers. |
| **On-Chain Vote/Governance** | Transaction hash, voting record, smart contract address. | DAO members, governance researchers. | DAOs, governance platforms. |
| **Opinion Statement** | Digital signature, witness signatures, archive snapshot. | Community witnesses. | Opinion leaders, researchers. |
| **Academic Publication** | Preprint archive, peer review record. | Academic institutions, journal editors. | Scholars, research institutions. |

### 9.3 Hybrid Event Templates

**Table 13: Hybrid Event Templates**

| Template | Evidence Requirements | Verifier Profile | Target User Group |
| :--- | :--- | :--- | :--- |
| **News Scene** | Multi-angle imagery, GPS, timestamp, witnesses. | Journalists, news agencies, fact-checkers. | Journalists, news media. |
| **Legal Notarization** | On-site evidence, witness testimony, appraisal report. | Lawyers, notaries, forensic experts. | Legal practitioners, parties. |
| **Performance/Event** | Ticket stubs, on-site imagery, organizer statement. | Event organizers, witnesses. | Performers, audiences. |

### 9.4 AI-Assisted Verification
With the proliferation of AI generation technology, the cost of forging evidence will be significantly reduced. To counter this challenge, STProof will develop an open-source AI-assisted verification toolkit, implementing a "fight AI with AI" defense strategy.

The toolkit will include the following modules:
*   **Multi-Source Evidence Self-Consistency Checker**: Automatically compares GPS tracks, photo timestamps, receipt times, light/shadow, etc., calculating a self-consistency score.
*   **Image/Video Authenticity Detector**: Based on latest AI forgery detection models, identifies deepfake content created by generative AI.
*   **Official Data Auto-Verifier**: Automatically accesses official systems (postal, weather, notary) to verify receipt, tracking number, timestamp authenticity.
*   **Evidence Chain Completeness Verifier**: Automatically checks if evidence package meets minimum template requirements (e.g., three independent sources, closed loop of unique identifiers).
*   **Verifier Decision Support System**: Synthesizes outputs from above modules, providing suggestions like "High credibility", "Requires Manual Review", "Suspected Forgery" to human verifiers.

AI tools will **not** replace human verifiers but serve as enhancement tools to improve verification efficiency and accuracy. The toolkit itself is maintained open-source by the community and incentivized for continuous improvement via the Protocol Treasury. Verifiers using AI-assisted tools receive reputation point bonuses, forming an efficient "human-machine collaboration" verification network.

### 9.5 Physical Verification Trigger Mechanism
For events where the physical object is retained, the protocol will later introduce a "**Physical Verification Trigger Mechanism**". When on-chain evidence faces serious challenge, any citer or community member can apply for a physical inspection of the object (e.g., carbon-14 dating, paper fiber analysis, ink composition analysis,3D scan of the postmark's relief). The applicant must prepay the inspection cost, executed by an independent third-party institution. Inspection results are compared with on-chain evidence:
*   If results match NFT records, the applicant receives reputation point rewards, and the Event Initiator gains additional credit endorsement.
*   If results mismatch, the Event Initiator loses reputation points, the NFT is marked "Questionable", and the Protocol Treasury may deduct a portion of their future earnings as penalty.

This mechanism extends STProof from the realm of "digital facts" to the ultimate verification of "physical facts", providing the most reliable guarantee for truth. Simultaneously, it clearly distinguishes the roles of "object as original material evidence" and "NFT as event credential", constituting no form of RWA.

### 9.6 Judicial Recognition
Promote the adoption of protocol attestations by courts and arbitration institutions, giving on-chain event credentials legal effect equivalent to traditional notarization.

### 9.7 Ecosystem Positioning: Focus on Heavyweight Facts, Embrace Lightweight Protocols
In the digital attestation field, lightweight protocols like **Ethereum Attestation Service (EAS)** provide low-cost, highly flexible attestation layers. They are suitable for scenarios like identity verification, qualification proof, membership, achieving "good enough" credibility via off-chain models, zero-knowledge proofs, etc.

STProof does **not** attempt to compete with these lightweight protocols in all scenarios. We acknowledge that for a vast number of daily attestation needs, EAS offers a more convenient solution. STProof's positioning is the **anchor point for heavyweight facts**—those high-value events requiring multi-source evidence cross-verification, physical retention, and ultimate arbitration capability. In an era of proliferating AI forgery technology, the scarcity of "truth" will become increasingly prominent, and the evidence strength provided by STProof will become an indispensable guarantee.

To achieve seamless integration with lightweight protocols, STProof will explore verifiable trust transfer mechanisms. For example, verification results from STProof verifiers can be recorded on-chain for automatic reading by protocols like EAS; or develop verification interfaces allowing other protocols to check event status before creating attestations. These technical integrations will position STProof as the "**heavyweight fact layer**" in the digital attestation ecosystem, providing trusted anchor point for lightweight citations.

STProof and lightweight protocols are **not** antagonistic but complementary. We believe the "truth" of the future digital world will have a multi-layered structure: a lightweight layer carried by protocols like EAS, meeting fast , low-cost, privacy-preserving attestation needs; a heavyweight layer carried by STProof, meeting verifiable, physically verifiable, AI-forgery-resistant fact needs.

Together, they will build the trusted fact infrastructure for the digital age. STProof does not seek to be the "most popular" but strives to be the "**most trusted**".

---
## 10. Ecosystem Launch Path and Roadmap
The long-term success of the protocol depends on building an active "fact recorder - verifier - citer" ecosystem. To this end, we have formulated a phased launch path:

**Phase 1: Seed Users & Example Library (2026 Q2)**
Focus on existing "organic communities" with strong authenticity needs, like philately circles, artists,and cultural heritage/antiquity enthusiasts.
*   Deeply record 5-10 events of different types, forming illustrated "step-by-step tutorials" (including evidence collection checklist, timestamp application steps, IPFS upload methods).
*   Invite opinion leaders, such as senior members of Hong Kong/Taiwan philatelic associations, blockchain researchers, legal practitioners as the initial cohort of verifiers, leveraging their reputation to provide early trust endorsement for the protocol.
*   **Goal**: Complete minting of at least 10 high-quality Event NFTs, with stable and reliable verification processes.

**Phase 2: Institutional Citation & Value Demonstration (2026 Q3-Q4)**
*   Collaborate with auction houses, antique platforms, news media, academic institutions to promote the first batch of "institutional citation" cases (e.g., auction house displaying STProof attestation on product pages, media citing on-site records as news sources).
*   Demonstrate the feasibility of Citation Tax through real citation cases, bringing actual revenue to early creators.
*   Develop verification interfaces for other protocols (like EAS) to call STProof's event verification status.
*   **Goal**: Achieve at least 5 institutional citation cases, with a single event's cumulative citations exceeding 10.

**Phase 3: Community Autonomy & Ecosystem Expansion (2027)**
*   Open Event Template creation, allowing the community to design verification rules for more fields.
*   Full operation of the Verifier Reputation System, with incentivized and volunteer verification in parallel.
*   Launch of paid gateways, AI-assisted verification tools.
*   Protocol Treasury begins supporting new template development, hackathons, community rewards.
*   **Goal**: Over 100 events on protocol, over 50 active verifiers, the Citation Tax becomes a stable income source for event initiators.

**Long-Term Vision: Becoming Fact Infrastructure (2028 and Beyond)**
*   Promote judicial recognition for widespread adoption of STProof attestations in courts and arbitration.
*   Deep integration with oracles, EAS, and other protocols, becoming the trusted fact layer of the Web3 ecosystem.
*   Establish a globalized verifier network, covering major languages and fields.

---
## 11. Boundaries of the Protocol
STProof is not omnipotent. Clarifying what the protocol **cannot** do helps manage expectations and avoid misuse.

### 11.1 Protocol is Not Suitable for Purely Subjective Events
The protocol requires events to have objectivity that is "verifiable by a third party". The following types are **not applicable**:
*   "I think today is beautiful." (Subjective feeling)
*   "I think this painting is great." (Subjective evaluation)
*   "I dreamed about something." (Unverifiable private experience)

### 11.2 Protocol is Not Suitable for Unverifiable Private Events
If evidence of an event exists only with the initiator and cannot be independently verified by any third party, the protocol cannot guarantee its authenticity. For example:
*   "I did something secretly, and no one knows."
*   "I have a secret, but I won't tell anyone."
Such events, even if put on-chain, cannot be confirmed by verifiers and will ultimately be marked "Questionable".

### 11.3 Protocol Does Not Guarantee Physical Authenticity of Objects
For events with objects, the protocol guarantees the "correspondence between on-chain evidence and the event", **not** the physical authenticity of the object itself. For example:
*   The protocol can prove "Someone claimed a painting was authentic at a certain time and place."
*   But the protocol cannot prove the painting's age, materials, or author.
The physical authenticity of objects requires reliance on traditional appraisal methods (carbon-14 dating, material analysis, etc.). The future "Physical Verification Trigger Mechanism" can serve as a supplement, but this is **not** the protocol's default function.

### 11.4 Protocol Does Not Provide Object Custody or Insurance Services
The protocol does **not** assume responsibility for custody, transportation, or insurance of physical objects. If the initiator chooses to retain the object, they must manage it themselves. If choosing third-party custody, the protocol only records the custody credential and does not involve itself in the custody relationship.

### 11.5 Protocol Does Not Guarantee Commercial Return from Citation Tax
The Citation Tax is an incentive mechanism designed by the protocol, but the protocol does **not** guarantee that any Event NFT will receive citations. Citation count depends on factors like the event's public value, social influence, and verification strength. **Minting an Event NFT does not constitute an investment act/activity.**

### 11.6 Protocol Does Not Provide Legal Advice
Protocol attestations may be adopted by courts, but legal recognition differs across jurisdictions. Users should consult local legal professionals before using the protocol.

---
## 12. Conclusion
The STProof protocol began with a simple question: "How to prove a First Day Cover was truly mailed on its first day?" Through GPS, postal systems, multi-source imagery, trusted timestamps, IPFS, and dynamic NFT capability, we have built a verifiable, immutable event recording framework.

*STProof: We attest events, not objects.*
*Provable with an object, provable without.*
*All that occurs can be stored; all that is stored can be trusted.*

*Physical objects belong to the physical world; events belong to the blockchain world. NFTs lock events, not items. Thus, it is completely free from the classification of an RWA .*

The first case has completed all evidence collection and storage. The protocol's smart contracts already support dynamic updates, ready to be minted as dynamic Event NFTs. This framework is applicable not only to First Day Covers but can be extended  to any field requiring "fact proof". For events with objects, the object is the carrier; for events without objects, the event itself is everything. In an era of increasing AI forgery, STProof provides a path to counter  meaninglessness and anchor truth.

Recording facts should have no financial barrier. Regardless of wealth, everyone has the right to establish a permanent on-chain credential for the real events they experience. Technology should not create new inequalities.

STProof introduces the "Citation Tax" mechanism, so an event's value is no longer determined by the bids of a few but by how often it is believed and used. Each citation is a vote for truth.

We believe humanity will rely on two methods for recording facts in the future: API-able data handled by oracles, and non-API-able history handled by STProof. Together, they will build the trusted fact infrastructure for the digital age.

**The protocol is open-source. We invite all who believe "facts need to be permanently recorded" to join this experiment.**

---
**Appendix**
*   First Day Cover Case Public Evidence Package CID: `bafy...ionk4` (to be announced)
*   Smart Contract Code: [https://github.com/stproof-protocol/erc721-event](https://github.com/stproof-protocol/erc721-event)
*   Protocol Website: [https://stproof.org](https://stproof.org) (under construction)
*   Discord: [https://discord.gg/stproof](https://discord.gg/stproof)

*This whitepaper version 1.3 will undergo continuous iteration. Final interpretation  rights belong to the STProof community.*