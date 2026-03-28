#!/bin/bash
# =============================================================================
# Octra Wallet - Quick Start Script
# Starts the web wallet with Ledger support
# =============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"
WEBCLI_DIR="$(dirname "$APP_DIR")"

echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Octra Wallet - Quick Start        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Check if octra_wallet exists
if [ ! -f "$WEBCLI_DIR/octra_wallet" ]; then
    echo -e "${YELLOW}Building web wallet...${NC}"
    cd "$WEBCLI_DIR"
    make
fi

echo -e "${GREEN}✓ Web wallet ready${NC}"
echo ""
echo -e "${BLUE}Starting server on http://127.0.0.1:8420${NC}"
echo ""
echo -e "${YELLOW}To use with Ledger:${NC}"
echo "  1. Connect your Ledger Nano S/X via USB"
echo "  2. Unlock with PIN"
echo "  3. Open http://127.0.0.1:8420 in Chrome/Edge"
echo "  4. Click 'Connect Ledger'"
echo ""
echo -e "${YELLOW}Press Ctrl+C to stop${NC}"
echo ""

cd "$WEBCLI_DIR"
./octra_wallet 8420
