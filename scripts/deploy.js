const { ethers } = require("hardhat");

async function main() {
const GenerationContract = await ethers.getContractFactory("EasyNft");
const generationContract = await GenerationContract.deploy();

await generationContract.waitForDeployment();
const tx = await generationContract.deploymentTransaction();

console.log("Contract deployed successfully.");
console.log(`Deployer: ${generationContract.runner.address}`);
console.log(`Deployed to: ${generationContract.target}`);
console.log(`Transaction hash: ${tx.hash}`);
}

main()
.then(() => process.exit(0))
.catch(error => {
    console.error(error);
    process.exit(1);
});