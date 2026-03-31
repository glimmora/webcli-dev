# Octra Wallet - Ledger Integration

This document describes the Ledger hardware wallet integration for the Octra Wallet.

## Overview

The Octra Wallet supports Ledger Nano X and Nano S Plus hardware wallets. Private keys never leave the device, and all transactions must be physically confirmed.

## Components

### 1. Ledger BOLOS App (`ledger-app/`)

A native application for Ledger devices providing:
- Secure key derivation (BIP32/BIP44)
- Transaction signing (Ed25519)
- Message signing
- Address derivation

**Supported Devices:**
- Ledger Nano X (400 KB limit)
- Ledger Nano S Plus (180 KB limit)

The app is a single source file (`src/main.c`) built with the Ledger Secure SDK.

### 2. WebUSB/WebHID Integration (`static/ledger.js`)

Browser-based communication with Ledger devices via WebUSB (Chrome, Edge) and WebHID (Firefox, Chrome).

### 3. Backend Bridge (`lib/ledger_bridge.*`)

C++ backend for server-side Ledger communication via USB HID.

## Building the Ledger App

```bash
cd ledger-app

# Automated setup (installs ARM GCC, SDK, builds, tests)
./scripts/setup-build-test.sh all

# Or manual build
export BOLOS_SDK=/path/to/ledger-secure-sdk
export TARGET=nanox
make API_LEVEL=25
```

Output: `dist/nanox/app.elf`, `dist/nanox/app.hex`

## Testing with Speculos

```bash
# Test both targets
./scripts/setup-build-test.sh test

# Manual test
speculos --display headless -m nanox -a 25 --apdu-port 9999 dist/nanox/app.elf
```

## Building the Web Wallet

```bash
cd ..
make
./octra_wallet 8420
```

Open `http://127.0.0.1:8420` in Chrome or Edge.

## APDU Protocol

| Command | INS | Description |
|---------|-----|-------------|
| GET_VERSION | 0x00 | Get app version and device type |
| GET_PUBLIC_KEY | 0x01 | Derive public key and address |
| SIGN_TRANSACTION | 0x02 | Sign transaction |
| DERIVE_ADDRESS | 0x03 | Derive address only |
| SIGN_MESSAGE | 0x04 | Sign message |

### Derivation Path

```
m/44'/3156'/0'/0/0
```

- 44' - BIP44 purpose
- 3156' - Octra coin type (SLIP-44)
- 0' - Account index
- 0 - Change (external)
- 0 - Address index

### Transaction Format

```
[0]     Transaction type (1 byte)
[1-47]  From address (47 bytes ASCII)
[48-94] To address (47 bytes ASCII)
[95-102] Amount (uint64 BE)
[103-106] Nonce (uint32 BE)
[107-110] OU/Fee (uint32 BE)
[111-118] Timestamp (uint64 BE)
```

### Cryptography

- **Curve:** Ed25519
- **Hash:** SHA-256
- **Address:** "oct" + base58(SHA256(pubkey))
- **Signature:** 64-byte Ed25519

## Browser Compatibility

| Browser | WebUSB | WebHID |
|---------|--------|--------|
| Chrome | Yes | Yes |
| Edge | Yes | Yes |
| Firefox | No | Yes |
| Safari | No | No |

## Troubleshooting

### "Device not found"
- Ensure Ledger is unlocked
- Open the Octra app on Ledger
- Try different USB port
- Use direct USB connection (no hub)

### "WebUSB not supported"
- Use Chrome or Edge
- Ensure `http://localhost` or `https://`

### Build errors
- Run `./scripts/setup-build-test.sh setup`
- Ensure `clang` is installed

## License

GNU General Public License v2.0

Copyright 2025-2026 Octra Labs
