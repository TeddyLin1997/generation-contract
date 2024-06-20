// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ERC20Item.sol";
import "./ERC721Item.sol";
import "./ERC1155Item.sol";

contract GenerationAssets {
    mapping(address => address[]) public userContracts;


    event ERC20Created(address indexed creator, address indexed tokenAddress);
    event ERC721Created(address indexed creator, address indexed tokenAddress);
    event ERC1155Created(address indexed creator, address indexed tokenAddress);


    function getUserContracts() public view returns(address[] memory) {
        return userContracts[msg.sender];
    }

    function createERC20(address to, string memory tokenName, string memory tokenSymbol, uint256 preMintAmount) external {
        ERC20Item newToken = new ERC20Item(to, tokenName, tokenSymbol, preMintAmount);
        address tokenAddress = address(newToken);
        userContracts[msg.sender].push(tokenAddress);

        emit ERC20Created(msg.sender, tokenAddress);
    }

    function createERC721(address to, string memory tokenName, string memory tokenSymbol, uint256 mintAmount, string memory baseURI_) external {
        ERC721Item newToken = new ERC721Item(to, tokenName, tokenSymbol, mintAmount, baseURI_);
        address tokenAddress = address(newToken);
        userContracts[msg.sender].push(tokenAddress);

        emit ERC721Created(msg.sender, tokenAddress);
    }

    function createERC1155(address to, string memory tokenName, string memory tokenSymbol, uint256 mintAmount, string memory baseURI_, bytes memory data) external {
        ERC1155Item newToken = new ERC1155Item(to, tokenName, tokenSymbol, mintAmount, baseURI_, data);
        address tokenAddress = address(newToken);
        userContracts[msg.sender].push(tokenAddress);

        emit ERC1155Created(msg.sender, tokenAddress);
    }
}
