# Octra Wallet with Ledger Integration

A complete cryptocurrency wallet for the Octra blockchain with Ledger hardware wallet support.

## Supported Devices

| Device | Target | Speculos Emulation |
|--------|--------|--------------------|
| Ledger Nano X | `nanox` | Yes |
| Ledger Nano S Plus | `nanos2` | Yes |

## Project Structure

```
webcli-dev/
├── octra_wallet              # Built binary (1.5 MB)
├── main.cpp                  # Web server with Ledger bridge
├── Makefile                  # Build system
│
├── ledger-app/
│   ├── src/
│   │   └── main.c            # BOLOS app (single source file)
│   ├── icons/
│   │   └── octra.gif         # App icon
│   ├── Makefile              # Build configuration
│   ├── dist/                 # Build outputs
│   │   ├── nanox/            # Nano X artifacts
│   │   └── nanos2/           # Nano S Plus artifacts
│   └── scripts/              # Build and test scripts
│
├── lib/
│   ├── ledger_bridge.hpp     # C++ bridge header
│   └── ledger_bridge.cpp     # C++ bridge implementation
│
├── static/
│   ├── ledger.js             # WebUSB/WebHID client
│   ├── index.html            # Web UI with Ledger support
│   ├── wallet.js             # Wallet logic
│   └── style.css             # Styles
│
├── LEDGER_INTEGRATION.md     # Technical details
├── BUILD_SUMMARY.md          # Build status
└── QUICK_START.md            # Quick start guide
```

## Quick Start

### 1. Build and Test the Ledger App

```bash
cd ledger-app

# Full automated setup
./scripts/setup-build-test.sh all
```

### 2. Build the Web Wallet

```bash
cd ..
make
```

### 3. Run the Wallet

```bash
./octra_wallet 8420
```

Open `http://127.0.0.1:8420` in Chrome or Edge.

### 4. Connect Your Ledger

1. Click "Connect Ledger" on the welcome screen
2. Connect your Ledger via USB and unlock
3. Confirm address on device

## APDU Protocol

| Command | INS | Description |
|---------|-----|-------------|
| GET_VERSION | 0x00 | Get app version and device type |
| GET_PUBLIC_KEY | 0x01 | Derive public key and address |
| SIGN_TRANSACTION | 0x02 | Sign transaction |
| DERIVE_ADDRESS | 0x03 | Derive address only |
| SIGN_MESSAGE | 0x04 | Sign message |

### Response Codes

| Code | Description |
|------|-------------|
| 0x9000 | Success |
| 0x6985 | Conditions not satisfied |
| 0x6A80 | Invalid data |
| 0x6700 | Wrong length |
| 0x6F00 | Internal error |

## Browser Compatibility

| Browser | WebUSB | WebHID |
|---------|--------|--------|
| Chrome | Yes | Yes |
| Edge | Yes | Yes |
| Firefox | No | Yes |
| Safari | No | No |

## Documentation

- [ledger-app/README.md](ledger-app/README.md) - Build system and APDU protocol
- [ledger-app/INSTALL_NANOX.md](ledger-app/INSTALL_NANOX.md) - Installation guide
- [LEDGER_INTEGRATION.md](LEDGER_INTEGRATION.md) - Technical integration details

## License

GNU General Public License v2.0

Copyright 2025-2026 Octra Labs
