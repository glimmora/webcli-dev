#!/bin/bash
# =============================================================================
# Octra Wallet - Integration Test Script
# Tests all components: webcli, ledger-app, and scripts
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
WEBCLI_DIR="$(dirname "$APP_DIR")"

print_status() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }
print_header() {
    echo ""
    echo -e "${BLUE}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  Octra Wallet - Integration Test Suite              ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
}

TESTS_PASSED=0
TESTS_FAILED=0
TESTS_TOTAL=0

run_test() {
    local name="$1"
    local cmd="$2"
    TESTS_TOTAL=$((TESTS_TOTAL + 1))
    
    echo -n "  Testing: $name ... "
    if eval "$cmd" > /dev/null 2>&1; then
        echo -e "${GREEN}PASS${NC}"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}FAIL${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
}

print_header

# =============================================================================
# Test 1: Directory Structure
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 1: Directory Structure${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "webcli directory exists" "[ -d '$WEBCLI_DIR' ]"
run_test "ledger-app directory exists" "[ -d '$APP_DIR' ]"
run_test "scripts directory exists" "[ -d '$SCRIPT_DIR' ]"
run_test "src directory exists" "[ -d '$APP_DIR/src' ]"
run_test "include directory exists" "[ -d '$APP_DIR/include' ]"
run_test "icons directory exists" "[ -d '$APP_DIR/icons' ]"
run_test "static directory exists" "[ -d '$WEBCLI_DIR/static' ]"
run_test "lib directory exists" "[ -d '$WEBCLI_DIR/lib' ]"

echo ""

# =============================================================================
# Test 2: Required Files
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 2: Required Files${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "main.c exists" "[ -f '$APP_DIR/src/main.c' ]"
run_test "Makefile exists" "[ -f '$APP_DIR/Makefile' ]"
run_test "webcli Makefile exists" "[ -f '$WEBCLI_DIR/Makefile' ]"
run_test "main.cpp exists" "[ -f '$WEBCLI_DIR/main.cpp' ]"
run_test "ledger_bridge.hpp exists" "[ -f '$WEBCLI_DIR/lib/ledger_bridge.hpp' ]"
run_test "ledger_bridge.cpp exists" "[ -f '$WEBCLI_DIR/lib/ledger_bridge.cpp' ]"
run_test "ledger.js exists" "[ -f '$WEBCLI_DIR/static/ledger.js' ]"
run_test "index.html exists" "[ -f '$WEBCLI_DIR/static/index.html' ]"

echo ""

# =============================================================================
# Test 3: Scripts
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 3: Scripts${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "build.sh is executable" "[ -x '$SCRIPT_DIR/build.sh' ]"
run_test "install.sh is executable" "[ -x '$SCRIPT_DIR/install.sh' ]"
run_test "build-and-install.sh is executable" "[ -x '$SCRIPT_DIR/build-and-install.sh' ]"
run_test "cleanup.sh is executable" "[ -x '$SCRIPT_DIR/cleanup.sh' ]"
run_test "setup-udev.sh is executable" "[ -x '$SCRIPT_DIR/setup-udev.sh' ]"
run_test "start-wallet.sh is executable" "[ -x '$SCRIPT_DIR/start-wallet.sh' ]"

echo ""

# =============================================================================
# Test 4: Webcli Build
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 4: Webcli Binary${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "octra_wallet binary exists" "[ -f '$WEBCLI_DIR/octra_wallet' ]"
run_test "octra_wallet is executable" "[ -x '$WEBCLI_DIR/octra_wallet' ]"

echo ""

# =============================================================================
# Test 5: Docker Availability
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 5: Docker Availability${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "Docker is installed" "command -v docker"
run_test "Docker daemon is running" "docker ps"

echo ""

# =============================================================================
# Test 6: Python / ledgerblue
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 6: Python / ledgerblue${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "Python 3 is installed" "command -v python3"
run_test "ledgerblue is installed" "python3 -c 'import ledgerblue'"

echo ""

# =============================================================================
# Test 7: Ledger App Build (Nano S)
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 7: Ledger App Build (Nano S)${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

print_info "Building Ledger app for Nano S (this may take a few minutes)..."
if bash "$SCRIPT_DIR/build.sh" nanos > /tmp/build_test.log 2>&1; then
    print_status "Ledger app build succeeded"
    TESTS_PASSED=$((TESTS_PASSED + 1))
    
    # Check hex file
    HEX_FILE="$APP_DIR/build/nanos/bin/app.hex"
    if [ ! -f "$HEX_FILE" ]; then
        HEX_FILE="$APP_DIR/build/nanos/app.hex"
    fi
    
    if [ -f "$HEX_FILE" ]; then
        SIZE=$(stat -c%s "$HEX_FILE" 2>/dev/null || stat -f%z "$HEX_FILE")
        print_status "Hex file created: $HEX_FILE ($SIZE bytes)"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        
        if [ "$SIZE" -le 184320 ]; then
            print_status "Size within Nano S limit (180 KB)"
            TESTS_PASSED=$((TESTS_PASSED + 1))
        else
            print_error "Size exceeds Nano S limit!"
            TESTS_FAILED=$((TESTS_FAILED + 1))
        fi
    else
        print_error "Hex file not found"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
else
    print_error "Ledger app build failed"
    print_info "See /tmp/build_test.log for details"
    TESTS_FAILED=$((TESTS_FAILED + 1))
fi
TESTS_TOTAL=$((TESTS_TOTAL + 3))

echo ""

# =============================================================================
# Summary
# =============================================================================
echo -e "${BLUE}╔══════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║  Test Summary                                        ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  Total:  ${BLUE}$TESTS_TOTAL${NC}"
echo -e "  Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "  Failed: ${RED}$TESTS_FAILED${NC}"
echo ""

if [ "$TESTS_FAILED" -eq 0 ]; then
    echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  ALL TESTS PASSED!                                   ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Start wallet:  ./scripts/start-wallet.sh"
    echo "  2. Open browser:  http://127.0.0.1:8420"
    echo "  3. Connect Ledger: Click 'Connect Ledger'"
    echo ""
    exit 0
else
    echo -e "${RED}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║  SOME TESTS FAILED                                   ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    exit 1
fi
