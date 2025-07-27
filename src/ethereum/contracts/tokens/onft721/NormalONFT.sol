// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { ONFT721 } from "@layerzerolabs/onft-evm/contracts/onft721/ONFT721.sol";
/**
 * @title NormalONFT
 * @dev Implementation of Omnichain Non-Fungible Token that creates new token representations on destination chains
 */
contract NormalONFT is ONFT721 {
    /**
     * @dev Constructor for creating a new Omnichain Non-Fungible Token
     * @param _name The name of the token
     * @param _symbol The symbol of the token
     * @param _lzEndpoint The LayerZero endpoint address
     * @param _delegate The address of the delegate contract
     */
    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint,
        address _delegate
    ) ONFT721(_name, _symbol, _lzEndpoint, _delegate) {}
}
