# macOS/Linux
shasum -a 256 filename.jpg

# Windows PowerShell
Get-FileHash filename.jpg -Algorithm SHA256

# Install
pip install opentimestamps-client

# Generate proof
ots stamp filename.jpg

# Upgrade (wait for blockchain confirmation)
ots upgrade filename.jpg.ots

# Verify
ots verify filename.jpg.ots

# Which Files Need OTS?

File Type                   OTS Required        Reason

Public photos (redacted)       ✅ Yes      Prove tamper-proof  

Public videos (redacted)       ✅ Yes        Same as above

GPS track files                ✅ Yes      Prove spatiotemporal track

Public hash manifest (.txt)    ✅ Yes      Prove manifest integrity

Private hash manifest (.txt)   ✅ Yes      Prove existence

Private original images        ❌ No       Not on-chain

Only files uploaded to IPFS need OTS

# Create Hash Manifest

PUBLIC_COMMON.txt Template：

STProof_FDC_20260420_PUBLIC_COMMON_Hash_OTS

filename.jpg
SHA256    xxx...
CID       bafybei...
OTS_CID   bafkreif...

PRIVATE_XXX.txt Template：

STProof_FDC_20260420_XXX_PRIVATE_Hash_OTS

filename.jpg
SHA256    xxx...
filename.jpg.ots
SHA256    xxx...

(No CID, original images not uploaded)

# JSON Structure Template

{
  "name": "Stamp Theme - Location First Day Cover NFT #number",
  "name_en": "English Name - Location First Day Cover NFT #number",
  "description": "Detailed description...",
  "image": "ipfs://main_image_CID",
  "attributes": [
    { "trait_type": "Event Type", "value": "Stamp First-Day Mailing" },
    { "trait_type": "Serial Number", "value": "XXX" }
  ],
  "copyright_statement": { ... },
  "properties": {
    "public_assets": [...],
    "restricted_asset_declarations": [...]
  }
}

#  public_assets Field Specification

Each public asset contains:

{
  "name": "filename.jpg",
  "description": "Description",
  "type": "image/jpeg",
  "cid": "bafyxxx（CID of the file itself）",
  "timestamp_proof_cid": "bafyxxx（CID of the .ots file）"
}

# restricted_asset_declarations Field Specification

{
  "name": "private_filename.jpg",
  "description": "Description (Contains Sensitive Info)",
  "declaration_txt_cid": "bafyxxx（CID of PRIVATE_XXX.txt）",
  "verification_note": "This file's hash is anchored by Opentimestamp..."
}

# Three-Layer Structure in JSON

Layer	          File	       JSON Location
L1 Public Common	PUBLIC_COMMON.txt + .ots	public_assets first item
L2 Independent Public	PUBLIC_XXX.txt + .ots	public_assets second item
L3 Private	PRIVATE_XXX.txt + .ots	public_assets third item
Private Reference	PRIVATE_XXX.txt	restricted_asset_declarations[].declaration_txt_cid
