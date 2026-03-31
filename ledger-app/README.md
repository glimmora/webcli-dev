# Octra Wallet - Ledger Integration

Complete hardware wallet integration for Octra blockchain with Ledger Nano S Plus and Nano X support.

## Supported Devices

| Device | Target | Speculos | Size Limit |
|--------|--------|----------|------------|
| Ledger Nano X | `nanox` | Yes | 400 KB |
| Ledger Nano S Plus | `nanos2` | Yes | 180 KB |

**Note:** The original Ledger Nano S (target `nanos`) is not supported by recent versions of Speculos. Use a real device or the Nano S Plus emulator.

## Project Structure

```
ledger-app/
├── src/
│   └── main.c              # Complete app implementation (single-file)
├── icons/
│   └── octra.gif           # App icon
├── dist/                   # Build outputs (created by build)
│   ├── nanox/              # Nano X build artifacts
│   │   ├── app.elf         # ELF for Speculos
│   │   ├── app.hex         # Hex for device loading
│   │   └── app.map         # Memory map
│   └── nanos2/             # Nano S Plus build artifacts
│       ├── app.elf
│       ├── app.hex
│       └── app.map
├── scripts/                # Build and deployment scripts
│   ├── setup-build-test.sh # Full setup + build + test
│   ├── build.sh            # Build for single target
│   ├── install.sh          # Install to physical device
│   ├── test-integration.sh # Integration test suite
│   └── start-wallet.sh     # Start web wallet
└── Makefile                # Build configuration
```

## Quick Start

### Full Automated Setup (installs everything)

```bash
cd ledger-app
./scripts/setup-build-test.sh all
```

This installs ARM GCC, clones the Ledger SDK, builds for both targets, and runs Speculos tests.

### Build Only

```bash
./scripts/build.sh nanox     # Build for Nano X
./scripts/build.sh nanos2    # Build for Nano S Plus
```

### Test with Speculos

```bash
./scripts/setup-build-test.sh test
```

### Start Web Wallet

```bash
./scripts/start-wallet.sh
# Open http://127.0.0.1:8420
```

## Build System

### Prerequisites (auto-installed by setup-build-test.sh)

- **ARM GCC 13.3.1** - Cross-compiler for ARM Cortex-M
- **Ledger Secure SDK** - From https://github.com/LedgerHQ/ledger-secure-sdk
- **Clang** - Required by the SDK build system
- **Speculos** - Ledger device emulator (`pip install speculos`)
- **ledgerblue** - For device loading (`pip install ledgerblue`)

### Manual Build

```bash
export PATH="$HOME/tools/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin:$PATH"
export BOLOS_SDK=/path/to/ledger-secure-sdk
export TARGET=nanox

make clean
make API_LEVEL=25
```

Output: `bin/app.elf`, `bin/app.hex`

### Makefile Targets

| Target | Description |
|--------|-------------|
| `make TARGET=nanox` | Build for Nano X |
| `make TARGET=nanos2` | Build for Nano S Plus |
| `make build-all` | Build for all targets, save to `dist/` |
| `make load` | Load app to connected device |
| `make delete` | Delete app from device |
| `make clean` | Clean build artifacts |
| `make distclean` | Clean everything including `dist/` |

## APDU Protocol

### Commands

| INS | Name | Description |
|-----|------|-------------|
| 0x00 | GET_VERSION | Get app version and device type |
| 0x01 | GET_PUBLIC_KEY | Derive public key and address |
| 0x02 | SIGN_TRANSACTION | Sign transaction data |
| 0x03 | DERIVE_ADDRESS | Derive address only |
| 0x04 | SIGN_MESSAGE | Sign arbitrary message |

### GET_VERSION Response

```
[0] Major version
[1] Minor version
[2] Patch version
[3] Device type (1=Nano S, 2=Nano X, 3=Nano S Plus, 4=Stax)
```

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
[34..80] Address string ("oct" + base58)
```

### SIGN_TRANSACTION Request

```
[0]  Transaction type
[1..47] From address (47 bytes ASCII)
[48..94] To address (47 bytes ASCII)
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

- `44'` - BIP44 purpose
- `3156'` - Octra coin type
- `0'` - Account index
- `0` - Change (external)
- `0` - Address index

## Speculos Testing

Speculos emulates Ledger devices using QEMU. The app is tested with:

```bash
speculos --display headless -m nanox -a 25 --apdu-port 9999 dist/nanox/app.elf
```

**Known Speculos limitation:** Non-hardened Ed25519 derivation (components 4 and 5 in `m/44'/3156'/0'/0/0`) fails in Speculos but works on real hardware. Tests use all-hardened paths to verify crypto operations.

## Webcli Integration

The APDU protocol is fully compatible with the `octra_wallet` webcli:

- `static/ledger.js` - WebUSB/WebHID browser client
- `lib/ledger_bridge.cpp` - C++ backend bridge
- Both use CLA=0xE0 and the same INS codes

### Connection Flow

1. Start webcli: `./octra_wallet 8420`
2. Open `http://127.0.0.1:8420`
3. Click "Connect Ledger"
4. WebUSB/WebHID connects to the Ledger device
5. GET_PUBLIC_KEY derives address on-device
6. Transactions are signed on-device via SIGN_TRANSACTION

## Browser Compatibility

| Browser | WebUSB | WebHID | Status |
|---------|--------|--------|--------|
| Chrome | Yes | Yes | Full support |
| Edge | Yes | Yes | Full support |
| Firefox | No | Yes | WebHID only |
| Safari | No | No | Not supported |

## Security

- Private keys never leave the Ledger device
- All transactions require physical button confirmation
- Address verification on device screen
- Secure element cryptography (Ed25519)
- PIN protection on device
- BIP32/BIP44 HD derivation

## License

GNU General Public License v2.0

Copyright 2025-2026 Octra Labs
