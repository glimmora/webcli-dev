# Octra Wallet - Quick Start Guide

## Option 1: Web-Based Ledger Integration (Recommended)

No native app compilation needed. Works with any Ed25519 Ledger app.

### Step 1: Start the Wallet
```bash
cd /root/webcli
./octra_wallet 8420
```

### Step 2: Open Browser
Navigate to `http://127.0.0.1:8420`

### Step 3: Connect Ledger
1. Click "Connect Ledger" button
2. Connect your Ledger via USB
3. Unlock with PIN
4. Open any Ed25519 app on Ledger (e.g., Solana, Cardano)
5. Click "Connect" in browser
6. Confirm address on device

### Step 4: Use Wallet
- View balance and transactions
- Send transactions (confirmed on Ledger)
- Sign messages

**Benefits:**
- ✅ No compilation required
- ✅ No SDK dependencies
- ✅ Same security guarantees
- ✅ Works with any Ed25519 Ledger app
- ✅ Automatic updates

---

## Option 2: Native Ledger App (Advanced)

Build and install a custom Octra app on your Ledger device.

### Prerequisites
- Docker installed and running
- Python 3 with ledgerblue package

### Step 1: Build the App
```bash
cd /root/webcli/ledger-app
./scripts/build.sh nanos
```

### Step 2: Install to Device
```bash
./scripts/install.sh nanos
```

### Step 3: Start Wallet
```bash
./scripts/start-wallet.sh
```

### Step 4: Open Browser
Navigate to `http://127.0.0.1:8420`

### Step 5: Connect Ledger
1. Open the Octra app on your Ledger
2. Click "Connect Ledger" in browser
3. Confirm address on device

---

## Supported Devices

| Device | Build Command | Size Limit |
|--------|--------------|------------|
| Nano S | `./scripts/build.sh nanos` | 180 KB |
| Nano S Plus | `./scripts/build.sh nanos2` | 180 KB |
| Nano X | `./scripts/build.sh nanox` | 400 KB |
| Stax | `./scripts/build.sh stax` | 1.5 MB |

---

## Troubleshooting

### "Docker not found"
```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
# Log out and back in
```

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
Use web-based integration instead (Option 1 above).

---

## Integration Test

Run comprehensive tests to verify everything works:
```bash
cd /root/webcli/ledger-app
./scripts/test-integration.sh
```

---

## Security

- Private keys never leave Ledger device
- All transactions require physical confirmation
- Address verification on device screen
- Secure element cryptography (Ed25519)
- PIN protection on device

---

## License

GNU General Public License v2.0

Copyright 2025-2026 Octra Labs
