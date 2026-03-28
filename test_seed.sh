#!/bin/bash
# Seed Phrase Implementation Test Suite

pkill -f octra_wallet 2>/dev/null
sleep 1

cd /root/webcli
rm -rf data && mkdir -p data

echo "Starting webcli server..."
./octra_wallet 8420 > /tmp/webcli_test.log 2>&1 &
SERVER_PID=$!
sleep 3

# Check if server is running
if ! kill -0 $SERVER_PID 2>/dev/null; then
    echo "✗ FAIL: Server failed to start"
    cat /tmp/webcli_test.log
    exit 1
fi

echo ""
echo "=========================================="
echo "SEED PHRASE IMPLEMENTATION TEST SUITE"
echo "=========================================="
echo ""

PASS_COUNT=0
FAIL_COUNT=0

# Test 1: Create wallet with 12 words
echo "=== Test 1: Create wallet with 12 words ==="
RESP12=$(curl -s -X POST http://localhost:8420/api/wallet/create \
    -H "Content-Type: application/json" \
    -d '{"pin":"123456","word_count":12}')
echo "Response: $RESP12"
WC12=$(echo "$RESP12" | python3 -c "import sys,json; print(len(json.load(sys.stdin).get('mnemonic','').split()))" 2>/dev/null)
echo "Actual word count: $WC12"
if [ "$WC12" = "12" ]; then
    echo "✓ PASS"
    ((PASS_COUNT++))
else
    echo "✗ FAIL"
    ((FAIL_COUNT++))
fi
echo ""

# Lock wallet
curl -s -X POST http://localhost:8420/api/wallet/lock > /dev/null 2>&1
sleep 1

# Test 2: Create wallet with 15 words
echo "=== Test 2: Create wallet with 15 words ==="
RESP15=$(curl -s -X POST http://localhost:8420/api/wallet/create \
    -H "Content-Type: application/json" \
    -d '{"pin":"123456","word_count":15}')
echo "Response: $RESP15"
WC15=$(echo "$RESP15" | python3 -c "import sys,json; print(len(json.load(sys.stdin).get('mnemonic','').split()))" 2>/dev/null)
echo "Actual word count: $WC15"
if [ "$WC15" = "15" ]; then
    echo "✓ PASS"
    ((PASS_COUNT++))
else
    echo "✗ FAIL"
    ((FAIL_COUNT++))
fi
echo ""

# Lock wallet
curl -s -X POST http://localhost:8420/api/wallet/lock > /dev/null 2>&1
sleep 1

# Test 3: Create wallet with 24 words
echo "=== Test 3: Create wallet with 24 words ==="
RESP24=$(curl -s -X POST http://localhost:8420/api/wallet/create \
    -H "Content-Type: application/json" \
    -d '{"pin":"123456","word_count":24}')
echo "Response: $RESP24"
WC24=$(echo "$RESP24" | python3 -c "import sys,json; print(len(json.load(sys.stdin).get('mnemonic','').split()))" 2>/dev/null)
echo "Actual word count: $WC24"
if [ "$WC24" = "24" ]; then
    echo "✓ PASS"
    ((PASS_COUNT++))
else
    echo "✗ FAIL"
    ((FAIL_COUNT++))
fi
echo ""

# Test 4: Invalid word_count (should be rejected)
echo "=== Test 4: Invalid word_count=18 (should fail) ==="
RESP_INV=$(curl -s -X POST http://localhost:8420/api/wallet/create \
    -H "Content-Type: application/json" \
    -d '{"pin":"123456","word_count":18}')
echo "Response: $RESP_INV"
if echo "$RESP_INV" | grep -q "word_count must be"; then
    echo "✓ PASS - Correctly rejected"
    ((PASS_COUNT++))
else
    echo "✗ FAIL - Should have been rejected"
    ((FAIL_COUNT++))
fi
echo ""

# Test 5: Default word_count (should be 12)
echo "=== Test 5: Default word_count (no parameter) ==="
curl -s -X POST http://localhost:8420/api/wallet/lock > /dev/null 2>&1
sleep 1
RESP_DEF=$(curl -s -X POST http://localhost:8420/api/wallet/create \
    -H "Content-Type: application/json" \
    -d '{"pin":"123456"}')
echo "Response: $RESP_DEF"
WC_DEF=$(echo "$RESP_DEF" | python3 -c "import sys,json; print(len(json.load(sys.stdin).get('mnemonic','').split()))" 2>/dev/null)
echo "Actual word count: $WC_DEF"
if [ "$WC_DEF" = "12" ]; then
    echo "✓ PASS"
    ((PASS_COUNT++))
else
    echo "✗ FAIL"
    ((FAIL_COUNT++))
fi
echo ""

# Test 6: Import wallet with 12-word mnemonic
echo "=== Test 6: Import wallet with 12-word mnemonic ==="
curl -s -X POST http://localhost:8420/api/wallet/lock > /dev/null 2>&1
sleep 1
MNEMONIC_12="abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
RESP_IMP12=$(curl -s -X POST http://localhost:8420/api/wallet/import \
    -H "Content-Type: application/json" \
    -d "{\"pin\":\"123456\",\"mnemonic\":\"$MNEMONIC_12\"}")
echo "Response: $RESP_IMP12"
if echo "$RESP_IMP12" | grep -q "address"; then
    echo "✓ PASS - 12-word mnemonic imported"
    ((PASS_COUNT++))
else
    echo "✗ FAIL"
    ((FAIL_COUNT++))
fi
echo ""

# Test 7: Import wallet with 15-word mnemonic
echo "=== Test 7: Import wallet with 15-word mnemonic ==="
curl -s -X POST http://localhost:8420/api/wallet/lock > /dev/null 2>&1
sleep 1
MNEMONIC_15="abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon able"
RESP_IMP15=$(curl -s -X POST http://localhost:8420/api/wallet/import \
    -H "Content-Type: application/json" \
    -d "{\"pin\":\"123456\",\"mnemonic\":\"$MNEMONIC_15\"}")
echo "Response: $RESP_IMP15"
if echo "$RESP_IMP15" | grep -q "address"; then
    echo "✓ PASS - 15-word mnemonic imported"
    ((PASS_COUNT++))
else
    echo "✗ FAIL"
    ((FAIL_COUNT++))
fi
echo ""

# Test 8: Import wallet with 24-word mnemonic
echo "=== Test 8: Import wallet with 24-word mnemonic ==="
curl -s -X POST http://localhost:8420/api/wallet/lock > /dev/null 2>&1
sleep 1
MNEMONIC_24="abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art"
RESP_IMP24=$(curl -s -X POST http://localhost:8420/api/wallet/import \
    -H "Content-Type: application/json" \
    -d "{\"pin\":\"123456\",\"mnemonic\":\"$MNEMONIC_24\"}")
echo "Response: $RESP_IMP24"
if echo "$RESP_IMP24" | grep -q "address"; then
    echo "✓ PASS - 24-word mnemonic imported"
    ((PASS_COUNT++))
else
    echo "✗ FAIL"
    ((FAIL_COUNT++))
fi
echo ""

# Test 9: Import with invalid mnemonic (13 words - should fail)
echo "=== Test 9: Import with invalid mnemonic (13 words - should fail) ==="
curl -s -X POST http://localhost:8420/api/wallet/lock > /dev/null 2>&1
sleep 1
MNEMONIC_13="abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
RESP_IMP13=$(curl -s -X POST http://localhost:8420/api/wallet/import \
    -H "Content-Type: application/json" \
    -d "{\"pin\":\"123456\",\"mnemonic\":\"$MNEMONIC_13\"}")
echo "Response: $RESP_IMP13"
if echo "$RESP_IMP13" | grep -qi "invalid\|error"; then
    echo "✓ PASS - Correctly rejected invalid mnemonic"
    ((PASS_COUNT++))
else
    echo "✗ FAIL - Should have been rejected"
    ((FAIL_COUNT++))
fi
echo ""

# Cleanup
echo "=========================================="
echo "TEST SUMMARY"
echo "=========================================="
echo "Passed: $PASS_COUNT"
echo "Failed: $FAIL_COUNT"
echo ""

kill $SERVER_PID 2>/dev/null

if [ $FAIL_COUNT -eq 0 ]; then
    echo "✓ ALL TESTS PASSED!"
    exit 0
else
    echo "✗ SOME TESTS FAILED"
    exit 1
fi
