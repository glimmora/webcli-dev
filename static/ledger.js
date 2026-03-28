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

/**
 * Ledger Hardware Wallet Integration
 * Supports both WebUSB (Chrome/Edge) and WebHID (Firefox/Chrome)
 */

(function() {
    'use strict';

    // Ledger vendor ID
    const LEDGER_VENDOR_ID = 0x2c97;
    
    // Nano S/X product IDs
    const LEDGER_NANO_S_PRODUCT_ID = 0x0001;
    const LEDGER_NANO_X_PRODUCT_ID = 0x0004;
    const LEDGER_NANO_S_PLUS_PRODUCT_ID = 0x0005;
    
    // CLA for Octra app
    const CLA_OCTRA = 0xE0;
    
    // APDU commands
    const INS_GET_VERSION = 0x00;
    const INS_GET_PUBLIC_KEY = 0x01;
    const INS_SIGN_TRANSACTION = 0x02;
    const INS_DERIVE_ADDRESS = 0x03;
    const INS_SIGN_MESSAGE = 0x04;
    
    // APDU response codes
    const SW_OK = 0x9000;
    const SW_CANCEL = 0x5501;
    const SW_INVALID_P1P2 = 0x6A86;
    const SW_INVALID_DATA = 0x6A80;
    const SW_WRONG_LENGTH = 0x6700;
    const SW_CONDITIONS = 0x6985;
    const SW_INTERNAL = 0x6F00;
    
    // Ledger HID report size
    const HID_REPORT_SIZE = 64;
    const HID_HEADER_SIZE = 5;
    
    /**
     * Ledger Device Manager
     * Handles connection and communication with Ledger devices
     */
    window.LedgerDevice = class LedgerDevice {
        constructor() {
            this.device = null;
            this.interface = null;
            this.endpointIn = null;
            this.endpointOut = null;
            this.connected = false;
            this.transportType = null; // 'webusb' or 'webhid'
        }
        
        /**
         * Check if WebUSB is supported
         */
        static isWebUSBSupported() {
            return !!(navigator.usb && navigator.usb.requestDevice);
        }
        
        /**
         * Check if WebHID is supported
         */
        static isWebHIDSupported() {
            return !!(navigator.hid && navigator.hid.requestDevice);
        }
        
        /**
         * Get supported transport type
         */
        static getSupportedTransport() {
            if (this.isWebUSBSupported()) {
                return 'webusb';
            } else if (this.isWebHIDSupported()) {
                return 'webhid';
            }
            return null;
        }
        
        /**
         * Connect to Ledger device
         */
        async connect(transportType = null) {
            if (!transportType) {
                transportType = LedgerDevice.getSupportedTransport();
            }
            
            if (transportType === 'webusb') {
                return this._connectWebUSB();
            } else if (transportType === 'webhid') {
                return this._connectWebHID();
            } else {
                throw new Error('No supported transport available');
            }
        }
        
        /**
         * Connect via WebUSB
         */
        async _connectWebUSB() {
            try {
                this.device = await navigator.usb.requestDevice({
                    filters: [
                        { vendorId: LEDGER_VENDOR_ID, productId: LEDGER_NANO_S_PRODUCT_ID },
                        { vendorId: LEDGER_VENDOR_ID, productId: LEDGER_NANO_X_PRODUCT_ID },
                        { vendorId: LEDGER_VENDOR_ID, productId: LEDGER_NANO_S_PLUS_PRODUCT_ID }
                    ]
                });
                
                await this.device.open();
                await this.device.selectConfiguration(1);
                await this.device.claimInterface(0);
                
                // Find endpoints
                const interfaceInfo = this.device.configuration.interfaces[0];
                for (const altInterface of interfaceInfo.alternates) {
                    for (const endpoint of altInterface.endpoints) {
                        if (endpoint.direction === 'in') {
                            this.endpointIn = endpoint.endpointNumber;
                        } else if (endpoint.direction === 'out') {
                            this.endpointOut = endpoint.endpointNumber;
                        }
                    }
                }
                
                this.transportType = 'webusb';
                this.connected = true;
                
                return { success: true, transport: 'webusb' };
            } catch (error) {
                throw new Error('WebUSB connection failed: ' + error.message);
            }
        }
        
        /**
         * Connect via WebHID
         */
        async _connectWebHID() {
            try {
                const devices = await navigator.hid.requestDevice({
                    filters: [
                        { vendorId: LEDGER_VENDOR_ID, productId: LEDGER_NANO_S_PRODUCT_ID },
                        { vendorId: LEDGER_VENDOR_ID, productId: LEDGER_NANO_X_PRODUCT_ID },
                        { vendorId: LEDGER_VENDOR_ID, productId: LEDGER_NANO_S_PLUS_PRODUCT_ID }
                    ]
                });
                
                if (devices.length === 0) {
                    throw new Error('No device selected');
                }
                
                this.device = devices[0];
                await this.device.open();
                
                this.transportType = 'webhid';
                this.connected = true;
                
                // Listen for input reports
                this.device.addEventListener('inputreport', this._handleHIDInput.bind(this));
                
                return { success: true, transport: 'webhid' };
            } catch (error) {
                throw new Error('WebHID connection failed: ' + error.message);
            }
        }
        
        /**
         * Disconnect from device
         */
        async disconnect() {
            if (!this.connected) {
                return;
            }
            
            try {
                if (this.transportType === 'webusb' && this.device) {
                    await this.device.close();
                } else if (this.transportType === 'webhid' && this.device) {
                    await this.device.close();
                }
            } catch (error) {
                console.error('Disconnect error:', error);
            } finally {
                this.connected = false;
                this.device = null;
                this.transportType = null;
            }
        }
        
        /**
         * Send APDU command
         */
        async sendAPDU(cla, ins, p1, p2, data = new Uint8Array()) {
            if (!this.connected) {
                throw new Error('Device not connected');
            }
            
            // Build APDU command
            const apdu = new Uint8Array(5 + data.length);
            apdu[0] = cla;
            apdu[1] = ins;
            apdu[2] = p1;
            apdu[3] = p2;
            apdu[4] = data.length;
            apdu.set(data, 5);
            
            if (this.transportType === 'webhid') {
                return this._sendHID(apdu);
            } else {
                return this._sendUSB(apdu);
            }
        }
        
        /**
         * Send via WebHID
         */
        async _sendHID(apdu) {
            return new Promise((resolve, reject) => {
                const commandId = (apdu[1] << 8) | apdu[2];
                let offset = 0;
                let sequenceIndex = 0;
                
                const sendNext = async () => {
                    const report = new Uint8Array(HID_REPORT_SIZE);
                    report[0] = 0x01; // Report ID
                    
                    if (offset === 0) {
                        // First packet (header)
                        report[1] = (commandId >> 8) & 0xFF;
                        report[2] = commandId & 0xFF;
                        report[3] = (apdu.length >> 8) & 0xFF;
                        report[4] = apdu.length & 0xFF;
                        
                        const dataLen = Math.min(apdu.length, HID_REPORT_SIZE - HID_HEADER_SIZE);
                        report.set(apdu.subarray(0, dataLen), HID_HEADER_SIZE);
                        offset = dataLen;
                    } else {
                        // Continuation packet
                        report[1] = (sequenceIndex >> 8) & 0xFF;
                        report[2] = sequenceIndex & 0xFF;
                        
                        const dataLen = Math.min(apdu.length - offset, HID_REPORT_SIZE - 3);
                        report.set(apdu.subarray(offset, offset + dataLen), 3);
                        offset += dataLen;
                        sequenceIndex++;
                    }
                    
                    this.device.sendReport(0, report).then(() => {
                        if (offset < apdu.length) {
                            sendNext();
                        }
                    }).catch(reject);
                };
                
                sendNext();
                
                // Set timeout for response
                setTimeout(() => reject(new Error('APDU timeout')), 30000);
            });
        }
        
        /**
         * Send via WebUSB
         */
        async _sendUSB(apdu) {
            // Send command
            await this.device.transferOut(this.endpointOut, apdu);
            
            // Read response
            const result = await this.device.transferIn(this.endpointIn, 260);
            return new Uint8Array(result.data.buffer);
        }
        
        /**
         * Handle HID input report
         */
        _handleHIDInput(event) {
            // Process incoming data
            const data = new Uint8Array(event.data.buffer);
            // Implementation for receiving responses
        }
        
        /**
         * Get app version
         */
        async getVersion() {
            const response = await this.sendAPDU(CLA_OCTRA, INS_GET_VERSION, 0x00, 0x00);
            return {
                major: response[0],
                minor: response[1],
                patch: response[2],
                deviceType: response[3]
            };
        }
        
        /**
         * Get public key and address
         */
        async getPublicKey(path) {
            // Build path data
            const pathData = new Uint8Array(1 + path.length * 4 + 1);
            pathData[0] = path.length;
            
            for (let i = 0; i < path.length; i++) {
                const offset = 1 + i * 4;
                pathData[offset] = (path[i] >> 24) & 0xFF;
                pathData[offset + 1] = (path[i] >> 16) & 0xFF;
                pathData[offset + 2] = (path[i] >> 8) & 0xFF;
                pathData[offset + 3] = path[i] & 0xFF;
            }
            
            pathData[pathData.length - 1] = 0x01; // Display on device
            
            const response = await this.sendAPDU(CLA_OCTRA, INS_GET_PUBLIC_KEY, 0x00, 0x00, pathData);
            
            // Parse response
            const pubkeyLen = response[0];
            const publicKey = response.subarray(1, 1 + pubkeyLen);
            const addrLen = response[1 + pubkeyLen];
            const address = new TextDecoder().decode(response.subarray(2 + pubkeyLen, 2 + pubkeyLen + addrLen));
            
            return {
                publicKey: publicKey,
                address: address
            };
        }
        
        /**
         * Sign transaction
         */
        async signTransaction(tx) {
            // Build transaction data
            const data = this._buildTransactionData(tx);
            const response = await this.sendAPDU(CLA_OCTRA, INS_SIGN_TRANSACTION, 0x00, 0x00, data);
            
            // Check status word
            const sw = (response[response.length - 2] << 8) | response[response.length - 1];
            if (sw !== SW_OK) {
                throw new Error('Transaction signing failed: 0x' + sw.toString(16));
            }
            
            // Return signature (64 bytes)
            return response.subarray(0, 64);
        }
        
        /**
         * Build transaction data for APDU
         */
        _buildTransactionData(tx) {
            // Calculate size
            const msgLen = tx.message ? tx.message.length : 0;
            const dataSize = 1 + 47 + 47 + 8 + 4 + 4 + 8 + (msgLen > 0 ? 1 + msgLen : 0);
            
            const data = new Uint8Array(dataSize);
            let offset = 0;
            
            // Transaction type
            data[offset++] = tx.type || 0x00;
            
            // From address (47 bytes)
            const fromBytes = new TextEncoder().encode(tx.from);
            data.set(fromBytes.slice(0, 47), offset);
            offset += 47;
            
            // To address (47 bytes)
            const toBytes = new TextEncoder().encode(tx.to);
            data.set(toBytes.slice(0, 47), offset);
            offset += 47;
            
            // Amount (uint64, big-endian)
            this._writeUint64BE(data, offset, tx.amount);
            offset += 8;
            
            // Nonce (uint32, big-endian)
            this._writeUint32BE(data, offset, tx.nonce);
            offset += 4;
            
            // OU/Fee (uint32, big-endian)
            this._writeUint32BE(data, offset, tx.ou);
            offset += 4;
            
            // Timestamp (uint64, big-endian)
            this._writeUint64BE(data, offset, tx.timestamp);
            offset += 8;
            
            // Optional message
            if (msgLen > 0) {
                data[offset++] = msgLen;
                const msgBytes = new TextEncoder().encode(tx.message);
                data.set(msgBytes, offset);
            }
            
            return data;
        }
        
        /**
         * Write uint32 big-endian
         */
        _writeUint32BE(buffer, offset, value) {
            buffer[offset] = (value >> 24) & 0xFF;
            buffer[offset + 1] = (value >> 16) & 0xFF;
            buffer[offset + 2] = (value >> 8) & 0xFF;
            buffer[offset + 3] = value & 0xFF;
        }
        
        /**
         * Write uint64 big-endian
         */
        _writeUint64BE(buffer, offset, value) {
            // For JavaScript numbers, we can only safely represent up to 2^53
            // For full uint64 support, we'd need BigInt
            const high = Math.floor(value / 0x100000000);
            const low = value % 0x100000000;
            
            this._writeUint32BE(buffer, offset, high);
            this._writeUint32BE(buffer, offset + 4, low);
        }
        
        /**
         * Sign message
         */
        async signMessage(message) {
            const data = new TextEncoder().encode(message);
            const response = await this.sendAPDU(CLA_OCTRA, INS_SIGN_MESSAGE, 0x00, 0x00, data);
            
            // Check status word
            const sw = (response[response.length - 2] << 8) | response[response.length - 1];
            if (sw !== SW_OK) {
                throw new Error('Message signing failed: 0x' + sw.toString(16));
            }
            
            return response.subarray(0, 64);
        }
    };
    
    /**
     * Ledger Wallet Manager
     * High-level interface for using Ledger with Octra wallet
     */
    window.LedgerWallet = class LedgerWallet {
        constructor() {
            this.device = new window.LedgerDevice();
            this.address = null;
            this.publicKey = null;
            this.derivationPath = [0x8000002C, 0x80000C54, 0x80000000, 0, 0]; // m/44'/3156'/0'/0/0
        }
        
        /**
         * Check if Ledger is supported
         */
        static isSupported() {
            return LedgerDevice.getSupportedTransport() !== null;
        }
        
        /**
         * Get supported transport type
         */
        static getTransportType() {
            return LedgerDevice.getSupportedTransport();
        }
        
        /**
         * Connect to Ledger and get address
         */
        async connect(customPath = null) {
            if (customPath) {
                this.derivationPath = customPath;
            }
            
            await this.device.connect();
            
            const result = await this.device.getPublicKey(this.derivationPath);
            this.address = result.address;
            this.publicKey = result.publicKey;
            
            return {
                address: this.address,
                publicKey: this.publicKey
            };
        }
        
        /**
         * Disconnect from Ledger
         */
        async disconnect() {
            await this.device.disconnect();
            this.address = null;
            this.publicKey = null;
        }
        
        /**
         * Sign a transaction
         */
        async signTransaction(tx) {
            if (!this.address) {
                throw new Error('Ledger not connected');
            }
            
            // Set from address
            tx.from = this.address;
            
            return await this.device.signTransaction(tx);
        }
        
        /**
         * Sign a message
         */
        async signMessage(message) {
            if (!this.address) {
                throw new Error('Ledger not connected');
            }
            
            return await this.device.signMessage(message);
        }
        
        /**
         * Get current address
         */
        getAddress() {
            return this.address;
        }
    };
    
})();
