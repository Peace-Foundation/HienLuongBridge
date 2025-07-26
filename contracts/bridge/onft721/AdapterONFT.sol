// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { OApp } from "@layerzerolabs/oapp-evm/contracts/OApp.sol";
import { IERC721 } from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title AdapterONFT
 * @dev Implementation of Omnichain NFT adapter for existing NFT collections
 */
contract AdapterONFT is OApp, Ownable {
    // The NFT contract this adapter wraps
    IERC721 public immutable token;

    // Mapping to track tokens locked in this contract
    mapping(uint256 => address) private _originalOwners;

    event TokenLocked(address indexed from, uint256 indexed tokenId, uint32 dstEid);
    event TokenUnlocked(address indexed to, uint256 indexed tokenId, uint32 srcEid);

    /**
     * @dev Constructor for creating an adapter for an existing NFT collection
     * @param _token The address of the existing NFT contract
     * @param _endpoint The LayerZero endpoint address
     * @param _owner The owner of the contract
     */
    constructor(address _token, address _endpoint, address _owner) OApp(_endpoint, _owner) Ownable(_owner) {
        require(_token != address(0), "AdapterONFT: token cannot be zero address");
        token = IERC721(_token);
    }

    /**
     * @dev Locks a token in this contract and sends a message to the destination chain
     * @param tokenId The ID of the token to bridge
     * @param to The address on the destination chain that will receive the token
     * @param dstEid The destination endpoint ID
     * @param options Additional options for the cross-chain message
     */
    function bridgeToken(uint256 tokenId, address to, uint32 dstEid, bytes calldata options) external payable {
        // Transfer the token to this contract (lock)
        token.transferFrom(msg.sender, address(this), tokenId);
        _originalOwners[tokenId] = msg.sender;

        // Create and send the cross-chain message
        bytes memory payload = abi.encode(tokenId, to);

        _lzSend(dstEid, payload, options, msg.value, payable(msg.sender));

        emit TokenLocked(msg.sender, tokenId, dstEid);
    }

    /**
     * @dev Unlocks a token and returns it to the original owner
     * @param tokenId The ID of the token to unlock
     */
    function unlockToken(uint256 tokenId) external {
        address originalOwner = _originalOwners[tokenId];
        require(originalOwner == msg.sender, "AdapterONFT: not the original owner");

        delete _originalOwners[tokenId];
        token.transferFrom(address(this), originalOwner, tokenId);
    }

    /**
     * @dev Function to handle incoming messages from LayerZero
     * @param _srcEid The source endpoint ID
     * @param _srcAddress The source sender address
     * @param _payload The message payload
     */
    function _lzReceive(uint32 _srcEid, bytes32 _srcAddress, bytes calldata _payload) internal override {
        // Decode the payload
        (uint256 tokenId, address to) = abi.decode(_payload, (uint256, address));

        // Handle based on adapter logic - either unlock an existing token or mint/transfer a representation
        if (_originalOwners[tokenId] != address(0)) {
            // Token exists in this contract, unlock it
            delete _originalOwners[tokenId];
            token.transferFrom(address(this), to, tokenId);
            emit TokenUnlocked(to, tokenId, _srcEid);
        } else {
            // Logic for handling tokens that originated on other chains
            // This would be implemented based on the specific cross-chain NFT protocol
        }
    }
}
