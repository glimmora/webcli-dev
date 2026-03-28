# Octra Wallet with Ledger Integration

A complete cryptocurrency wallet for the Octra blockchain with full Ledger hardware wallet support.

## Project Structure

```
webcli/
├── ledger-app/              # Ledger Nano S/X BOLOS application
│   ├── include/
│   │   ├── apdu_codes.h     # APDU command definitions
│   │   ├── constants.h      # App constants and limits
│   │   ├── crypto.h         # Cryptographic functions
│   │   ├── types.h          # Type definitions
│   │   └── ui.h             # UI flow definitions
│   ├── src/
│   │   ├── app.c            # Application initialization
│   │   ├── crypto.c         # Ed25519 crypto implementation
│   │   ├── handler_get.c    # GET command handlers
│   │   ├── handler_sign.c   # SIGN command handlers
│   │   ├── main.c           # Main entry point
│   │   └── ui.c             # User interface flows
│   ├── Makefile             # Build system
│   ├── Makefile.ledger      # BOLOS SDK rules
│   └── README.md            # Ledger app documentation
│
├── lib/
│   ├── ledger_bridge.hpp    # Ledger C++ bridge header
│   └── ledger_bridge.cpp    # Ledger C++ bridge implementation
│
├── static/
│   ├── ledger.js            # WebUSB/WebHID JavaScript client
│   ├── index.html           # Web interface (with Ledger support)
│   ├── wallet.js            # Wallet logic (with Ledger integration)
│   └── style.css            # Styles (with Ledger modal)
│
├── main.cpp                 # Main server (with ledger_bridge)
├── Makefile                 # Build system
└── LEDGER_INTEGRATION.md    # Detailed integration docs
```

## Features

### Ledger Hardware Wallet Support

- **Nano S**: Full support (180KB app size limit)
- **Nano X**: Full support (400KB app size limit)
- **Stax**: Full support (1.5MB app size limit)

### Security Features

- Private keys never leave the Ledger device
- All transactions require physical confirmation
- Address verification on device screen
- Secure element cryptography (Ed25519)
- PIN protection on device
- BIP32/BIP44 HD derivation (m/44'/3156'/0'/0/0)

### Web Interface Features

- WebUSB support (Chrome, Edge)
- WebHID support (Firefox, Chrome)
- Automatic device detection
- Secure APDU communication
- Transaction signing via Ledger
- Message signing via Ledger

## Quick Start

### 1. Build the Ledger App

```bash
cd /root/webcli/ledger-app

# Set BOLOS SDK path
export BOLOS_SDK=/path/to/ledger-nanos-secure-sdk

# Build for your device
make nanos    # Nano S
make nanox    # Nano X
make stax     # Stax

# Load to device
make load-nanos
# or
make load-nanox
```

### 2. Build the Web Wallet

```bash
cd /root/webcli
make
```

### 3. Run the Wallet

```bash
./octra_wallet 8420
```

Open `http://127.0.0.1:8420` in your browser.

### 4. Connect Your Ledger

1. Click "Connect Ledger" on the welcome screen
2. Follow the on-screen instructions
3. Verify and confirm on your Ledger device

## APDU Protocol

### Commands

| Command | INS | Description |
|---------|-----|-------------|
| GET_VERSION | 0x00 | Get app version |
| GET_PUBLIC_KEY | 0x01 | Derive public key |
| DERIVE_ADDRESS | 0x03 | Derive address |
| SIGN_TRANSACTION | 0x02 | Sign transaction |
| SIGN_MESSAGE | 0x04 | Sign message |

### Response Codes

| Code | Description |
|------|-------------|
| 0x9000 | Success |
| 0x5501 | User cancelled |
| 0x6A86 | Invalid P1/P2 |
| 0x6A80 | Invalid data |
| 0x6700 | Wrong length |
| 0x6985 | Conditions not satisfied |
| 0x6F00 | Internal error |

## Browser Compatibility

| Browser | WebUSB | WebHID |
|---------|--------|--------|
| Chrome | ✅ | ✅ |
| Edge | ✅ | ✅ |
| Firefox | ❌ | ✅ |
| Safari | ❌ | ❌ |

## Technical Specifications

### Cryptography

- **Curve**: Ed25519
- **Hash**: SHA-256
- **Address format**: `oct` + base58(SHA256(pubkey))
- **Signature**: 64-byte Ed25519

### Derivation Path

```
m/44'/3156'/0'/0/0
```

- 44': BIP44 purpose
- 3156': Octra coin type (SLIP-44)
- 0': Account index
- 0: Change (external)
- 0: Address index

### App Size

| Device | Limit | Actual |
|--------|-------|--------|
| Nano S | 180KB | ~50KB |
| Nano X | 400KB | ~50KB |
| Stax | 1.5MB | ~50KB |

## Documentation

- [LEDGER_INTEGRATION.md](LEDGER_INTEGRATION.md) - Detailed integration guide
- [ledger-app/README.md](ledger-app/README.md) - Ledger app documentation

## License

GNU General Public License v2.0

## Copyright

Copyright 2025-2026 Octra Labs
