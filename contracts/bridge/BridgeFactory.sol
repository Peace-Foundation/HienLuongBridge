// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { BridgeCore } from "./BridgeCore.sol";
import { NormalOFT } from "./oft/NormalOFT.sol";
import { AdapterOFT } from "./oft/AdapterOFT.sol";
import { NormalONFT } from "./onft721/NormalONFT.sol";
import { AdapterONFT } from "./onft721/AdapterONFT.sol";

/**
 * @title BridgeFactory
 * @dev Factory contract for deploying bridge-related contracts
 */
contract BridgeFactory {
    address public owner;
    address public immutable endpoint;
    address public bridgeCore;

    event BridgeCoreDeployed(address indexed bridgeCore);
    event NormalOFTDeployed(address indexed token, string name, string symbol);
    event AdapterOFTDeployed(address indexed token, address indexed originalToken);
    event NormalONFTDeployed(address indexed token, string name, string symbol);
    event AdapterONFTDeployed(address indexed token, address indexed originalToken);

    constructor(address _endpoint) {
        owner = msg.sender;
        endpoint = _endpoint;
    }

    /**
     * @dev Deploys a new BridgeCore contract
     * @return Address of the deployed BridgeCore
     */
    function deployBridgeCore() external returns (address) {
        require(msg.sender == owner, "BridgeFactory: caller is not the owner");
        require(bridgeCore == address(0), "BridgeFactory: BridgeCore already deployed");

        BridgeCore core = new BridgeCore(endpoint, owner);
        bridgeCore = address(core);

        emit BridgeCoreDeployed(bridgeCore);
        return bridgeCore;
    }

    /**
     * @dev Deploys a new NormalOFT contract
     * @param name Token name
     * @param symbol Token symbol
     * @param decimals Token decimals
     * @return Address of the deployed NormalOFT
     */
    function deployNormalOFT(string memory name, string memory symbol, uint8 decimals) external returns (address) {
        require(msg.sender == owner, "BridgeFactory: caller is not the owner");

        NormalOFT token = new NormalOFT(endpoint, name, symbol, decimals, owner);

        emit NormalOFTDeployed(address(token), name, symbol);
        return address(token);
    }

    /**
     * @dev Deploys a new AdapterOFT contract
     * @param originalToken Address of the original token to adapt
     * @return Address of the deployed AdapterOFT
     */
    function deployAdapterOFT(address originalToken) external returns (address) {
        require(msg.sender == owner, "BridgeFactory: caller is not the owner");

        AdapterOFT adapter = new AdapterOFT(originalToken, endpoint, owner);

        emit AdapterOFTDeployed(address(adapter), originalToken);
        return address(adapter);
    }

    /**
     * @dev Deploys a new NormalONFT contract
     * @param name Token name
     * @param symbol Token symbol
     * @return Address of the deployed NormalONFT
     */
    function deployNormalONFT(string memory name, string memory symbol) external returns (address) {
        require(msg.sender == owner, "BridgeFactory: caller is not the owner");

        NormalONFT token = new NormalONFT(name, symbol, endpoint, owner);

        emit NormalONFTDeployed(address(token), name, symbol);
        return address(token);
    }

    /**
     * @dev Deploys a new AdapterONFT contract
     * @param originalToken Address of the original token to adapt
     * @return Address of the deployed AdapterONFT
     */
    function deployAdapterONFT(address originalToken) external returns (address) {
        require(msg.sender == owner, "BridgeFactory: caller is not the owner");

        AdapterONFT adapter = new AdapterONFT(originalToken, endpoint, owner);

        emit AdapterONFTDeployed(address(adapter), originalToken);
        return address(adapter);
    }
}
