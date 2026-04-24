### 3.1 Folder Structure Standard

STProof_FDC_20260420_XXX/
├── 00_Raw/ # Phone exports
├── 01_Public/ # Upload to IPFS
├── 02_OTS/ # .ots files
└── 03_Private/ # Local only, not uploaded


### 3.2 File Naming Standard

| Type | Format | Example |
|------|--------|---------|
| Stamp release | `STProof_FDC_YYYYMMDD_001.png` | |
| Post office | `STProof_FDC_YYYYMMDD_002.jpg` | |
| On-site record | `STProof_FDC_YYYYMMDD_HHMMSS.jpg` | |
| Video | `VID_STP_FDC_YYYYMMDD_HHMMSS.mp4` | |
| GPS | `STP_FDC_YYYYMMDD_HHMMSS.gpx` | |

### 3.3 Redaction Rules

| Sensitive Content | Method |
|-------------------|--------|
| Sender/recipient address | Crop or mosaic |
| ID number, QR code | Mosaic |
| Full tracking number | Mosaic (keep last 4 digits) |
| Others' portraits | Mosaic or crop |
| Newspaper content | Keep only header + date |

> ⚠️ Stamp images do not need redaction (but copyright must be declared)  
> ⚠️ Postmark date must be clearly readable

### 3.4 Public vs Private Assets

| Category | Definition | Storage |
|----------|-------------|---------|
| Public Assets | Redacted photos, videos, GPX, OTS | Upload to IPFS |
| Private Assets | Original sensitive images | Local only |

### 3.5 Three-Layer Hash Manifest System

| Layer | File | Purpose | Independence |
|-------|------|---------|--------------|
| L1 Public Common | `PUBLIC_COMMON.txt` | Shared public evidence | 1 copy shared |
| L2 Independent Public | `PUBLIC_XXX.txt` | Cover-specific public evidence | Unique per cover |
| L3 Private | `PRIVATE_XXX.txt` | Cover-specific private file list | Unique per cover |

> Each `.txt` has a corresponding `.ots` file
