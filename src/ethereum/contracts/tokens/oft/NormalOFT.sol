// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { OFT } from "@layerzerolabs/oft-evm/contracts/OFT.sol";

/**
 * @title NormalOFT
 * @dev Implementation of Omnichain Fungible Token that creates new token representations
 */
contract NormalOFT is OFT {
    /**
     * @dev Constructor for creating a new Omnichain Fungible Token
     * @param _name The name of the token
     * @param _symbol The symbol of the token
     * @param _lzEndpoint The LayerZero endpoint address
     * @param _owner The owner of the contract
     */
    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint,
        address _owner
    ) OFT(_name, _symbol, _lzEndpoint, _owner) Ownable(_owner) {}
}
