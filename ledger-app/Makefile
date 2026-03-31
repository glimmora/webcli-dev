# =============================================================================
# Octra Wallet Ledger App - Makefile
# Production build for Nano S Plus, Nano X, and Stax
# Copyright 2025-2026 Octra Labs
# =============================================================================

# Application info
APPNAME    = "Octra"
APPVERSION = "1.0.0"

# Source files
SOURCE_FILES  = src/main.c

# Include paths
INCLUDES_PATH += $(CURDIR)/src
INCLUDES_PATH += $(CURDIR)/include

# Required SDK definitions
DEFINES += IO_HID_EP_LENGTH=64
DEFINES += USB_SEGMENT_SIZE=64

# Disable debug output (set DEBUG=1 to enable)
DEBUG = 0

# =============================================================================
# SDK Build System
# Uses Makefile.standard_app from the Ledger Secure SDK
# =============================================================================

include $(BOLOS_SDK)/Makefile.standard_app

# =============================================================================
# Build Targets
# =============================================================================

.PHONY: post_build build-all distclean

post_build:
	@echo ""
	@echo "=========================================="
	@echo "  Octra Wallet - Build Complete"
	@echo "  Target: $(TARGET_NAME)"
	@echo "  Output: $(TARGET_BUILD_DIR)/app.hex"
	@SIZE=$$(stat -c%s $(TARGET_BUILD_DIR)/app.hex 2>/dev/null || stat -f%z $(TARGET_BUILD_DIR)/app.hex); \
	echo "  Size:   $$SIZE bytes"; \
	if [ "$(TARGET_NAME)" = "TARGET_NANOS2" ]; then \
		MAX=184320; echo "  Limit:  180 KB (Nano S Plus)"; \
	elif [ "$(TARGET_NAME)" = "TARGET_NANOX" ]; then \
		MAX=409600; echo "  Limit:  400 KB (Nano X)"; \
	else \
		MAX=1572864; echo "  Limit:  1.5 MB (Stax)"; \
	fi; \
	if [ "$$SIZE" -gt "$$MAX" ]; then \
		echo "  ERROR: Size exceeds limit!"; \
		exit 1; \
	else \
		echo "  Status: OK"; \
	fi
	@echo ""

# Build for all supported targets
build-all:
	@echo "Building Octra app for all supported targets..."
	@for target in nanox nanos2; do \
		echo ""; \
		echo "=== Building for $$target ==="; \
		$(MAKE) clean && $(MAKE) TARGET=$$target API_LEVEL=25 && \
		mkdir -p dist/$$target && \
		cp bin/app.elf dist/$$target/app.elf && \
		cp bin/app.hex dist/$$target/app.hex && \
		cp bin/app.apdu dist/$$target/app.apdu && \
		cp bin/app.sha256 dist/$$target/app.sha256 && \
		cp debug/app.map dist/$$target/app.map && \
		echo "=== $$target build saved to dist/$$target/ ===" || \
		echo "=== $$target build FAILED ==="; \
	done
	@echo ""
	@echo "All builds complete. Outputs in dist/"

# Clean everything including dist
distclean: clean
	rm -rf dist/

# =============================================================================
# Load to Device
# =============================================================================

load: $(TARGET_BUILD_DIR)/app.hex
	python3 -m ledgerblue.loadApp $(APP_LOAD_PARAMS)

load-offline: $(TARGET_BUILD_DIR)/app.hex
	python3 -m ledgerblue.loadApp $(APP_LOAD_PARAMS) --offline

# Delete from device
delete:
	python3 -m ledgerblue.deleteApp $(COMMON_DELETE_PARAMS)

# =============================================================================
# Help
# =============================================================================

help:
	@echo ""
	@echo "Octra Wallet Ledger App - Build System"
	@echo "======================================="
	@echo ""
	@echo "Usage:"
	@echo "  make TARGET=nanox           - Build for Nano X"
	@echo "  make TARGET=nanos2          - Build for Nano S Plus"
	@echo "  make build-all              - Build for all targets"
	@echo "  make load                   - Load app to connected device"
	@echo "  make delete                 - Delete app from device"
	@echo "  make clean                  - Clean build artifacts"
	@echo "  make distclean              - Clean everything including dist/"
	@echo ""
	@echo "Environment:"
	@echo "  BOLOS_SDK     - Path to BOLOS SDK (required)"
	@echo "  TARGET        - Target device (nanox/nanos2/stax)"
	@echo "  API_LEVEL     - SDK API level (default: 0, recommended: 25)"
	@echo ""
	@echo "Example (Nano X):"
	@echo "  export BOLOS_SDK=/path/to/ledger-secure-sdk"
	@echo "  make TARGET=nanox API_LEVEL=25"
	@echo ""
	@echo "Size Limits:"
	@echo "  Nano S Plus:  180 KB (184,320 bytes)"
	@echo "  Nano X:       400 KB (409,600 bytes)"
	@echo "  Stax:         1.5 MB (1,572,864 bytes)"
	@echo ""

.PHONY: load delete help post_build build-all distclean
