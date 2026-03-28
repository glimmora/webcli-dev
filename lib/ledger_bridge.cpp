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

#include "ledger_bridge.hpp"
#include "crypto_utils.hpp"
#include <cstring>
#include <algorithm>
#include <optional>

#ifdef _WIN32
#include <windows.h>
#include <setupapi.h>
#include <hidclass.h>
#else
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#ifdef __linux__
#include <linux/hidraw.h>
#endif
#ifdef __APPLE__
#include <IOKit/hid/IOHIDManager.h>
#endif
#endif

// Use posix_close to avoid conflict with class method
#ifndef _WIN32
#define POSIX_CLOSE ::close
#endif

namespace octra {

// Ledger vendor ID
constexpr uint16_t LEDGER_VENDOR_ID = 0x2c97;

// APDU command codes
constexpr uint8_t CLA_OCTRA = 0xE0;
constexpr uint8_t INS_GET_VERSION = 0x00;
constexpr uint8_t INS_GET_PUBLIC_KEY = 0x01;
constexpr uint8_t INS_SIGN_TRANSACTION = 0x02;
constexpr uint8_t INS_SIGN_MESSAGE = 0x04;

// APDU response codes
constexpr uint16_t SW_OK = 0x9000;
constexpr uint16_t SW_CANCEL = 0x5501;
constexpr uint16_t SW_CONDITIONS = 0x6985;

// HID report size
constexpr size_t HID_REPORT_SIZE = 64;

LedgerBridge::LedgerBridge() 
    : m_initialized(false)
    , m_connected(false)
    , m_device_handle(nullptr)
    , m_fd(-1) {
}

LedgerBridge::~LedgerBridge() {
    close();
}

bool LedgerBridge::init() {
    if (m_initialized) {
        return true;
    }

    // Platform-specific initialization
#ifdef _WIN32
    // Windows HID initialization
    m_initialized = true;
#elif defined(__linux__)
    // Linux hidraw initialization
    m_initialized = true;
#elif defined(__APPLE__)
    // macOS IOKit initialization
    m_initialized = true;
#else
    m_initialized = false;
#endif

    return m_initialized;
}

void LedgerBridge::close() {
    if (m_connected) {
        disconnect();
    }
    m_initialized = false;
}

std::vector<LedgerDeviceInfo> LedgerBridge::scan_devices() {
    std::vector<LedgerDeviceInfo> devices;

#ifdef _WIN32
    // Windows device enumeration
    HDEVINFO device_info = SetupDiGetClassDeviceInventory(
        &GUID_DEVINTERFACE_HID,
        nullptr,
        DIGCF_PRESENT | DIGCF_DEVICEINTERFACE
    );

    if (device_info == INVALID_HANDLE_VALUE) {
        return devices;
    }

    SP_DEVICE_INTERFACE_DATA interface_data;
    interface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);

    for (DWORD i = 0; SetupDiEnumDeviceInterfaces(device_info, nullptr, 
            &GUID_DEVINTERFACE_HID, i, &interface_data); i++) {
        
        // Get device details
        DWORD required_size = 0;
        SetupDiGetDeviceInterfaceDetail(device_info, &interface_data, 
            nullptr, 0, &required_size, nullptr);

        if (required_size > 0) {
            // Check if it's a Ledger device
            // In production, would check vendor ID
            LedgerDeviceInfo info;
            info.device_id = "ledger_" + std::to_string(i);
            info.device_name = "Ledger Nano";
            info.is_connected = true;
            devices.push_back(info);
        }
    }

    SetupDiDestroyDeviceInfoList(device_info);

#elif defined(__linux__)
    // Linux hidraw enumeration
    for (int i = 0; i < 256; i++) {
        std::string path = "/dev/hidraw" + std::to_string(i);
        int fd = open(path.c_str(), O_RDWR);
        if (fd >= 0) {
            // Check if it's a Ledger
            struct hidraw_devinfo info;
            if (ioctl(fd, HIDIOCGRAWINFO, &info) >= 0) {
                if (info.vendor == LEDGER_VENDOR_ID) {
                    LedgerDeviceInfo dev;
                    dev.device_id = path;
                    dev.device_name = "Ledger Nano";
                    dev.is_connected = true;
                    devices.push_back(dev);
                }
            }
            POSIX_CLOSE(fd);
        }
    }
#endif

    return devices;
}

bool LedgerBridge::connect(const std::string& device_id) {
    if (!m_initialized) {
        if (!init()) {
            set_error("Bridge not initialized");
            return false;
        }
    }

#ifdef _WIN32
    // Windows connection
    m_device_handle = CreateFile(device_id.c_str(),
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_READ | FILE_SHARE_WRITE,
        nullptr,
        OPEN_EXISTING,
        0,
        nullptr
    );

    if (m_device_handle == INVALID_HANDLE_VALUE) {
        set_error("Failed to open device");
        return false;
    }

#elif defined(__linux__)
    int fd = open(device_id.c_str(), O_RDWR);
    if (fd < 0) {
        set_error("Failed to open device: " + std::string(strerror(errno)));
        return false;
    }
    m_device_handle = reinterpret_cast<void*>(static_cast<intptr_t>(fd));
    m_fd = fd;

#endif

    m_device_id = device_id;
    m_connected = true;
    return true;
}

void LedgerBridge::disconnect() {
    if (!m_connected) {
        return;
    }

#ifdef _WIN32
    if (m_device_handle && m_device_handle != INVALID_HANDLE_VALUE) {
        CloseHandle(m_device_handle);
    }
#elif defined(__linux__)
    if (m_device_handle) {
        POSIX_CLOSE(static_cast<int>(reinterpret_cast<intptr_t>(m_device_handle)));
    }
#endif

    m_device_handle = nullptr;
    m_connected = false;
    m_device_id.clear();
}

std::optional<std::string> LedgerBridge::get_app_version() {
    if (!m_connected) {
        set_error("Not connected");
        return std::nullopt;
    }

    auto response = send_apdu(CLA_OCTRA, INS_GET_VERSION, 0x00, 0x00, {});
    
    if (response.size() < 7) {
        set_error("Invalid response");
        return std::nullopt;
    }

    // Parse version: major.minor.patch
    std::string version = std::to_string(response[0]) + "." +
                         std::to_string(response[1]) + "." +
                         std::to_string(response[2]);

    return version;
}

std::optional<LedgerPublicKey> LedgerBridge::get_public_key(
    const std::vector<uint32_t>& derivation_path
) {
    if (!m_connected) {
        set_error("Not connected");
        return std::nullopt;
    }

    if (derivation_path.empty() || derivation_path.size() > 10) {
        set_error("Invalid derivation path");
        return std::nullopt;
    }

    // Build APDU data
    std::vector<uint8_t> data;
    data.push_back(static_cast<uint8_t>(derivation_path.size()));

    for (uint32_t component : derivation_path) {
        data.push_back((component >> 24) & 0xFF);
        data.push_back((component >> 16) & 0xFF);
        data.push_back((component >> 8) & 0xFF);
        data.push_back(component & 0xFF);
    }

    // Request display on device
    data.push_back(0x01);

    auto response = send_apdu(CLA_OCTRA, INS_GET_PUBLIC_KEY, 0x00, 0x00, data);

    if (response.size() < 35) {
        set_error("Invalid response");
        return std::nullopt;
    }

    LedgerPublicKey result;
    
    // Parse public key
    uint8_t pubkey_len = response[0];
    if (pubkey_len != 32) {
        set_error("Invalid public key length");
        return std::nullopt;
    }

    result.public_key.assign(response.begin() + 1, response.begin() + 33);

    // Parse address
    uint8_t addr_len = response[33];
    if (addr_len > 0 && response.size() >= 34 + addr_len) {
        result.address.assign(
            reinterpret_cast<char*>(&response[34]),
            addr_len
        );
    }

    return result;
}

std::optional<LedgerSignature> LedgerBridge::sign_transaction(
    const std::vector<uint8_t>& transaction_data
) {
    if (!m_connected) {
        set_error("Not connected");
        return std::nullopt;
    }

    if (transaction_data.empty()) {
        set_error("Empty transaction data");
        return std::nullopt;
    }

    auto response = send_apdu(CLA_OCTRA, INS_SIGN_TRANSACTION, 
                               0x00, 0x00, transaction_data);

    LedgerSignature result;

    // Check status word
    if (response.size() < 2) {
        result.success = false;
        result.error = "No response";
        return result;
    }

    uint16_t sw = (response[response.size() - 2] << 8) | response[response.size() - 1];

    if (sw == SW_OK) {
        result.success = true;
        // Signature is the response minus the status word
        result.signature.assign(response.begin(), response.end() - 2);
    } else if (sw == SW_CANCEL || sw == SW_CONDITIONS) {
        result.success = false;
        result.error = "User cancelled";
    } else {
        result.success = false;
        result.error = "Signing failed: 0x" + 
            (response.size() >= 2 ? 
             std::to_string((response[response.size()-2] << 8) | response[response.size()-1]) : 
             "unknown");
    }

    return result;
}

std::optional<LedgerSignature> LedgerBridge::sign_message(
    const std::string& message
) {
    if (!m_connected) {
        set_error("Not connected");
        return std::nullopt;
    }

    if (message.empty()) {
        set_error("Empty message");
        return std::nullopt;
    }

    std::vector<uint8_t> data(message.begin(), message.end());
    auto response = send_apdu(CLA_OCTRA, INS_SIGN_MESSAGE, 0x00, 0x00, data);

    LedgerSignature result;

    if (response.size() < 2) {
        result.success = false;
        result.error = "No response";
        return result;
    }

    uint16_t sw = (response[response.size() - 2] << 8) | response[response.size() - 1];

    if (sw == SW_OK) {
        result.success = true;
        result.signature.assign(response.begin(), response.end() - 2);
    } else {
        result.success = false;
        result.error = "Signing failed";
    }

    return result;
}

std::vector<uint8_t> LedgerBridge::send_apdu(
    uint8_t cla,
    uint8_t ins,
    uint8_t p1,
    uint8_t p2,
    const std::vector<uint8_t>& data,
    uint16_t le
) {
    std::vector<uint8_t> response;

#ifdef _WIN32
    // Windows HID communication
    if (!m_device_handle || m_device_handle == INVALID_HANDLE_VALUE) {
        return response;
    }

    // Build HID report
    std::vector<uint8_t> report(HID_REPORT_SIZE, 0);
    report[0] = 0x01;  // Report ID

    // APDU header
    size_t offset = 1;
    report[offset++] = cla;
    report[offset++] = ins;
    report[offset++] = p1;
    report[offset++] = p2;
    report[offset++] = static_cast<uint8_t>(data.size());

    // APDU data
    for (size_t i = 0; i < data.size() && offset < HID_REPORT_SIZE; i++) {
        report[offset++] = data[i];
    }

    // Send report
    DWORD written = 0;
    if (!WriteFile(m_device_handle, report.data(), report.size(), &written, nullptr)) {
        set_error("Failed to write");
        return response;
    }

    // Read response
    std::vector<uint8_t> read_report(HID_REPORT_SIZE, 0);
    DWORD read = 0;
    if (!ReadFile(m_device_handle, read_report.data(), read_report.size(), &read, nullptr)) {
        set_error("Failed to read");
        return response;
    }

    // Extract APDU response
    response.assign(read_report.begin() + 1, read_report.end());

#elif defined(__linux__)
    int fd = m_fd;
    if (fd < 0) {
        return response;
    }

    // Build HID report
    std::vector<uint8_t> report(HID_REPORT_SIZE, 0);
    report[0] = 0x01;  // Report ID

    size_t offset = 1;
    report[offset++] = cla;
    report[offset++] = ins;
    report[offset++] = p1;
    report[offset++] = p2;
    report[offset++] = static_cast<uint8_t>(data.size());

    for (size_t i = 0; i < data.size() && offset < HID_REPORT_SIZE; i++) {
        report[offset++] = data[i];
    }

    // Send
    if (write(fd, report.data(), report.size()) < 0) {
        set_error("Failed to write");
        return response;
    }

    // Read
    std::vector<uint8_t> read_report(HID_REPORT_SIZE, 0);
    if (read(fd, read_report.data(), read_report.size()) < 0) {
        set_error("Failed to read");
        return response;
    }

    response.assign(read_report.begin() + 1, read_report.end());
#endif

    return response;
}

bool LedgerBridge::parse_response(
    const std::vector<uint8_t>& response,
    std::vector<uint8_t>& data,
    uint16_t& sw
) {
    if (response.size() < 2) {
        return false;
    }

    sw = (response[response.size() - 2] << 8) | response[response.size() - 1];
    
    if (response.size() > 2) {
        data.assign(response.begin(), response.end() - 2);
    }

    return sw == SW_OK;
}

} // namespace octra
