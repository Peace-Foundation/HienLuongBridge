// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

library CoreLibs {
    struct FungibleTokenData {
        address contractAddress;
        bool needAdaptation;
        bool isRegistered;
        uint256 totalBridged;
    }

    struct NonFungibleTokenData {
        address contractAddress;
        bool needAdaptation;
        bool isRegistered;
        uint256 totalBridged;
    }

    struct BridgeData {
        address owner;
        uint256 bridgeId;
        string name;
        string description;
        uint256 createdAt;
        bool isActive;
        uint256 totalTransactions;
    }

    struct BridgeMessage {
        uint256 bridgeId;
        address tokenAddress;
        uint256 amount;
        uint256 tokenId;
        address from;
        address to;
        bool isFungible;
    }

    // Additional helper functions can be added here
    function validateBridgeData(BridgeData storage bridge) internal view returns (bool) {
        return bridge.isActive && bridge.owner != address(0);
    }

    function validateFungibleToken(FungibleTokenData storage token) internal view returns (bool) {
        return token.isRegistered && token.contractAddress != address(0);
    }

    function validateNonFungibleToken(NonFungibleTokenData storage token) internal view returns (bool) {
        return token.isRegistered && token.contractAddress != address(0);
    }
}
