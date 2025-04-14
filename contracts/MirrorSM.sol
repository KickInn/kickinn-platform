// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MirrorSM is ERC20 {
    address public originalToken;
    address public operator;

    mapping(address => uint256) public mirrored;

    constructor(string memory name, string memory symbol, address _originalToken) ERC20(name, symbol) {
        originalToken = _originalToken;
        operator = msg.sender;
    }

    function mirrorMint(address to, uint256 amount) external {
        require(msg.sender == operator, "Only operator can mint");
        _mint(to, amount);
        mirrored[to] += amount;
    }

    function setOperator(address _op) external {
        require(msg.sender == operator, "Only operator can transfer control");
        operator = _op;
    }
}
