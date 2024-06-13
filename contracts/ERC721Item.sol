// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract ERC721Item is ERC721, ERC721Burnable {
    uint256 private _nextTokenId;
    string private baseURI;

    constructor(address initialOwner, string memory tokenName, string memory tokenSymbol, uint256 mintAmount, string memory baseURI_)
        ERC721(tokenName, tokenSymbol)
    {
        baseURI = baseURI_;

        for (uint i = 0; i < mintAmount; i++) {
            safeMint(initialOwner);
        }
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function safeMint(address to) public {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
}