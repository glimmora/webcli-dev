/*
    This file is part of Octra Wallet (webcli).

    Octra Wallet is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

    Octra Wallet is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Octra Wallet.  If not, see <http://www.gnu.org/licenses/>.

    This program is released under the GPL with the additional exemption
    that compiling, linking, and/or using OpenSSL is allowed.
    You are free to remove this exemption from derived works.

    Copyright 2025-2026 Octra Labs
*/

#pragma once

#include <string>
#include <vector>
#include <cstdint>
#include <optional>

namespace octra {

/**
 * Ledger Device Information
 */
struct LedgerDeviceInfo {
    std::string device_id;
    std::string device_name;
    bool is_connected;
    std::string app_name;
    std::string app_version;
};

/**
 * Ledger Public Key Result
 */
struct LedgerPublicKey {
    std::vector<uint8_t> public_key;
    std::string address;
    std::string chain_code;
};

/**
 * Ledger Signature Result
 */
struct LedgerSignature {
    std::vector<uint8_t> signature;
    bool success;
    std::string error;
};

/**
 * Ledger Bridge - Communicates with Ledger hardware wallet
 * 
 * This class provides a C++ interface for communicating with Ledger devices
 * via USB HID. It's used by the web server to enable Ledger support.
 */
class LedgerBridge {
public:
    LedgerBridge();
    ~LedgerBridge();

    /**
     * Initialize the bridge
     */
    bool init();

    /**
     * Close the bridge
     */
    void close();

    /**
     * Check if bridge is initialized
     */
    bool is_initialized() const { return m_initialized; }

    /**
     * Scan for connected Ledger devices
     */
    std::vector<LedgerDeviceInfo> scan_devices();

    /**
     * Connect to a Ledger device
     */
    bool connect(const std::string& device_id);

    /**
     * Disconnect from current device
     */
    void disconnect();

    /**
     * Check if connected
     */
    bool is_connected() const { return m_connected; }

    /**
     * Get app version from Ledger
     */
    std::optional<std::string> get_app_version();

    /**
     * Get public key and address for derivation path
     * Path format: m/44'/3156'/0'/0/0
     */
    std::optional<LedgerPublicKey> get_public_key(
        const std::vector<uint32_t>& derivation_path
    );

    /**
     * Sign transaction data
     */
    std::optional<LedgerSignature> sign_transaction(
        const std::vector<uint8_t>& transaction_data
    );

    /**
     * Sign arbitrary message
     */
    std::optional<LedgerSignature> sign_message(
        const std::string& message
    );

    /**
     * Get last error
     */
    std::string get_last_error() const { return m_last_error; }

private:
    bool m_initialized;
    bool m_connected;
    std::string m_device_id;
    std::string m_last_error;
    void* m_device_handle;
    int m_fd;

    /**
     * Send APDU command to device
     */
    std::vector<uint8_t> send_apdu(
        uint8_t cla,
        uint8_t ins,
        uint8_t p1,
        uint8_t p2,
        const std::vector<uint8_t>& data,
        uint16_t le = 256
    );

    /**
     * Parse APDU response
     */
    bool parse_response(
        const std::vector<uint8_t>& response,
        std::vector<uint8_t>& data,
        uint16_t& sw
    );

    /**
     * Set error message
     */
    void set_error(const std::string& error) { m_last_error = error; }
};

/**
 * Default derivation path for Octra: m/44'/3156'/0'/0/0
 */
inline std::vector<uint32_t> default_derivation_path() {
    return {
        0x8000002C,  // 44' - BIP44 purpose
        0x80000C54,  // 3156' - Octra coin type
        0x80000000,  // 0' - account
        0x00000000,  // 0 - external
        0x00000000   // 0 - index
    };
}

/**
 * Convert derivation path to string format
 */
inline std::string path_to_string(const std::vector<uint32_t>& path) {
    std::string result = "m";
    for (uint32_t component : path) {
        result += "/";
        if (component & 0x80000000) {
            result += std::to_string(component & 0x7FFFFFFF) + "'";
        } else {
            result += std::to_string(component);
        }
    }
    return result;
}

} // namespace octra
