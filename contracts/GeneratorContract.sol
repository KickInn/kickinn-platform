// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./FinancingContract.sol";
import "./TokenBSP.sol";
import "./RewardContract.sol";

contract GeneratorContract {
    address public implementationFinancing;
    address public implementationToken;
    address public implementationReward;

    address public owner;

    event DealDeployed(address financing, address token, address reward);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function setImplementations(
        address _fin,
        address _tok,
        address _rew
    ) external onlyOwner {
        implementationFinancing = _fin;
        implementationToken = _tok;
        implementationReward = _rew;
    }

    function launchDeal(
        string memory tokenName,
        string memory tokenSymbol
    ) external returns (address, address, address) {
        FinancingContract financing = new FinancingContract();
        TokenBSP token = new TokenBSP(tokenName, tokenSymbol);
        RewardContract reward = new RewardContract();
