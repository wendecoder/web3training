import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import 'dotenv/config';

const config: HardhatUserConfig = {
  solidity: {
   version: "0.8.24",
   settings: {
    viaIR: true,
   }
  },
  networks: {
    etherlinkTest: {
      url: "https://node.ghostnet.etherlink.com",
      accounts: [process.env.PRIVATE_KEY || ""],
    }
  }
};

export default config;