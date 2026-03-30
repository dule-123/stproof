# STProof Protocol

> **A Universal On-Chain Attestation and Value Capture Protocol for "Events"**

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Whitepaper](https://img.shields.io/badge/Whitepaper-v1.3.1-brightgreen.svg)](whitepapers/STProof_Whitepaper_EN_v1.3.1.md)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/dule-123/stproof/pulls)

**English** | [中文](./README_zh.md)

**STProof (Spatial-Temporal Proof)** is an innovative blockchain protocol designed to provide decentralized, immutable on-chain attestation for unique historical events in the physical and digital worlds that **cannot be verified via standardized APIs**.

In an era of rampant AI deepfakes, we are committed to building a verifiable, permanent anchor for **facts**.

## 🌟 Core Philosophy
- **We attest events, not objects**: Physical objects belong to the physical world; we anchor the "event" itself, not any associated assets. This fundamentally avoids RWA (Real World Asset) regulatory risks.
- **Recording facts should have no financial barrier**: Anyone can mint an event credential by paying only the **network Gas fee**, making the recording of history equitable.
- **Value stems from influence**: The pioneering **"Citation Tax"** model ensures that an event's value is tied to how often it is cited on-chain, not to secondary market speculation.

## 🧩 Key Innovations
1.  **Event Attestation**: Shifts the paradigm from "asset attestation" to **"event attestation"**. Physical objects are merely optional carriers of proof for an event.
2.  **Multi-Source Cross-Verification**: Requires evidence from at least two independent sources (e.g., GPS, official records, imagery) to corroborate each other, and is validated by a community or professional verifier network to build strong credibility.
3.  **Extensible Event Template System**: Through the **"Event Template"** system, the community can define custom verification rules for different fields (art creation, news documentation, academia, etc.).
4.  **Compliant & Physically-World Connected**: Clearly does not bind to physical asset ownership but supports connection to the physical world via an optional "physical object retention" mechanism, with interfaces reserved for future physical verification (e.g., carbon-14 testing).

## 📁 Quick Start
To dive deep into all the details of the protocol, please read our complete whitepaper:

**[📖 Read Full Whitepaper (v1.3.1)](whitepapers/STProof_Whitepaper_EN_v1.3.1.md)** (Recommended)
This is the latest and most detailed specification of the protocol, including architecture, economic model, technical implementation, and case studies.

We also provide versions in other formats:
- [Download Portable PDF Version](whitepapers/STProof_Whitepaper_EN_v1.3.1.pdf) (Suitable for reading & printing)
- [View Machine-Readable Summary (`summary.json`)](./summary.json) (For AI agents and developer tools)
- [View One-Pager Summary (PDF)](whitepapers/STProof_Whitepaper_One_Pager_EN.pdf) (For quick pitching)

## 🔧 Technical Implementation
- **Smart Contract Standard**: ERC-721 (NFT) extension, supporting EIP-2981 royalties.
- **Core Functions**: `mint` (minting), `cite` (citation), `verify` (verification).
- **Evidence Storage**: Evidence packages are solidified with trusted timestamps and stored on decentralized storage networks like IPFS/Arweave.
- **Core Code Repository**: [`stproof-protocol/erc721-event`](https://github.com/stproof-protocol/erc721-event) (Contains deployable contract code).

## 🎯 Application Scenarios
- **Collectibles & Historical Records**: First Day Cover mailing, artwork creation process, archaeological sites.
- **Content & Intellectual Property**: First publication of online content, academic priority attestation, live news scene documentation.
- **Legal & Commercial**: Important contract signing, notarization of live events, key node records in supply chains.

## 🗺️ Roadmap
- **2026 Q2 (Current)**: Core contract deployment and audit. Focus on completing the closed-loop verification of the first case (First Day Cover mailing).
- **2026 Q3-Q4**: Develop and open-source "Event Template" creation tools and verifier dashboards. Launch the community verifier recruitment program.
- **2027**: Open community governance, enabling proposal and voting mechanisms for event templates. Explore integration with more physical-world verification services.

## 👥 Community & Contribution
We are an open-source project. We welcome all developers, researchers, and community members passionate about "recording facts" to join us.

- **Discussion & Chat**: Join our [Discord](https://discord.gg/stproof) or [Telegram](https://t.me/stproof).
- **Report Issues & Suggestions**: Use the GitHub [Issues](https://github.com/dule-123/stproof/issues) page.
- **Contribute Code**: Please read the contribution guidelines (to be refined) and submit your code via [Pull Requests](https://github.com/dule-123/stproof/pulls).

## 📄 Protocol Boundaries
- This protocol is not suitable for purely subjective feelings or personal opinions.
- This protocol does not guarantee the physical authenticity of objects.
- This protocol does not provide any form of investment advice or financial services.

## 📜 License
This project is licensed under the [MIT License](LICENSE).

---

**STProof - All that occurs can be stored; all that is stored can be trusted.**

*The protocol is still in early development. Welcome to explore and build with us.*