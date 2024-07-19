// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MintToken is ERC20 {
    uint256 public constant BURN_PERCENTAGE = 1; // 1% 
    address public BURN_ADDRESS; 


    constructor () ERC20("Teddy Coin", "Teddy") {
        BURN_ADDRESS = msg.sender;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override { 
        uint256 burnAmount = (amount * BURN_PERCENTAGE) / 100;
        super._transfer(sender, recipient, amount - burnAmount);
        super._transfer(sender, BURN_ADDRESS, burnAmount);
    }

    function mint() public  {
        _mint(msg.sender, 100000 * (10 ** uint256(decimals())));
    }
}


