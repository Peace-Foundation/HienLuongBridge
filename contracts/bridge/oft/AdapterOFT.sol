// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { ProxyOFT } from "@layerzerolabs/oft-evm/contracts/ProxyOFT.sol";

/**
 * @title AdapterOFT
 * @dev Implementation of Omnichain Fungible Token that adapts existing tokens for cross-chain transfers
 */
contract AdapterOFT is ProxyOFT {
    /**
     * @dev Constructor for creating an adapter for an existing token
     * @param _token The address of the existing token
     * @param _endpointAddress The LayerZero endpoint address
     * @param _owner The owner of the contract
     */
    constructor(address _token, address _endpointAddress, address _owner) ProxyOFT(_token, _endpointAddress, _owner) {}
}
