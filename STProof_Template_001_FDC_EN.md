# STProof Template #001
## STProof-FirstDayCover (FDC) First Day Cover Event Attestation Standard

### Basic Information
- **Underlying Protocol**: STProof Protocol v5.2
- **Template ID**: TEMPLATE-001
- **Template Type**: Official Scenario-Based Event Attestation Standard
- **Release Status**: Officially Effective
- **Applicable Chain**: Ethereum Sepolia Testnet (Mainnet Compatible)

### Core Positioning
STProof-FDC is the **first official event attestation template in the STProof Protocol ecosystem**, built on the STProof v5.2 underlying protocol. It is the first practical application of the protocol’s core concept: "Verify Events, Not Assets".
Designed specifically for the philately and digital collection communities, this template focuses on the first day cover (FDC) mailing scenario. Through **Zero-Knowledge Ideological Attestation**, it realizes on-chain credible certification, traceability, and verification of physical philatelic events. It does not map physical property rights, touch copyrights, or carry RWA regulatory risks.

## I. Scope of Application
This template applies to on-chain event attestation for various philatelic items that comply with postal industry standards, including:
1. First day cover mailings, local first day covers on the stamp issuance date
2. Official commemorative covers and thematic philatelic covers
3. Traceability of philatelic collection transactions and inheritance records
4. On-chain filing of philatelic exhibition collections and collections from collecting institutions

## II. Attestation Objects (Objective Events Only)
This template only attests to the following truly occurring, verifiable postal/collecting events, and does not involve any ownership of physical assets:
1. **First Day Postmark Event**: The act of legally stamping a first day postmark/commemorative postmark on the date of stamp issuance.
2. **Mailing and Circulation Event**: The act of completing the mailing of a first day cover through the official postal system to form a complete postal route.
3. **Collection Authentication Event**: The act of professional grading, condition appraisal, and inheritance of first day covers.

## III. Zero-Knowledge Ideological Attestation Evidence Specifications (Mandatory)
Following the principle of zero-knowledge evidence collection, no privacy is disclosed, no stamp copyright is infringed, and no complete collection images are displayed. Only the following core evidence needs to be submitted:
1. **Key Postmark Information**: A close-up of the postmark, clearly showing the issuance date and post office name.
2. **Envelope Feature Information**: Key features such as the postmark position on the envelope, stamp edges, and postal route traces.
3. **Trusted Time Certificate**: The official stamp issuance date and the mailing date.
4. **Depositor’s Authenticity Statement**: A concise handwritten statement + handwritten signature + date of the day on the back of the first day cover.

## IV. Attestation Operation Process
1. Physical Operation: Complete the entire process of pasting stamps on the first day cover, stamping the first day postmark, and mailing, to obtain complete postal route postmarks.
2. Statement Signing: Handwrite the depositor’s authenticity statement on the blank space on the back of the first day cover, then sign and mark the date of the day.
3. Zero-Knowledge Evidence Collection: Take photos of core evidence segments in accordance with specifications, without photographing the complete collection or disclosing sender/receiver privacy information.
4. IPFS Attestation: Package and upload all evidence to IPFS to generate a unique CID.
5. On-Chain Attestation: Call the **STProof v5.2 main contract**, fill in event information and IPFS CID, and mint an Event NFT.
6. On-Chain Anchoring: Complete the on-chain retention of event information and IPFS CID to achieve tamper-proof attestation.

## V. On-Chain Identification Specifications
When minting an Event NFT, the following identifiers must be uniformly added to the metadata for template distinction and on-chain verification:
```
{
  "protocol": "STProof v5.2",
  "template": "STProof-FDC",
  "templateId": "001",
  "eventType": "FirstDayCover Attestation"
}
```

## VI. Core Principles
1. **Event Uniqueness Principle**: Only attest to truly occurring objective events; do not evaluate collection value or attest to physical objects.
2. **Zero-Knowledge Principle**: Evidence collection does not infringe copyright or disclose privacy, only verifies the authenticity of events.
3. **Contract Reuse Principle**: Reuse the STProof v5.2 main contract throughout; do not deploy new separate contracts.
4. **Compliance and Credibility Principle**: No risk of financial speculation; complies with philatelic industry standards and blockchain regulatory requirements.
5. **Tamper-Proof Principle**: Dual protection of on-chain data + IPFS attestation, ensuring evidence is permanently retained and traceable for verification.

## VII. Verification Rules
The community/third parties can complete zero-knowledge verification in the following ways without obtaining the complete physical object/original image:
1. Verify that the postmark date is consistent with the official stamp issuance date.
2. Verify that the evidence is not tampered with, AI-generated, or forged.
3. Confirm that the depositor’s authenticity statement is standardized and valid.
4. On-chain verification of consistency between the IPFS CID and the contract-stored information.

## VIII. Depositor’s Handwritten Statement on the Back of the Cover (Ultimate Concise Version)
> I confirm: The evidence of this cover is authentic, not tampered with, and not AI-generated. I am responsible for its authenticity and use it for STProof zero-knowledge attestation.
> Signature: __________
> Date: __________

---
**Associated Document**: STProof Protocol v5.2 Whitepaper
**Contract Address**: 0x037eb54EF9dae9A2Ae33bFB9ba170F1067B925CB
**Official Note**: This template is the first scenario-based application template of the STProof Protocol. The community can freely use and promote it based on these specifications.
