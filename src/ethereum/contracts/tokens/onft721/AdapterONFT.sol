// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { ONFT721Adapter } from "@layerzerolabs/onft-evm/contracts/onft721/ONFT721Adapter.sol";

/**
 * @title AdapterONFT
 * @dev Implementation of Omnichain NFT adapter for existing NFT collections
 */
contract AdapterONFT is ONFT721Adapter {
    /**
     * @dev Constructor for creating an adapter for an existing NFT collection
     * @param _token The address of the existing NFT contract
     * @param _lzEndpoint The LayerZero endpoint address
     * @param _delegate The address of the delegate contract
     */
    constructor(
        address _token,
        address _lzEndpoint,
        address _delegate
    ) ONFT721Adapter(_token, _lzEndpoint, _delegate) {}
}
