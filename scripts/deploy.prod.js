// Kick Inn – Hardhat Deploy Script (Production)

const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying with address:", deployer.address);

  // Deploy FinancingContract
  const Financing = await hre.ethers.getContractFactory("FinancingContract");
  const financing = await Financing.deploy();
  await financing.deployed();

  // Deploy TokenBSP
  const Token = await hre.ethers.getContractFactory("TokenBSP");
  const token = await Token.deploy("KickInn", "KINN");
  await token.deployed();

  // Deploy RewardContract
  const Reward = await hre.ethers.getContractFactory("RewardContract");
  const reward = await Reward.deploy();
  await reward.deployed();

  // Deploy MirrorSM
  const Mirror = await hre.ethers.getContractFactory("MirrorSM");
  const mirror = await Mirror.deploy("KickInn-M", "K-M", token.address);
  await mirror.deployed();

  // Deploy GeneratorContract
  const Generator = await hre.ethers.getContractFactory("GeneratorContract");
  const generator = await Generator.deploy();
  await generator.deployed();

  // Set Generator's implementations
  const tx = await generator.setImplementations(
    financing.address,
    token.address,
    reward.address
  );
  await tx.wait();

  // Output deployed addresses
  console.log("✅ Deployed Contracts:");
  console.log("FinancingContract:", financing.address);
  console.log("TokenBSP:", token.address);
  console.log("RewardContract:", reward.address);
  console.log("MirrorSM:", mirror.address);
  console.log("GeneratorContract:", generator.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
