# Deployment Guide

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>Contract Deployment Guide</h2>
</div>

## Overview

This guide provides detailed instructions for deploying the Hiền Lương Bridge protocol to both testnet and mainnet environments. The deployment process uses Hardhat and the LayerZero OApp deployment framework.

## Prerequisites

Before deploying, ensure you have:

1. Set up your environment as described in the [Environment Setup Guide](./environment_setup.md)
2. Configured your `.env` file with:
   - Private key or mnemonic for the deployer account
   - RPC URLs for each target network
   - API keys for verification services

3. Funded your deployer account with sufficient native tokens on all target networks

## Deployment Configuration

### LayerZero Configuration

The `layerzero.config.ts` file contains the configuration for LayerZero endpoints and gas settings. Review and update this file before deployment:

```typescript
// Example layerzero.config.ts
export default {
  networks: {
    // Testnets
    "optimism-sepolia": {
      endpointId: 10232,
      gasSettings: {
        messageSend: 200000,
        messageExecute: 200000,
      },
    },
    "arbitrum-sepolia": {
      endpointId: 10231,
      gasSettings: {
        messageSend: 200000,
        messageExecute: 200000,
      },
    },
    // Mainnets
    ethereum: {
      endpointId: 1,
      gasSettings: {
        messageSend: 250000,
        messageExecute: 250000,
      },
    },
    optimism: {
      endpointId: 10,
      gasSettings: {
        messageSend: 250000,
        messageExecute: 250000,
      },
    },
    arbitrum: {
      endpointId: 110,
      gasSettings: {
        messageSend: 250000,
        messageExecute: 250000,
      },
    },
  },
};
```

### Deployment Scripts

Deployment scripts are located in the `deploy/` directory. The main OApp deployment script is `CoreOApp.ts`, which should be reviewed and customized before deployment.

Key configuration points in deployment scripts:

```typescript
// Example from CoreOApp.ts
export default async function deploy(hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts } = hre;
  const { deploy } = deployments;
  const { deployer } = await getNamedAccounts();

  // Deploy BridgeCore
  const endpoint = await deployments.get("Endpoint");
  const bridgeCore = await deploy("BridgeCore", {
    from: deployer,
    args: [endpoint.address],
    log: true,
    skipIfAlreadyDeployed: true,
  });

  // Deploy other components...
}
```

## Deployment Process

### Step 1: Testnet Deployment

It's recommended to start with testnet deployment before moving to mainnet.

```bash
# Deploy to selected testnets
pnpm hardhat lz:deploy --tags MyOApp --networks optimism-sepolia,arbitrum-sepolia
```

During the deployment process, you'll be prompted to select the networks you wish to deploy to. Follow the interactive prompts to proceed.

### Step 2: Verify Testnet Deployment

After deployment, verify the contracts on block explorers:

```bash
# Verify contracts on all networks
pnpm hardhat lz:verify --tags MyOApp
```

### Step 3: Test Cross-Chain Functionality

Before proceeding to mainnet, thoroughly test the cross-chain functionality:

```bash
# Send a test message between chains
pnpm hardhat lz:oapp:send --srcNetwork optimism-sepolia --dstNetwork arbitrum-sepolia --string "Hello World"
```

### Step 4: Mainnet Deployment

Once testnet deployment has been verified, proceed with mainnet deployment:

```bash
# Deploy to selected mainnets
pnpm hardhat lz:deploy --tags MyOApp --networks ethereum,optimism,arbitrum
```

### Step 5: Verify Mainnet Deployment

Verify the mainnet contracts:

```bash
# Verify contracts on all networks
pnpm hardhat lz:verify --tags MyOApp
```

## Deployment Verification

After deployment, verify the following:

1. **Contract Addresses**: Ensure contracts are deployed to the expected addresses
2. **Contract Verification**: Verify that contract source code is verified on block explorers
3. **OApp Configuration**: Check that OApp peer contracts are correctly configured
4. **Cross-Chain Messaging**: Test cross-chain messaging functionality
5. **Gas Settings**: Confirm that gas settings are appropriate for each network

## Post-Deployment Setup

### Bridge Configuration

After deploying the bridge contracts, perform these configuration steps:

1. **Register Bridge Admins**:

   ```bash
   pnpm hardhat run scripts/bridge/registerAdmins.ts --network optimism
   ```

2. **Register Tokens**:

   ```bash
   pnpm hardhat run scripts/bridge/registerTokens.ts --network optimism
   ```

3. **Configure Fee Parameters**:
   ```bash
   pnpm hardhat run scripts/bridge/configureFees.ts --network optimism
   ```

### Lending Pool Configuration

For lending pools, perform these configuration steps:

1. **Set Interest Rates**:

   ```bash
   pnpm hardhat run scripts/lending/setInterestRates.ts --network optimism
   ```

2. **Configure Risk Parameters**:

   ```bash
   pnpm hardhat run scripts/lending/configureRiskParams.ts --network optimism
   ```

3. **Initialize Oracle**:
   ```bash
   pnpm hardhat run scripts/lending/initializeOracle.ts --network optimism
   ```

## Upgrading Contracts

For contract upgrades, follow this process:

1. **Deploy New Implementation**:

   ```bash
   pnpm hardhat run scripts/upgrades/deployImplementation.ts --network optimism
   ```

2. **Prepare Upgrade**:

   ```bash
   pnpm hardhat run scripts/upgrades/prepareUpgrade.ts --network optimism
   ```

3. **Execute Upgrade**:
   ```bash
   pnpm hardhat run scripts/upgrades/executeUpgrade.ts --network optimism
   ```

## Security Considerations

### Pre-Deployment Security Checklist

Before deploying to mainnet, ensure:

1. **Code Audits**: All contracts have been audited by a reputable security firm
2. **Gas Optimization**: Functions are optimized for gas usage
3. **Access Control**: Admin functions are properly secured
4. **Emergency Pause**: Emergency pause mechanisms are implemented and tested
5. **Fee Configuration**: Fees are set to appropriate values

### Post-Deployment Security Monitoring

After deployment, implement:

1. **Monitoring Systems**: Set up alerts for unusual contract activity
2. **Regular Audits**: Schedule regular security reviews
3. **Bug Bounty Program**: Establish a bug bounty program for security researchers

## Deployment Troubleshooting

### Common Issues and Solutions

1. **Gas Estimation Errors**:
   - Increase the gas limit in `layerzero.config.ts`
   - Check for contract initialization issues

2. **Nonce Management**:
   - If transactions fail due to nonce issues, reset your account nonce:
     ```bash
     pnpm hardhat reset-nonce --network optimism
     ```

3. **Network Configuration**:
   - Double-check RPC URLs and endpoint IDs
   - Ensure deployer has sufficient funds

4. **LayerZero OApp Configuration**:
   - Verify endpoint addresses
   - Ensure peer contracts are correctly registered

5. **Contract Verification Failures**:
   - Check that API keys are valid and have sufficient quota
   - Ensure compiler settings match deployment settings

## Mainnet Deployment Checklist

Use this checklist for mainnet deployments:

- [ ] All tests pass in both Hardhat and Foundry environments
- [ ] Security audit completed and all issues addressed
- [ ] Gas optimization performed on critical functions
- [ ] Testnet deployment verified and tested
- [ ] Deployer account funded on all target networks
- [ ] Emergency procedures documented and tested
- [ ] Monitoring systems configured
- [ ] Documentation updated with contract addresses

## Network-Specific Considerations

### Ethereum

- Higher gas costs require more optimization
- Consider deploying during low gas price periods
- Set higher gas limits for cross-chain messages

### Optimism

- Verify compatibility with the OVM
- Test gas usage specifically for this L2
- Configure appropriate L1 security fees

### Arbitrum

- Check compatibility with Arbitrum's execution environment
- Test with Arbitrum's specific gas model
- Set appropriate gas limits for cross-chain messages

## Multi-Chain Deployment Script

For convenience, a multi-chain deployment script is provided:

```typescript
// scripts/deployMultiChain.ts
import { run } from "hardhat";

async function main() {
  // Deploy to all configured networks
  await run("lz:deploy", { tags: "MyOApp" });

  // Verify contracts
  await run("lz:verify", { tags: "MyOApp" });

  // Configure peers
  await run("lz:oapp:configurePeers", { tags: "MyOApp" });

  // Print deployment summary
  await run("lz:oapp:printDeployment", { tags: "MyOApp" });
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
```

Run this script with:

```bash
pnpm hardhat run scripts/deployMultiChain.ts
```

## Conclusion

Following this deployment guide will help ensure a smooth, secure deployment of the Hiền Lương Bridge protocol across multiple blockchain networks. Always start with testnets before deploying to mainnet, and thoroughly test all functionality, especially cross-chain operations.

For additional assistance, consult the LayerZero documentation or reach out to the development team.
