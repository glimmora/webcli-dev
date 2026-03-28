# Octra Wallet - Ledger Integration

This document describes the Ledger hardware wallet integration for the Octra Wallet webcli.

## Overview

The Octra Wallet now supports Ledger Nano S and Nano X hardware wallets for enhanced security. Private keys never leave the device, and all transactions must be physically confirmed on the Ledger.

## Components

### 1. Ledger BOLOS App (`ledger-app/`)

A native application for Ledger devices that provides:
- Secure key derivation (BIP32/BIP44)
- Transaction signing
- Message signing
- Address derivation

**Supported Devices:**
- Ledger Nano S (max 180KB)
- Ledger Nano X (max 400KB)
- Ledger Stax (max 1.5MB)

### 2. WebUSB/WebHID Integration (`static/ledger.js`)

Browser-based communication with Ledger devices:
- WebUSB support (Chrome, Edge)
- WebHID support (Firefox, Chrome)
- Automatic device detection
- Secure APDU communication

### 3. Backend Bridge (`lib/ledger_bridge.*`)

C++ backend for server-side Ledger communication:
- HID device enumeration
- APDU command/response handling
- Transaction signing
- Platform support (Windows, Linux, macOS)

## Installation

### Prerequisites

1. **For building the Ledger app:**
   - Ledger BOLOS SDK
   - GCC ARM Embedded
   - Python 3.x
   - ledgerblue Python package

2. **For using the web wallet:**
   - Modern browser with WebUSB or WebHID support
   - Ledger Nano S/X with Octra app installed

### Building the Ledger App

```bash
cd /root/webcli/ledger-app

# Set up BOLOS SDK path
export BOLOS_SDK=/path/to/ledger-nanos-secure-sdk

# Build for Nano S
make nanos

# Build for Nano X
make nanox

# Load to device
make load-nanos
# or
make load-nanox
```

### Building the Web Wallet

```bash
cd /root/webcli

# Build
make

# Run
./octra_wallet 8420
```

Then open `http://127.0.0.1:8420` in your browser.

## Usage

### Connecting a Ledger Device

1. **Install the Octra app on your Ledger:**
   ```bash
   cd ledger-app
   make load-nanos  # or make load-nanox
   ```

2. **Open the Octra Wallet web interface:**
   - Navigate to `http://127.0.0.1:8420`

3. **Click "Connect Ledger":**
   - A modal will appear with connection instructions

4. **Connect your Ledger:**
   - Plug in your Ledger via USB
   - Unlock with your PIN
   - Open the Octra app on the Ledger
   - Click "Connect" in the browser

5. **Verify the address:**
   - The Ledger will display the derivation path
   - Confirm on the device
   - Your address will be shown in the wallet

### Sending Transactions

When connected via Ledger:

1. Navigate to the "Send" tab
2. Enter recipient address and amount
3. Click "Send"
4. **Verify transaction details on your Ledger:**
   - Recipient address (scroll if needed)
   - Amount
   - Fee
5. Confirm on the Ledger by pressing both buttons
6. Transaction is signed and submitted

### Security Features

- **Private keys never leave the device**
- **All transactions require physical confirmation**
- **Address verification on device screen**
- **Secure element cryptography (Ed25519)**
- **PIN protection on device**

## Technical Details

### APDU Protocol

The Ledger app uses the following APDU commands:

| Command | INS | Description |
|---------|-----|-------------|
| GET_VERSION | 0x00 | Get app version |
| GET_PUBLIC_KEY | 0x01 | Derive public key |
| DERIVE_ADDRESS | 0x03 | Derive address only |
| SIGN_TRANSACTION | 0x02 | Sign transaction |
| SIGN_MESSAGE | 0x04 | Sign message |

### Derivation Path

Octra uses BIP44 with SLIP-44 coin type 3156 (0xC54):

```
m/44'/3156'/0'/0/0
```

- `44'`: BIP44 purpose
- `3156'`: Octra coin type (registered SLIP-44)
- `0'`: Account index
- `0`: Change (0=external, 1=internal)
- `0`: Address index

### Transaction Format

Transactions signed by the Ledger follow this format:

```
[0]  Transaction type (1 byte)
[1]  From address (47 bytes)
[48] To address (47 bytes)
[95] Amount (8 bytes, uint64 BE)
[103] Nonce (4 bytes, uint32 BE)
[107] OU/Fee (4 bytes, uint32 BE)
[111] Timestamp (8 bytes, uint64 BE)
[119] Message length (1 byte, optional)
[120] Message data (variable, optional)
```

### Cryptography

- **Curve**: Ed25519
- **Hash**: SHA-256
- **Address format**: "oct" + base58(SHA256(pubkey))
- **Signature**: 64-byte Ed25519 signature

## Browser Compatibility

| Browser | WebUSB | WebHID | Notes |
|---------|--------|--------|-------|
| Chrome | ✅ | ✅ | Full support |
| Edge | ✅ | ✅ | Full support |
| Firefox | ❌ | ✅ | WebHID only |
| Safari | ❌ | ❌ | Not supported |
| Opera | ✅ | ✅ | Full support |

## Troubleshooting

### "Device not found"

1. Ensure Ledger is unlocked
2. Open the Octra app on the Ledger
3. Try a different USB port
4. Use a direct USB connection (no hub)

### "WebUSB not supported"

- Use Chrome or Edge
- Ensure HTTPS (or localhost)
- Check browser settings

### "Transaction signing failed"

1. Verify transaction details on Ledger screen
2. Ensure you're pressing both buttons to confirm
3. Check that the Octra app is open on Ledger

### "Invalid derivation path"

- The app uses m/44'/3156'/0'/0/0 by default
- Custom paths can be specified in advanced settings

## File Structure

```
webcli/
├── ledger-app/              # Ledger BOLOS app
│   ├── include/
│   │   ├── apdu_codes.h     # APDU command codes
│   │   ├── constants.h      # App constants
│   │   ├── crypto.h         # Crypto functions
│   │   ├── types.h          # Type definitions
│   │   └── ui.h             # UI functions
│   ├── src/
│   │   ├── app.c            # App initialization
│   │   ├── crypto.c         # Crypto implementations
│   │   ├── handler_get.c    # GET handlers
│   │   ├── handler_sign.c   # SIGN handlers
│   │   ├── main.c           # Entry point
│   │   └── ui.c             # UI flows
│   ├── Makefile             # Build system
│   └── README.md            # Ledger app docs
│
├── lib/
│   ├── ledger_bridge.hpp    # Ledger bridge header
│   └── ledger_bridge.cpp    # Ledger bridge impl
│
├── static/
│   ├── ledger.js            # WebUSB/WebHID client
│   ├── index.html           # Updated with Ledger UI
│   ├── wallet.js            # Updated with Ledger logic
│   └── style.css            # Updated with Ledger styles
│
└── main.cpp                 # Updated with ledger_bridge
```

## Security Considerations

1. **Always verify addresses on the Ledger screen**
2. **Never share your Ledger recovery phrase**
3. **Keep your Ledger firmware updated**
4. **Only use official Ledger apps**
5. **Verify transaction amounts before confirming**

## License

This project is licensed under the GNU General Public License v2.0.

## Copyright

Copyright 2025-2026 Octra Labs
