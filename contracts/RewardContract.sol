// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract RewardContract is Ownable {
    address public kknToken;
    mapping(address => uint256) public stake;
    mapping(address => uint256) public rewards;

    event Funded(address indexed user, uint256 amount);
    event Claimed(address indexed user, uint256 amount);

    function setToken(address _kkn) external onlyOwner {
        kknToken = _kkn;
    }

    function fundReward(address user, uint256 amount) external onlyOwner {
        rewards[user] += amount;
        emit Funded(user, amount);
    }

    function claim() external {
        uint256 amount = rewards[msg.sender];
        require(amount > 0, "No rewards to claim");
        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
        emit Claimed(msg.sender, amount);
    }

    // Optional: add deposit(), withdraw(), stake() functions if used with LP logic
}

