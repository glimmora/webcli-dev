# Octra Wallet - Ledger Device Installation Guide

## Supported Devices

- **Ledger Nano X** (target: `nanox`)
- **Ledger Nano S Plus** (target: `nanos2`)

## Web-Based Integration (Recommended)

No native app compilation needed. Works with any Ed25519 Ledger app.

### Start the Wallet

```bash
./octra_wallet 8420
```

Open `http://127.0.0.1:8420` in Chrome or Edge, then click "Connect Ledger".

## Building the Native App

### Prerequisites

The setup script installs everything automatically:

```bash
cd ledger-app
./scripts/setup-build-test.sh setup
```

This installs:
- ARM GCC 13.3.1 toolchain
- Ledger Secure SDK (from GitHub)
- Python packages: `speculos`, `ledgerblue`

### Build

```bash
# Nano X
./scripts/build.sh nanox

# Nano S Plus
./scripts/build.sh nanos2
```

Artifacts are saved to `dist/<target>/`.

### Test with Speculos

```bash
# Start Speculos emulator
speculos --display headless -m nanox -a 25 --apdu-port 9999 dist/nanox/app.elf

# Or run the full test suite
./scripts/setup-build-test.sh test
```

### Load to Physical Device

Connect your Ledger, unlock with PIN, then:

```bash
./scripts/install.sh nanox
# or
./scripts/install.sh nanos2
```

## APDU Protocol

For developers implementing custom Ledger integration:

### GET_VERSION (0x00)

**Request:** `E0 00 00 00`

**Response:**
```
[0] Major version
[1] Minor version
[2] Patch version
[3] Device type (2=Nano X, 3=Nano S Plus)
```

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
[34..80] Address string
```

### SIGN_TRANSACTION (0x02)

**Request:**
```
[0]  Transaction type
[1..47]  From address (47 bytes)
[48..94] To address (47 bytes)
[95..102] Amount (uint64 BE)
[103..106] Nonce (uint32 BE)
[107..110] OU/Fee (uint32 BE)
[111..118] Timestamp (uint64 BE)
```

**Response:** 64-byte Ed25519 signature

### SIGN_MESSAGE (0x04)

**Request:** Message bytes

**Response:** 64-byte Ed25519 signature

## Derivation Path

```
m/44'/3156'/0'/0/0
```

- 44' - BIP44 purpose
- 3156' - Octra coin type (SLIP-44)
- 0' - Account index
- 0 - Change (external)
- 0 - Address index

## Troubleshooting

### "Device not found"
- Ensure Ledger is unlocked
- Open the Octra app on Ledger
- Try a different USB port
- Use direct connection (no USB hub)

### "WebUSB not supported"
- Use Chrome or Edge
- Ensure `http://localhost` or `https://`
- Check `chrome://flags/#enable-webusb`

### Build errors
- Run `./scripts/setup-build-test.sh setup` to reinstall dependencies
- Ensure `clang` is installed (`apt install clang`)
- Check that the SDK was cloned: `ls ledger-secure-sdk/Makefile.standard_app`

## License

GNU General Public License v2.0

Copyright 2025-2026 Octra Labs
