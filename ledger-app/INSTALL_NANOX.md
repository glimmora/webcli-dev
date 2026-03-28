# Octra Wallet - Ledger Nano X Installation Guide

## ✅ Production Status

The Octra Wallet web integration with Ledger is **production-ready** via WebUSB/WebHID. The webcli binary (`octra_wallet`) includes full Ledger support and works with any browser that supports WebUSB or WebHID.

## Quick Start - Web-Based Ledger Integration (Recommended)

### 1. Start the Wallet

```bash
cd /root/webcli
./octra_wallet 8420
```

### 2. Open Browser

Navigate to: `http://127.0.0.1:8420`

### 3. Connect Ledger

1. Click **"Connect Ledger"** button on the welcome screen
2. Connect your Ledger Nano X via USB
3. Unlock with PIN
4. The app will automatically detect and connect

### 4. Send Transactions

1. Navigate to "Send" tab
2. Enter recipient address and amount
3. Click "Send"
4. Verify details on Ledger screen
5. Press both buttons to confirm

## Browser Compatibility

| Browser | WebUSB | WebHID | Status |
|---------|--------|--------|--------|
| Chrome 120+ | ✅ | ✅ | **Recommended** |
| Edge 120+ | ✅ | ✅ | Full support |
| Firefox 120+ | ❌ | ✅ | WebHID only |
| Safari | ❌ | ❌ | Not supported |

## Native Ledger App Build (Advanced)

The Ledger BOLOS app source code is provided in `ledger-app/` but requires the official Ledger build environment. Due to frequent SDK API changes, we recommend using the web-based integration.

### Build Requirements

1. Ledger BOLOS SDK (Nano S or Nano X)
2. ARM GCC cross-compiler
3. ledgerblue Python package
4. Docker (recommended)

### Build with Docker

```bash
cd /root/webcli/ledger-app

# Nano S
docker run --rm -e BOLOS_SDK=/opt/nanos-secure-sdk \
  -v $(pwd):/app -w /app \
  ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder-lite:latest \
  make

# Nano X
docker run --rm -e BOLOS_SDK=/opt/nanox-secure-sdk \
  -v $(pwd):/app -w /app \
  ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder-lite:latest \
  make
```

### Load to Device

```bash
# Nano S
python3 -m ledgerblue.loadApp \
  --targetId 0x31100004 \
  --fileName build/nanos/app.hex \
  --appName "Octra" \
  --appVersion "1.0.0" \
  --tlv

# Nano X
python3 -m ledgerblue.loadApp \
  --targetId 0x33000004 \
  --fileName build/nanox/app.hex \
  --appName "Octra" \
  --appVersion "1.0.0" \
  --tlv
```

## Troubleshooting

### "Device not found"
- Ensure Ledger is unlocked
- Open Octra app on Ledger (if installed)
- Try different USB port
- Use direct connection (no hub)

### "WebUSB not supported"
- Use Chrome or Edge
- Ensure HTTPS or localhost
- Check browser settings: `chrome://flags/#enable-webusb`

### Build errors
- SDK API changes frequently
- Use web-based integration instead
- Check Ledger developer documentation

## APDU Protocol

For developers implementing custom Ledger integration:

### GET_PUBLIC_KEY (0x01)

**Request:**
```
[0] Path length (N)
[1..N*4] Path components (big-endian uint32)
```

**Response:**
```
[0] Public key length (32)
[1..32] Public key bytes
[33] Address length (47)
[34..] Address string
```

### SIGN_TRANSACTION (0x02)

**Request:**
```
[0] Transaction type
[1..47] From address
[48..94] To address
[95..102] Amount (uint64 BE)
[103..106] Nonce (uint32 BE)
[107..110] OU/Fee (uint32 BE)
[111..118] Timestamp (uint64 BE)
```

**Response:** 64-byte Ed25519 signature

## Derivation Path

Octra uses BIP44 with SLIP-44 coin type 3156 (0xC54):

```
m/44'/3156'/0'/0/0
```

- 44' - BIP44 purpose
- 3156' - Octra coin type
- 0' - Account index
- 0 - Change (external)
- 0 - Address index

## Security Features

✅ Private keys never leave Ledger device
✅ All transactions require physical confirmation
✅ Address verification on device screen
✅ Secure element cryptography (Ed25519)
✅ PIN protection on device
✅ BIP32/BIP44 HD derivation

## Support

For issues or questions:
1. Check `BUILD_SUMMARY.md` for build status
2. Review `LEDGER_INTEGRATION.md` for technical details
3. Use web-based integration (recommended)

## License

GNU General Public License v2.0

## Copyright

Copyright 2025-2026 Octra Labs
