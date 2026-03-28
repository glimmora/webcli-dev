#!/bin/bash
# =============================================================================
# Octra Wallet Ledger App - Cleanup Script
# Removes build artifacts and installed app
# Copyright 2025-2026 Octra Labs
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"

print_status() { echo -e "${GREEN}✓${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }

echo ""
echo -e "${BLUE}Cleaning build artifacts...${NC}"

# Clean build directory
if [ -d "$APP_DIR/build" ]; then
    rm -rf "$APP_DIR/build"
    print_status "Removed build directory"
else
    print_info "No build directory found"
fi

# Delete app from device (optional)
read -p "Delete Octra app from Ledger device? (y/N): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_info "Deleting app from device..."
    python3 -m ledgerblue.deleteApp --appName "Octra" 2>/dev/null && \
        print_status "App deleted from device" || \
        print_info "App was not installed or device not connected"
fi

echo ""
print_status "Cleanup complete!"
echo ""
