#!/bin/bash
# =============================================================================
# Octra Wallet - Linux UDEV Rules Setup & Auto Dependency Installer
# Enables USB access to Ledger devices without root
# Auto-installs Docker, Python, ledgerblue, and all build dependencies
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
echo -e "${BLUE}  Octra Wallet - Setup & UDEV Rules   ${NC}"
echo -e "${BLUE}  Auto-Install Dependencies (Linux)   ${NC}"
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

# Detect package manager
detect_package_manager() {
    if command -v apt-get &> /dev/null; then
        echo "apt"
    elif command -v dnf &> /dev/null; then
        echo "dnf"
    elif command -v yum &> /dev/null; then
        echo "yum"
    elif command -v pacman &> /dev/null; then
        echo "pacman"
    elif command -v zypper &> /dev/null; then
        echo "zypper"
    else
        echo "unknown"
    fi
}

# Install package using detected package manager
install_package() {
    local pkg="$1"
    local pkg_mgr=$(detect_package_manager)

    case "$pkg_mgr" in
        apt)
            apt-get install -y "$pkg"
            ;;
        dnf)
            dnf install -y "$pkg"
            ;;
        yum)
            yum install -y "$pkg"
            ;;
        pacman)
            pacman -S --noconfirm "$pkg"
            ;;
        zypper)
            zypper install -y "$pkg"
            ;;
        *)
            print_error "Unknown package manager. Please install $pkg manually."
            return 1
            ;;
    esac
}

# =============================================================================
# STEP 1: Install Build Dependencies
# =============================================================================

install_build_dependencies() {
    print_info "Installing build dependencies..."

    local pkg_mgr=$(detect_package_manager)
    print_info "Detected package manager: $pkg_mgr"

    # Update package lists
    print_info "Updating package lists..."
    case "$pkg_mgr" in
        apt) apt-get update -y ;;
        dnf) dnf update -y ;;
        yum) yum update -y ;;
        pacman) pacman -Sy --noconfirm ;;
        zypper) zypper refresh ;;
    esac

    # Install Docker if not present
    if ! command -v docker &> /dev/null; then
        print_info "Installing Docker..."
        case "$pkg_mgr" in
            apt)
                apt-get install -y ca-certificates curl gnupg
                install -m 0755 -d /etc/apt/keyrings
                curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                chmod a+r /etc/apt/keyrings/docker.gpg
                echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
                apt-get update
                apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
                ;;
            dnf)
                dnf -y install dnf-plugins-core
                dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
                dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
                ;;
            yum)
                yum install -y yum-utils
                yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
                yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
                ;;
            pacman)
                pacman -S --noconfirm docker docker-compose
                ;;
            zypper)
                zypper install -y docker docker-compose
                ;;
            *)
                print_warning "Please install Docker manually from https://docs.docker.com/engine/install/"
                ;;
        esac

        # Start and enable Docker service
        if systemctl is-active --quiet docker; then
            print_status "Docker service is running"
        else
            systemctl start docker
            systemctl enable docker
            print_status "Docker service started and enabled"
        fi
    else
        print_status "Docker is already installed"
    fi

    # Ensure Docker is running
    if ! systemctl is-active --quiet docker; then
        print_info "Starting Docker service..."
        systemctl start docker
        systemctl enable docker
        print_status "Docker service started"
    fi

    # Install Python 3 and pip if not present
    if ! command -v python3 &> /dev/null; then
        print_info "Installing Python 3..."
        case "$pkg_mgr" in
            apt)
                apt-get install -y python3 python3-pip python3-venv
                ;;
            dnf)
                dnf install -y python3 python3-pip
                ;;
            yum)
                yum install -y python3 python3-pip
                ;;
            pacman)
                pacman -S --noconfirm python python-pip
                ;;
            zypper)
                zypper install -y python3 python3-pip
                ;;
        esac
    else
        print_status "Python 3 is already installed"
    fi

    # Install ledgerblue Python package (compatible version)
    if ! python3 -c "import ledgerblue" &> /dev/null 2>&1; then
        print_info "Installing ledgerblue..."
        # Install latest available version
        pip3 install --break-system-packages ledgerblue || pip3 install ledgerblue
    else
        LEDGERBLUE_VERSION=$(pip3 show ledgerblue 2>/dev/null | grep Version | cut -d' ' -f2)
        print_info "ledgerblue version: $LEDGERBLUE_VERSION"
    fi
    print_status "ledgerblue installed"

    # Install additional build tools
    print_info "Installing additional build tools..."
    case "$pkg_mgr" in
        apt)
            apt-get install -y build-essential git curl wget udev
            ;;
        dnf)
            dnf install -y gcc gcc-c++ make git curl wget systemd-udev
            ;;
        yum)
            yum install -y gcc gcc-c++ make git curl wget systemd-udev
            ;;
        pacman)
            pacman -S --noconfirm base-devel git curl wget systemd
            ;;
        zypper)
            zypper install -y gcc gcc-c++ make git curl wget systemd-udev
            ;;
    esac

    print_status "Build dependencies installed"
}

# =============================================================================
# STEP 2: Install UDEV Rules
# =============================================================================

install_udev_rules() {
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
}

# =============================================================================
# STEP 3: Configure User Groups
# =============================================================================

configure_user_groups() {
    # Check if plugdev group exists
    if ! getent group plugdev > /dev/null 2>&1; then
        print_info "Creating plugdev group..."
        groupadd plugdev
        print_status "plugdev group created"
    fi

    # Add current user to plugdev group
    CURRENT_USER=$(logname 2>/dev/null || echo ${SUDO_USER:-$USER})
    print_info "Adding user '$CURRENT_USER' to plugdev group..."

    if usermod -aG plugdev "$CURRENT_USER"; then
        print_status "User added to plugdev group"
    else
        print_warning "Could not add user to plugdev group"
    fi

    # Add current user to docker group
    print_info "Adding user '$CURRENT_USER' to docker group..."
    if usermod -aG docker "$CURRENT_USER"; then
        print_status "User added to docker group"
    else
        print_warning "Could not add user to docker group"
    fi
}

# =============================================================================
# STEP 4: Verify Installation
# =============================================================================

verify_installation() {
    echo ""
    print_info "Verifying installation..."
    echo ""

    # Check Docker
    if command -v docker &> /dev/null; then
        print_status "Docker is installed"
    else
        print_error "Docker installation failed"
    fi

    # Check Python
    if command -v python3 &> /dev/null; then
        print_status "Python 3 is installed"
    else
        print_error "Python installation failed"
    fi

    # Check ledgerblue
    if python3 -c "import ledgerblue" &> /dev/null 2>&1; then
        print_status "ledgerblue is installed"
    else
        print_warning "ledgerblue not found (will be installed on first build)"
    fi

    # Check UDEV rules
    if [ -f "$UDEV_RULES" ]; then
        print_status "UDEV rules are configured"
    else
        print_error "UDEV rules not found"
    fi

    # Check groups
    CURRENT_USER=$(logname 2>/dev/null || echo ${SUDO_USER:-$USER})
    if id -nG "$CURRENT_USER" | grep -qw "docker"; then
        print_status "User is in docker group"
    else
        print_warning "User not in docker group yet (requires re-login)"
    fi

    if id -nG "$CURRENT_USER" | grep -qw "plugdev"; then
        print_status "User is in plugdev group"
    else
        print_warning "User not in plugdev group yet (requires re-login)"
    fi
}

# =============================================================================
# Main Execution
# =============================================================================

main() {
    install_build_dependencies
    install_udev_rules
    configure_user_groups
    verify_installation

    echo ""
    print_status "Setup complete!"
    echo ""
    print_info "IMPORTANT: You must LOG OUT and LOG BACK IN for group changes to take effect"
    echo ""
    echo "Alternatively, run:"
    echo "  newgrp plugdev"
    echo "  newgrp docker"
    echo ""
    print_info "After logging in, verify with:"
    echo "  lsusb | grep Ledger"
    echo "  docker ps"
    echo ""
    print_info "To build the Ledger app for Nano X:"
    echo "  ./scripts/build.sh nanox"
    echo ""
    print_info "To install the app to your Ledger:"
    echo "  ./scripts/install.sh nanox"
    echo ""
    print_info "Or build and install in one step:"
    echo "  ./scripts/build-and-install.sh nanox"
    echo ""
}

main
