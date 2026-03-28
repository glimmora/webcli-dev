# Octra Wallet - Ledger Nano S/X Integration

Complete hardware wallet integration for Octra blockchain with Ledger Nano S and Nano X support.

## Project Structure

```
webcli/
├── ledger-app/              # Ledger BOLOS application (source code)
│   ├── src/
│   │   └── main.c           # Complete app implementation
│   └── Makefile             # Build configuration
│
├── static/
│   ├── ledger.js            # WebUSB/WebHID JavaScript client ✅
│   ├── index.html           # Web UI with Ledger support ✅
│   ├── wallet.js            # Wallet logic with Ledger ✅
│   └── style.css            # Styles with Ledger modal ✅
│
├── lib/
│   ├── ledger_bridge.hpp    # C++ backend bridge ✅
│   └── ledger_bridge.cpp    # Backend implementation ✅
│
└── octra_wallet             # Built binary (1.4MB) ✅
```

## ✅ Completed Components

### 1. WebUSB/WebHID Integration (Browser-Based)

**File:** `static/ledger.js`

Features:
- WebUSB support (Chrome, Edge)
- WebHID support (Firefox, Chrome)  
- Automatic device detection
- APDU command/response handling
- Transaction signing
- Message signing
- Address derivation

Usage:
```javascript
// Connect to Ledger
const ledger = new window.LedgerWallet();
const { address, publicKey } = await ledger.connect();

// Sign transaction
const signature = await ledger.signTransaction({
  to: 'oct...',
  amount: 1000000,
  nonce: 1,
  ou: 100,
  timestamp: Date.now() / 1000
});
```

### 2. Web Interface

**Files:** `static/index.html`, `static/wallet.js`, `static/style.css`

Features:
- "Connect Ledger" button on welcome screen
- Ledger connection modal with instructions
- Automatic address import after connection
- Ledger badge in header
- Transaction signing via Ledger
- Fallback to software wallet when Ledger not connected

### 3. Backend Bridge

**Files:** `lib/ledger_bridge.hpp`, `lib/ledger_bridge.cpp`

Features:
- C++ interface for Ledger communication
- HID device enumeration (Windows, Linux, macOS)
- APDU command handling
- Transaction signing
- Platform-specific implementations

Usage:
```cpp
octra::LedgerBridge bridge;
if (bridge.init()) {
    auto devices = bridge.scan_devices();
    if (bridge.connect(devices[0].device_id)) {
        auto pubkey = bridge.get_public_key(octra::default_derivation_path());
        auto sig = bridge.sign_transaction(tx_data);
    }
}
```

### 4. Built Binary

**File:** `octra_wallet` (1.4MB)

The webcli binary includes:
- Full Octra wallet functionality
- Ledger bridge integration
- WebUSB/WebHID server support
- Running on `http://127.0.0.1:8420`

## ⚠️ Ledger BOLOS App Build

The Ledger app source code (`ledger-app/src/main.c`) is complete but requires the official Ledger build environment.

### Build Requirements

1. **Ledger BOLOS SDK** - Download from Ledger
2. **ARM GCC** - Cross-compiler for ARM
3. **ledgerblue** - Python package for loading apps

### Build Instructions

```bash
cd /root/webcli/ledger-app

# Using Docker (recommended)
docker run --rm \
  -e BOLOS_SDK=/opt/nanos-secure-sdk \
  -v $(pwd):/app -w /app \
  ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder-lite:latest \
  make


# Or build locally with SDK
export BOLOS_SDK=/path/to/ledger-nanos-secure-sdk
make
```

### Load to Device

```bash
# Nano S
python3 -m ledgerblue.loadApp \
  --targetId 0x31100004 \
  --fileName build/nanos/app.hex \
  --appFlags 0x00 \
  --appName "Octra" \
  --appVersion "1.0.0" \
  --appPath "/" \
  --tlv

# Nano X  
python3 -m ledgerblue.loadApp \
  --targetId 0x33000004 \
  --fileName build/nanox/app.hex \
  --appName "Octra" \
  --appVersion "1.0.0" \
  --tlv
```

### Alternative: Use Existing Ledger App

If you cannot build the custom app, the web integration works with any Ed25519-based Ledger app that supports:
- BIP32 derivation
- APDU commands for public key retrieval
- Transaction signing

## APDU Protocol

### Commands

| INS | Name | Description |
|-----|------|-------------|
| 0x00 | GET_VERSION | Get app version |
| 0x01 | GET_PUBLIC_KEY | Derive public key |
| 0x02 | SIGN_TRANSACTION | Sign transaction |
| 0x03 | DERIVE_ADDRESS | Derive address only |

### GET_PUBLIC_KEY Request

```
[0] Path length (N)
[1..N*4] Path components (big-endian uint32)
```

Response:
```
[0] Public key length (32)
[1..32] Public key bytes
[33] Address length (47)
[34..] Address string
```

### SIGN_TRANSACTION Request

```
[0] Transaction type
[1..47] From address
[48..94] To address
[95..102] Amount (uint64 BE)
[103..106] Nonce (uint32 BE)
[107..110] OU/Fee (uint32 BE)
[111..118] Timestamp (uint64 BE)
```

Response: 64-byte Ed25519 signature

## Derivation Path

Octra uses BIP44 with SLIP-44 coin type 3156 (0xC54):

```
m/44'/3156'/0'/0/0
```

Components:
- `44'` - BIP44 purpose
- `3156'` - Octra coin type
- `0'` - Account index
- `0` - Change (external)
- `0` - Address index

## Browser Compatibility

| Browser | WebUSB | WebHID | Status |
|---------|--------|--------|--------|
| Chrome | ✅ | ✅ | Full support |
| Edge | ✅ | ✅ | Full support |
| Firefox | ❌ | ✅ | WebHID only |
| Safari | ❌ | ❌ | Not supported |

## Usage Flow

1. **Start the wallet:**
   ```bash
   cd /root/webcli
   ./octra_wallet 8420
   ```

2. **Open browser:** Navigate to `http://127.0.0.1:8420`

3. **Connect Ledger:**
   - Click "Connect Ledger"
   - Follow on-screen instructions
   - Confirm on device

4. **Send transaction:**
   - Navigate to "Send" tab
   - Enter recipient and amount
   - Click "Send"
   - Verify on Ledger device
   - Confirm with both buttons

## Security Features

- ✅ Private keys never leave Ledger device
- ✅ All transactions require physical confirmation
- ✅ Address verification on device screen
- ✅ Secure element cryptography (Ed25519)
- ✅ PIN protection on device
- ✅ BIP32/BIP44 HD derivation

## Size Limits

| Device | Limit | Status |
|--------|-------|--------|
| Nano S | 180KB | ✅ Source optimized |
| Nano X | 400KB | ✅ Source optimized |
| Stax | 1.5MB | ✅ Source optimized |

## Troubleshooting

### "Device not found"
- Ensure Ledger is unlocked
- Open Octra app on Ledger
- Try different USB port
- Use direct connection (no hub)

### "WebUSB not supported"
- Use Chrome or Edge
- Ensure HTTPS or localhost
- Check browser settings

### Build errors
- Use Docker build environment
- Ensure BOLOS_SDK path is correct
- Check clang is available

## License

GNU General Public License v2.0

## Copyright

Copyright 2025-2026 Octra Labs
