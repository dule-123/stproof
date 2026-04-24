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
