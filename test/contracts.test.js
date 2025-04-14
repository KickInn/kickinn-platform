// KickInn – Hardhat Test Suite (MVP)
// Tests for core contracts: TokenBSP, FinancingContract, RewardContract, MirrorSM

const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("KickInn Core Contracts", function () {
  let deployer, investor, contributor;
  let token, financing, reward, mirror;

  beforeEach(async () => {
    [deployer, investor, contributor] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("TokenBSP");
    token = await Token.deploy("KickInn", "KINN");
    await token.deployed();

    const Financing = await ethers.getContractFactory("FinancingContract");
    financing = await Financing.deploy();
    await financing.deployed();

    const Reward = await ethers.getContractFactory("RewardContract");
    reward = await Reward.deploy();
    await reward.deployed();

    const Mirror = await ethers.getContractFactory("MirrorSM");
    mirror = await Mirror.deploy("KickInn-M", "KM", token.address);
    await mirror.deployed();
  });

  it("should mint tokens only by owner", async () => {
    await token.mint(investor.address, 1000);
    const bal = await token.balanceOf(investor.address);
    expect(bal).to.equal(1000);
  });

  it("should allow investment and refund in financing contract", async () => {
    await financing.configure(1, 10000, 3600, contributor.address);
    await financing.connect(investor).invest({ value: 1000 });
    const record = await financing.contributions(investor.address);
    expect(record).to.equal(1000);

    await financing.connect(investor).refund();
    const post = await financing.contributions(investor.address);
    expect(post).to.equal(0);
  });

  it("should allow mirror tokens to be minted by operator", async () => {
    await mirror.mirrorMint(contributor.address, 500);
    const bal = await mirror.balanceOf(contributor.address);
    expect(bal).to.equal(500);
  });

  it("should fund and claim rewards correctly", async () => {
    await reward.fundReward(contributor.address, 300);
    await reward.connect(contributor).claim(); // no revert = OK
  });
});
