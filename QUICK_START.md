# Octra Wallet - Quick Start Guide

## Option 1: Web-Based Integration (Recommended)

No native app compilation needed. Works with any Ed25519 Ledger app.

### Step 1: Start the Wallet
```bash
./octra_wallet 8420
```

### Step 2: Open Browser
Navigate to `http://127.0.0.1:8420`

### Step 3: Connect Ledger
1. Click "Connect Ledger" button
2. Connect your Ledger via USB
3. Unlock with PIN
4. Click "Connect" in browser
5. Confirm address on device

### Step 4: Use Wallet
- View balance and transactions
- Send transactions (confirmed on Ledger)
- Sign messages

---

## Option 2: Native Ledger App (Advanced)

Build and install a custom Octra app on your Ledger device.

### Prerequisites
- ARM GCC cross-compiler
- Ledger Secure SDK
- Clang
- Python 3 with `speculos` and `ledgerblue`

All prerequisites are installed automatically by the setup script.

### Step 1: Setup and Build
```bash
cd ledger-app
./scripts/setup-build-test.sh all
```

This installs prerequisites, builds for Nano X and Nano S Plus, and runs Speculos tests.

### Step 2: Start Wallet
```bash
./scripts/start-wallet.sh
```

### Step 3: Open Browser
Navigate to `http://127.0.0.1:8420`

### Step 4: Connect Ledger
1. Open the Octra app on your Ledger
2. Click "Connect Ledger" in browser
3. Confirm address on device

---

## Supported Devices

| Device | Target | Build Command |
|--------|--------|---------------|
| Nano X | `nanox` | `./scripts/build.sh nanox` |
| Nano S Plus | `nanos2` | `./scripts/build.sh nanos2` |

**Note:** The original Ledger Nano S is not supported by recent Speculos versions.

---

## Testing with Speculos

```bash
cd ledger-app

# Test both devices
./scripts/setup-build-test.sh test

# Manual test (Nano X)
speculos --display headless -m nanox -a 25 --apdu-port 9999 dist/nanox/app.elf
```

---

## Troubleshooting

### "ledgerblue not found"
```bash
pip3 install --break-system-packages ledgerblue
```

### "Device not detected"
1. Ensure Ledger is unlocked
2. Try different USB port
3. Use direct connection (no hub)
4. On Linux: `sudo ./scripts/setup-udev.sh`

### "Build failed"
```bash
# Reinstall all dependencies
./scripts/setup-build-test.sh setup
```

---

## License

GNU General Public License v2.0

Copyright 2025-2026 Octra Labs
