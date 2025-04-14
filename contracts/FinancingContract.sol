// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FinancingContract {
    uint256 public minRaise;
    uint256 public maxRaise;
    uint256 public deadline;
    address public liquidityPool;

    mapping(address => uint256) public contributions;

    event Funded(address indexed investor, uint256 amount);
    event Refunded(address indexed investor);

    constructor() {}

    function configure(uint256 _min, uint256 _max, uint256 _duration, address _lp) external {
        minRaise = _min;
        maxRaise = _max;
        deadline = block.timestamp + _duration;
        liquidityPool = _lp;
    }

    function invest() external payable {
        require(block.timestamp < deadline, "Campaign ended");
        require(msg.value > 0, "Zero value");

        contributions[msg.sender] += msg.value;

        emit Funded(msg.sender, msg.value);
    }

    function refund() external {
        uint256 amount = contributions[msg.sender];
        require(amount > 0, "No funds to refund");

        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit Refunded(msg.sender);
    }

    // Optional: add withdraw() if campaign succeeds
}
