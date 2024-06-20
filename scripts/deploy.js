const { ethers } = require("hardhat");

async function main() {
const GeneratorContract = await ethers.getContractFactory("generator");
const generatorContract = await GeneratorContract.deploy();

await generatorContract.waitForDeployment();
const tx = await generatorContract.deploymentTransaction();

console.log("Contract deployed successfully.");
console.log(`Deployer: ${generatorContract.runner.address}`);
console.log(`Deployed to: ${generatorContract.target}`);
console.log(`Transaction hash: ${tx.hash}`);
}

main()
.then(() => process.exit(0))
.catch(error => {
    console.error(error);
    process.exit(1);
});