// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

// ERC20
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract ERC20Item is ERC20, ERC20Burnable, ERC20Permit {

    constructor(address initialOwner, string memory tokenName, string memory tokenSymbol, uint256 preMintAmount)
        ERC20(tokenName, tokenSymbol)
        ERC20Permit(tokenName)
    {
        _mint(initialOwner, preMintAmount * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}