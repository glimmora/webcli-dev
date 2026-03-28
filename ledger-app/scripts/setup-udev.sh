#!/bin/bash
# =============================================================================
# Octra Wallet - Linux UDEV Rules Setup
# Enables USB access to Ledger devices without root
# Copyright 2025-2026 Octra Labs
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Ledger UDEV Rules Setup (Linux)${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    print_error "This script must be run as root (sudo)"
    echo ""
    echo "Usage: sudo ./scripts/setup-udev.sh"
    echo ""
    exit 1
fi

# Create udev rules file
UDEV_RULES="/etc/udev/rules.d/20-ledger.rules"

print_info "Creating udev rules file: $UDEV_RULES"

cat > "$UDEV_RULES" << 'EOF'
# Ledger Nano S
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001", MODE="0660", GROUP="plugdev", TAG+="uaccess"

# Ledger Nano X
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004", MODE="0660", GROUP="plugdev", TAG+="uaccess"

# Ledger Nano S Plus
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0005", MODE="0660", GROUP="plugdev", TAG+="uaccess"

# Ledger Stax
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0006", MODE="0660", GROUP="plugdev", TAG+="uaccess"

# Ledger Blue
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0100", MODE="0660", GROUP="plugdev", TAG+="uaccess"

# HIDRAW access (for WebHID)
KERNEL=="hidraw*", ATTRS{idVendor}=="2c97", MODE="0660", GROUP="plugdev", TAG+="uaccess"
EOF

print_status "UDEV rules file created"

# Reload udev rules
print_info "Reloading udev rules..."
udevadm control --reload-rules
udevadm trigger

print_status "UDEV rules reloaded"

# Check if plugdev group exists
if ! getent group plugdev > /dev/null 2>&1; then
    print_info "Creating plugdev group..."
    groupadd plugdev
    print_status "plugdev group created"
fi

# Add current user to plugdev group
CURRENT_USER=$(whoami)
print_info "Adding user '$CURRENT_USER' to plugdev group..."

if usermod -aG plugdev "$CURRENT_USER"; then
    print_status "User added to plugdev group"
else
    print_warning "Could not add user to plugdev group"
fi

echo ""
print_status "UDEV rules setup complete!"
echo ""
print_info "IMPORTANT: You must LOG OUT and LOG BACK IN for changes to take effect"
echo ""
echo "Alternatively, run:"
echo "  newgrp plugdev"
echo ""
print_info "After logging in, verify with:"
echo "  lsusb | grep Ledger"
echo ""
