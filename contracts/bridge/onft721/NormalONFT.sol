// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import { OApp } from "@layerzerolabs/oapp-evm/contracts/OApp.sol";
import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title NormalONFT
 * @dev Implementation of Omnichain Non-Fungible Token that creates new token representations on destination chains
 */
contract NormalONFT is OApp, ERC721, Ownable {
    // The next token ID to mint
    uint256 private _nextTokenId;

    // Mapping from tokenId to token URI
    mapping(uint256 => string) private _tokenURIs;

    /**
     * @dev Constructor for creating a new Omnichain Non-Fungible Token
     * @param name_ The name of the token
     * @param symbol_ The symbol of the token
     * @param _endpoint The LayerZero endpoint address
     * @param _owner The owner of the contract
     */
    constructor(
        string memory name_,
        string memory symbol_,
        address _endpoint,
        address _owner
    ) OApp(_endpoint, _owner) ERC721(name_, symbol_) Ownable(_owner) {}

    /**
     * @dev Mints a new token
     * @param to The address that will own the minted token
     * @param uri The token URI
     * @return uint256 The ID of the newly minted token
     */
    function mint(address to, string memory uri) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _mint(to, tokenId);
        _tokenURIs[tokenId] = uri;
        return tokenId;
    }

    /**
     * @dev Sets the URI for a token
     * @param tokenId The ID of the token
     * @param uri The token URI
     */
    function setTokenURI(uint256 tokenId, string memory uri) public onlyOwner {
        require(_exists(tokenId), "NormalONFT: URI set of nonexistent token");
        _tokenURIs[tokenId] = uri;
    }

    /**
     * @dev Returns the URI for a token
     * @param tokenId The ID of the token
     * @return string The token URI
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "NormalONFT: URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }

    /**
     * @dev Internal function to check if a token exists
     * @param tokenId The ID of the token
     * @return bool True if the token exists
     */
    function _exists(uint256 tokenId) internal view returns (bool) {
        return tokenId < _nextTokenId && ownerOf(tokenId) != address(0);
    }

    /**
     * @dev Function to handle incoming messages from LayerZero
     * @param _srcEid The source endpoint ID
     * @param _srcAddress The source sender address
     * @param _payload The message payload
     */
    function _lzReceive(uint32 _srcEid, bytes32 _srcAddress, bytes calldata _payload) internal override {
        // Decode the payload and mint/transfer tokens as needed
        // Implementation details depend on the specific cross-chain NFT protocol
    }
}
