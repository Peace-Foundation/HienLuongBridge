// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { OFT } from "@layerzerolabs/oft-evm/contracts/OFT.sol";
import { IOFT } from "@layerzerolabs/oft-evm/contracts/interfaces/IOFT.sol";

/**
 * @title NormalOFT
 * @dev Implementation of Omnichain Fungible Token that creates new token representations on destination chains
 */
contract NormalOFT is OFT {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    /**
     * @dev Constructor for creating a new Omnichain Fungible Token
     * @param _endpointAddress The LayerZero endpoint address
     * @param tokenName The name of the token
     * @param tokenSymbol The symbol of the token
     * @param tokenDecimals The decimals of the token
     * @param _owner The owner of the contract
     */
    constructor(
        address _endpointAddress,
        string memory tokenName,
        string memory tokenSymbol,
        uint8 tokenDecimals,
        address _owner
    ) OFT(tokenName, tokenSymbol, tokenDecimals, _endpointAddress, _owner) {
        _name = tokenName;
        _symbol = tokenSymbol;
        _decimals = tokenDecimals;
    }
}
