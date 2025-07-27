// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { OFTAdapter } from "@layerzerolabs/oft-evm/contracts/OFTAdapter.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
/**
 * @title AdapterOFT
 * @dev Implementation of Omnichain Fungible Token that adapts existing tokens for cross-chain transfers
 */
contract AdapterOFT is OFTAdapter {
    /**
     * @dev Constructor for creating an adapter for an existing token
     * @param _token The address of the existing token
     * @param _lzEndpoint The LayerZero endpoint address
     * @param _owner The owner of the contract
     */
    constructor(
        address _token,
        address _lzEndpoint,
        address _owner
    ) OFTAdapter(_token, _lzEndpoint, _owner) Ownable(_owner) {}
}
