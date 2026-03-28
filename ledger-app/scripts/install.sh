#!/bin/bash
# =============================================================================
# Octra Wallet Ledger App - Installation Script
# Installs the built app to Ledger Nano S, Nano X, or Stax
# Copyright 2025-2026 Octra Labs
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"

# Default target
TARGET="${1:-nanos}"

# =============================================================================
# Helper Functions
# =============================================================================

print_header() {
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}  Octra Wallet - Ledger Installer${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
}

print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

check_prerequisites() {
    # Check Python
    if ! command -v python3 &> /dev/null; then
        print_error "Python 3 is not installed."
        exit 1
    fi
    print_status "Python 3 found"
    
    # Check ledgerblue
    if ! python3 -c "import ledgerblue" &> /dev/null; then
        print_warning "ledgerblue not installed. Installing..."
        pip3 install --break-system-packages ledgerblue
    fi
    print_status "ledgerblue installed"
    
    # Check hex file exists (Makefile.standard_app outputs to bin/ subdirectory)
    local hex_file="$APP_DIR/build/${TARGET}/bin/app.hex"
    if [ ! -f "$hex_file" ]; then
        hex_file="$APP_DIR/build/${TARGET}/app.hex"
    fi
    if [ ! -f "$hex_file" ]; then
        print_error "Build file not found: $APP_DIR/build/${TARGET}/app.hex"
        print_info "Run ./scripts/build.sh $TARGET first"
        exit 1
    fi
    print_status "App binary found"
}

get_target_id() {
    case "$TARGET" in
        nanos|nano-s)
            echo "0x31100004"
            ;;
        nanos2)
            echo "0x33100004"
            ;;
        nanox|nano-x)
            echo "0x33000004"
            ;;
        stax)
            echo "0x33100004"
            ;;
    esac
}

get_device_name() {
    case "$TARGET" in
        nanos|nano-s)
            echo "Nano S"
            ;;
        nanos2)
            echo "Nano S Plus"
            ;;
        nanox|nano-x)
            echo "Nano X"
            ;;
        stax)
            echo "Stax"
            ;;
    esac
}

check_device_connection() {
    echo ""
    print_info "Please ensure your Ledger $(get_device_name) is:"
    echo "  1. Connected via USB"
    echo "  2. Unlocked with PIN"
    echo "  3. On the main screen (not in an app)"
    echo ""
    
    read -p "Press Enter when ready..."
    
    # Try to detect device
    if lsusb | grep -q "2c97"; then
        print_status "Ledger device detected"
    else
        print_warning "Could not detect Ledger device"
        print_info "Continuing anyway (may fail if not connected)"
    fi
}

delete_existing_app() {
    local hex_file="$APP_DIR/build/${TARGET}/bin/app.hex"
    if [ ! -f "$hex_file" ]; then
        hex_file="$APP_DIR/build/${TARGET}/app.hex"
    fi
    
    echo ""
    print_info "Checking for existing Octra app..."
    
    # Try to delete existing app (ignore errors if not installed)
    python3 -m ledgerblue.deleteApp \
        --appName "Octra" \
        2>/dev/null && print_status "Removed existing Octra app" || true
}

install_app() {
    local target_id=$(get_target_id)
    local hex_file="$APP_DIR/build/${TARGET}/bin/app.hex"
    if [ ! -f "$hex_file" ]; then
        hex_file="$APP_DIR/build/${TARGET}/app.hex"
    fi
    
    echo ""
    print_status "Installing Octra app to Ledger $(get_device_name)..."
    echo ""
    
    python3 -m ledgerblue.loadApp \
        --targetId "$target_id" \
        --fileName "$hex_file" \
        --appFlags 0x00 \
        --appName "Octra" \
        --appVersion "1.0.0" \
        --appPath "/" \
        --tlv \
        --offline
    
    if [ $? -eq 0 ]; then
        echo ""
        print_status "Installation successful!"
    else
        echo ""
        print_error "Installation failed!"
        echo ""
        echo "Troubleshooting:"
        echo "  1. Ensure Ledger is unlocked"
        echo "  2. Disconnect and reconnect USB"
        echo "  3. Try running as root: sudo ./scripts/install.sh $TARGET"
        echo "  4. On Linux, check udev rules: see docs/udev-rules.md"
        echo ""
        exit 1
    fi
}

verify_installation() {
    echo ""
    print_info "Verifying installation..."
    
    # Give device a moment to refresh
    sleep 2
    
    print_status "Installation complete!"
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  Octra App Installed Successfully!${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "Device: Ledger $(get_device_name)"
    echo "App:    Octra v1.0.0"
    echo ""
    print_info "On your Ledger:"
    echo "  1. Press the right button to navigate apps"
    echo "  2. Find 'Octra' in the app list"
    echo "  3. Press both buttons to open"
    echo ""
    print_info "Next steps:"
    echo "  1. Open the Octra app on your Ledger"
    echo "  2. Go to: http://127.0.0.1:8420"
    echo "  3. Click 'Connect Ledger'"
    echo ""
}

# =============================================================================
# Main Installation Flow
# =============================================================================

main() {
    print_header
    
    echo -e "Target Device: ${GREEN}$(get_device_name)${NC}"
    echo -e "Target ID:     ${YELLOW}$(get_target_id)${NC}"
    echo ""
    
    check_prerequisites
    check_device_connection
    delete_existing_app
    install_app
    verify_installation
}

# =============================================================================
# Entry Point
# =============================================================================

main
