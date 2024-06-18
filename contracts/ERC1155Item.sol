// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract ERC1155Item is ERC1155 {
    string public tokenName;
    string public tokenSymbol;

    constructor(address initialOwner, string memory _tokenName, string memory _tokenSymbol, uint256 mintAmount, string memory uri, bytes memory data)
        ERC1155(uri)
    {
        mint(initialOwner, 1, mintAmount, data);
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
    }

    function setURI(string memory newuri) public {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data) public {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) public {
        _mintBatch(to, ids, amounts, data);
    }
}