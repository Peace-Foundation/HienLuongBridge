// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { CoreLibs } from "../libraries/CoreLibs.sol";

interface IBridgeCore {
    // Events
    event BridgeCreated(uint256 indexed bridgeId, string name, address owner);
    event FungibleTokenRegistered(address indexed tokenAddress, bool needAdaptation);
    event NonFungibleTokenRegistered(address indexed tokenAddress, bool needAdaptation);
    event BridgeFungibleTokens(
        uint256 indexed bridgeId,
        address indexed tokenAddress,
        uint256 amount,
        address from,
        address to,
        uint32 dstEid
    );
    event BridgeNonFungibleToken(
        uint256 indexed bridgeId,
        address indexed tokenAddress,
        uint256 tokenId,
        address from,
        address to,
        uint32 dstEid
    );

    // Bridge management functions
    function createBridge(string memory name, string memory description) external returns (uint256 bridgeId);
    function registerFungibleToken(address tokenAddress, bool needAdaptation) external;
    function registerNonFungibleToken(address tokenAddress, bool needAdaptation) external;

    // Bridging functions
    function bridgeFungibleTokens(
        uint256 bridgeId,
        address tokenAddress,
        uint256 amount,
        address to,
        uint32 dstEid,
        bytes calldata options
    ) external payable returns (uint64 nonce);

    function bridgeNonFungibleToken(
        uint256 bridgeId,
        address tokenAddress,
        uint256 tokenId,
        address to,
        uint32 dstEid,
        bytes calldata options
    ) external payable returns (uint64 nonce);

    // View functions
    function getBridgeData(uint256 bridgeId) external view returns (CoreLibs.BridgeData memory);
    function getFungibleTokenData(address tokenAddress) external view returns (CoreLibs.FungibleTokenData memory);
    function getNonFungibleTokenData(address tokenAddress) external view returns (CoreLibs.NonFungibleTokenData memory);
}
