// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { IBridgeCore } from "./interfaces/IBridgeCore.sol";
import { CoreLibs } from "./libraries/CoreLibs.sol";
import { NormalOFT } from "./oft/NormalOFT.sol";
import { AdapterOFT } from "./oft/AdapterOFT.sol";
import { NormalONFT } from "./onft721/NormalONFT.sol";
import { AdapterONFT } from "./onft721/AdapterONFT.sol";

import { OApp } from "@layerzerolabs/oapp-evm/contracts/OApp.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract BridgeCore is OApp, Ownable, IBridgeCore {
    using CoreLibs for CoreLibs.FungibleTokenData;
    using CoreLibs for CoreLibs.NonFungibleTokenData;
    using CoreLibs for CoreLibs.BridgeData;

    // Storage for registered tokens and bridges
    mapping(address => CoreLibs.FungibleTokenData) public fungibleTokens;
    mapping(address => CoreLibs.NonFungibleTokenData) public nonFungibleTokens;
    mapping(uint256 => CoreLibs.BridgeData) public bridges;

    // Counter for bridge IDs
    uint256 private _nextBridgeId = 1;

    // Events
    event FungibleTokensLocked(address indexed tokenAddress, address indexed from, uint256 amount);
    event FungibleTokensUnlocked(address indexed tokenAddress, address indexed to, uint256 amount);
    event NonFungibleTokenLocked(address indexed tokenAddress, address indexed from, uint256 tokenId);
    event NonFungibleTokenUnlocked(address indexed tokenAddress, address indexed to, uint256 tokenId);

    /**
     * @dev Constructor initializes the BridgeCore with LayerZero endpoint
     * @param _endpoint The LayerZero endpoint address
     * @param _owner The owner of the contract
     */
    constructor(address _endpoint, address _owner) OApp(_endpoint, _owner) Ownable(_owner) {}

    /**
     * @dev Creates a new bridge
     * @param name The name of the bridge
     * @param description The description of the bridge
     * @return bridgeId The ID of the newly created bridge
     */
    function createBridge(string memory name, string memory description) external override returns (uint256 bridgeId) {
        bridgeId = _nextBridgeId++;

        bridges[bridgeId] = CoreLibs.BridgeData({
            owner: msg.sender,
            bridgeId: bridgeId,
            name: name,
            description: description,
            createdAt: block.timestamp,
            isActive: true,
            totalTransactions: 0
        });

        emit BridgeCreated(bridgeId, name, msg.sender);
    }

    /**
     * @dev Registers a fungible token for bridging
     * @param tokenAddress The address of the token
     * @param needAdaptation Whether the token requires adaptation (using AdapterOFT)
     */
    function registerFungibleToken(address tokenAddress, bool needAdaptation) external override onlyOwner {
        require(tokenAddress != address(0), "BridgeCore: invalid token address");
        require(!fungibleTokens[tokenAddress].isRegistered, "BridgeCore: token already registered");

        fungibleTokens[tokenAddress] = CoreLibs.FungibleTokenData({
            contractAddress: tokenAddress,
            needAdaptation: needAdaptation,
            isRegistered: true,
            totalBridged: 0
        });

        emit FungibleTokenRegistered(tokenAddress, needAdaptation);
    }

    /**
     * @dev Registers a non-fungible token for bridging
     * @param tokenAddress The address of the token
     * @param needAdaptation Whether the token requires adaptation (using AdapterONFT)
     */
    function registerNonFungibleToken(address tokenAddress, bool needAdaptation) external override onlyOwner {
        require(tokenAddress != address(0), "BridgeCore: invalid token address");
        require(!nonFungibleTokens[tokenAddress].isRegistered, "BridgeCore: token already registered");

        nonFungibleTokens[tokenAddress] = CoreLibs.NonFungibleTokenData({
            contractAddress: tokenAddress,
            needAdaptation: needAdaptation,
            isRegistered: true,
            totalBridged: 0
        });

        emit NonFungibleTokenRegistered(tokenAddress, needAdaptation);
    }

    /**
     * @dev Bridges fungible tokens to another chain
     * @param bridgeId The ID of the bridge to use
     * @param tokenAddress The address of the token to bridge
     * @param amount The amount of tokens to bridge
     * @param to The recipient address on the destination chain
     * @param dstEid The destination endpoint ID
     * @param options Additional options for the cross-chain message
     * @return nonce The nonce of the cross-chain message
     */
    function bridgeFungibleTokens(
        uint256 bridgeId,
        address tokenAddress,
        uint256 amount,
        address to,
        uint32 dstEid,
        bytes calldata options
    ) external payable override returns (uint64 nonce) {
        // Validate bridge and token
        require(CoreLibs.validateBridgeData(bridges[bridgeId]), "BridgeCore: invalid bridge");
        require(CoreLibs.validateFungibleToken(fungibleTokens[tokenAddress]), "BridgeCore: token not registered");

        // Lock tokens in this contract
        IERC20(tokenAddress).transferFrom(msg.sender, address(this), amount);
        emit FungibleTokensLocked(tokenAddress, msg.sender, amount);

        // Prepare message payload
        CoreLibs.BridgeMessage memory message = CoreLibs.BridgeMessage({
            bridgeId: bridgeId,
            tokenAddress: tokenAddress,
            amount: amount,
            tokenId: 0, // Not used for fungible tokens
            from: msg.sender,
            to: to,
            isFungible: true
        });

        bytes memory payload = abi.encode(message);

        // Send message to destination chain
        _lzSend(dstEid, payload, options, msg.value, payable(msg.sender));

        // Update stats
        bridges[bridgeId].totalTransactions++;
        fungibleTokens[tokenAddress].totalBridged += amount;

        emit BridgeFungibleTokens(bridgeId, tokenAddress, amount, msg.sender, to, dstEid);

        // Return the nonce (implementation specific to your LayerZero integration)
        return 0; // Replace with actual nonce from the LayerZero transaction
    }

    /**
     * @dev Bridges a non-fungible token to another chain
     * @param bridgeId The ID of the bridge to use
     * @param tokenAddress The address of the token to bridge
     * @param tokenId The ID of the token to bridge
     * @param to The recipient address on the destination chain
     * @param dstEid The destination endpoint ID
     * @param options Additional options for the cross-chain message
     * @return nonce The nonce of the cross-chain message
     */
    function bridgeNonFungibleToken(
        uint256 bridgeId,
        address tokenAddress,
        uint256 tokenId,
        address to,
        uint32 dstEid,
        bytes calldata options
    ) external payable override returns (uint64 nonce) {
        // Validate bridge and token
        require(CoreLibs.validateBridgeData(bridges[bridgeId]), "BridgeCore: invalid bridge");
        require(CoreLibs.validateNonFungibleToken(nonFungibleTokens[tokenAddress]), "BridgeCore: token not registered");

        // Lock the NFT in this contract
        IERC721(tokenAddress).transferFrom(msg.sender, address(this), tokenId);
        emit NonFungibleTokenLocked(tokenAddress, msg.sender, tokenId);

        // Prepare message payload
        CoreLibs.BridgeMessage memory message = CoreLibs.BridgeMessage({
            bridgeId: bridgeId,
            tokenAddress: tokenAddress,
            amount: 0, // Not used for non-fungible tokens
            tokenId: tokenId,
            from: msg.sender,
            to: to,
            isFungible: false
        });

        bytes memory payload = abi.encode(message);

        // Send message to destination chain
        _lzSend(dstEid, payload, options, msg.value, payable(msg.sender));

        // Update stats
        bridges[bridgeId].totalTransactions++;
        nonFungibleTokens[tokenAddress].totalBridged++;

        emit BridgeNonFungibleToken(bridgeId, tokenAddress, tokenId, msg.sender, to, dstEid);

        // Return the nonce (implementation specific to your LayerZero integration)
        return 0; // Replace with actual nonce from the LayerZero transaction
    }

    /**
     * @dev Gets the data for a bridge
     * @param bridgeId The ID of the bridge
     * @return The bridge data
     */
    function getBridgeData(uint256 bridgeId) external view override returns (CoreLibs.BridgeData memory) {
        return bridges[bridgeId];
    }

    /**
     * @dev Gets the data for a fungible token
     * @param tokenAddress The address of the token
     * @return The fungible token data
     */
    function getFungibleTokenData(
        address tokenAddress
    ) external view override returns (CoreLibs.FungibleTokenData memory) {
        return fungibleTokens[tokenAddress];
    }

    /**
     * @dev Gets the data for a non-fungible token
     * @param tokenAddress The address of the token
     * @return The non-fungible token data
     */
    function getNonFungibleTokenData(
        address tokenAddress
    ) external view override returns (CoreLibs.NonFungibleTokenData memory) {
        return nonFungibleTokens[tokenAddress];
    }

    /**
     * @dev Function to handle incoming messages from LayerZero
     * @param _srcEid The source endpoint ID
     * @param _srcAddress The source sender address
     * @param _payload The message payload
     */
    function _lzReceive(uint32 _srcEid, bytes32 _srcAddress, bytes calldata _payload) internal override {
        // Decode the payload
        CoreLibs.BridgeMessage memory message = abi.decode(_payload, (CoreLibs.BridgeMessage));

        // Handle message based on token type
        if (message.isFungible) {
            _handleFungibleTokenReceive(message, _srcEid);
        } else {
            _handleNonFungibleTokenReceive(message, _srcEid);
        }
    }

    /**
     * @dev Handles receiving fungible tokens from another chain
     * @param message The bridge message
     * @param srcEid The source endpoint ID
     */
    function _handleFungibleTokenReceive(CoreLibs.BridgeMessage memory message, uint32 srcEid) internal {
        // Check if the token is registered on this chain
        if (fungibleTokens[message.tokenAddress].isRegistered) {
            // Token exists, transfer from bridge to recipient
            IERC20(message.tokenAddress).transfer(message.to, message.amount);
            emit FungibleTokensUnlocked(message.tokenAddress, message.to, message.amount);
        } else {
            // Token doesn't exist on this chain, need to create or mint representation
            // The implementation will depend on your specific token bridging strategy
            // This would typically involve creating a new token or using a pre-deployed wrapper
        }
    }

    /**
     * @dev Handles receiving non-fungible tokens from another chain
     * @param message The bridge message
     * @param srcEid The source endpoint ID
     */
    function _handleNonFungibleTokenReceive(CoreLibs.BridgeMessage memory message, uint32 srcEid) internal {
        // Check if the token is registered on this chain
        if (nonFungibleTokens[message.tokenAddress].isRegistered) {
            // Token exists, transfer from bridge to recipient
            IERC721(message.tokenAddress).transferFrom(address(this), message.to, message.tokenId);
            emit NonFungibleTokenUnlocked(message.tokenAddress, message.to, message.tokenId);
        } else {
            // Token doesn't exist on this chain, need to create or mint representation
            // The implementation will depend on your specific NFT bridging strategy
            // This would typically involve creating a new NFT or using a pre-deployed wrapper
        }
    }
}
