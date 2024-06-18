// import type { HardhatUserConfig } from "hardhat/config";
// import "@nomicfoundation/hardhat-toolbox-viem";

// const config: HardhatUserConfig = {
//   solidity: "0.8.24",
// };

// export default config;

require('dotenv').config();
require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.20",
  settings: {
    optimizer: {
      enabled: true,
      runs: 200,
    },
  },
  networks: {
      taiko: {
      url: process.env.RPC_URL,
      accounts: [process.env.YOUR_PRIVATE_KEY],
      }
  },
};