# STProof Physical Event Proof SOP

This directory contains the complete standard operating procedure for converting physical events to on-chain NFTs.

## Process Overview

Event Design → Official Bulletin → Field Execution → Data Collection → Hash → OTS → IPFS → Three-Layer JSON → Mint


### Detailed Steps

| Phase | Description |
|-------|-------------|
| 01 Event Design | Define stamp theme, date, location, handwritten codes |
| 02 Official Bulletin | Capture release announcement with URL proof |
| 03 Field Execution | 5 mandatory photos + segmented video + GPS + weather |
| 04 Data Collection | Redact, rename, organize into 3-layer folder structure |
| 05 Hash Calculation | Compute SHA256 for every file |
| 06 OTS Timestamp | Generate OpenTimestamps proofs (Bitcoin-anchored) |
| 07 IPFS Upload | Upload public assets + OTS files to IPFS, record CIDs |
| 08 Three-Layer JSON | Generate JSON with L1/L2/L3 hash manifests |
| 09 NFT Minting | Mint NFT on OpenSea / STProof contract |

---

## 配套资源 / Supporting Resources

- Printable checklist card
- Excel templates
- Batch calculation scripts

---

## Real Case

- [2026-04-20 深圳南油首日实寄 #001](../../STProof-Event-Proofs/STProof_FDC_SZ_20260420_001_metadata.json)

---

## Core Principles

> **Public files = OTS + IPFS**
> **Private files = SHA256 only (not uploaded)**
> **L1 Public Common = Shared across all covers**
> **L2 Independent Public = Unique per cover**
> **L3 Private = Unique per cover, no original images**
> **cid = CID of the file itself**
> **timestamp_proof_cid = CID of the corresponding .ots file**
> **Not the same, cannot be empty**
> 
