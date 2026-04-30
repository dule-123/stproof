{
  "version": "1.0",
  "name": "AI Trust Anchor: Physical Notarization of a Declaration",
  "description": "A hybrid cyber-physical proof. A philosophical declaration about AI's value anchored to a physical, irreversible entropy event (a registered mail) in the real world.",
  "authors": ["Du Le"],
  "created": "2024-04-30T12:00:00Z",
  "anchoring_event": {
    "date": "2024-04-30",
    "location": "Huinan'an Post Office, Huizhou, China",
    "carrier": "China Post Registered Mail",
    "tracking_number": "XA 4997 8771 0 44",
    "purpose": "To physically notarize the digital essay and the act itself."
  },
  "assets": {
    "primary": {
      "name": "AI_Anchor_Essay.txt",
      "description": "The core philosophical essay.",
      "hash": "sha256:889deac5...d6be57123",
      "hash_algorithm": "SHA-256",
      "proof": "ots_timestamp.ots",
      "type": "text/plain"
    },
    "proof_bundle": {
      "name": "AI_Anchor_Proof_Full_20260430.zip",
      "description": "Complete evidence bundle containing all photos, GPS data, sensor logs, and receipts.",
      "hash": "sha256: 1a47c05507f9c59d2dd4842139096e1d671d170745c87a06dac27e333e2236a0",
      "hash_algorithm": "SHA-256",
      "proof": "ots_timestamp_for_zip.ots",
      "note": "This is the master archive. Stored off-chain for cost efficiency."
    }
  },
  "verification": {
    "instructions": "1. Verify the OTS proof of the primary document. 2. Check the hash of the ZIP against the one listed. 3. Validate tracking number with China Post.",
    "ots_verification_url": "https://opentimestamps.org"
  },
  "license": "CC BY-SA 4.0",
  "notes": "The physical letter serves as the ultimate root of trust. The digital proofs serve as unforgeable witnesses."
}
