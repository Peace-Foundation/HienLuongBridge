# Environment Setup Guide

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>Development Environment Setup</h2>
</div>

## Prerequisites

Before setting up the development environment for Hiền Lương Bridge, ensure you have the following prerequisites installed:

- **Node.js**: Version 18.16.0 or higher

  ```bash
  node --version
  ```

- **Package Manager**: pnpm (recommended), npm, or yarn

  ```bash
  # Install pnpm globally if not already installed
  npm install -g pnpm
  ```

- **Foundry** (optional): Version 0.2.0 or higher for Solidity-based testing
  ```bash
  # Install Foundry
  curl -L https://foundry.paradigm.xyz | bash
  foundryup
  ```

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/Peace-Foundation/hien-luong-bridge.git
cd hien-luong-bridge
```

### 2. Environment Configuration

Create a `.env` file by copying the example template:

```bash
# Copy example env and configure with your keys
cp .env.example .env
```

Edit the `.env` file to include your configuration:

```
# CHOOSE ONE: Private Key OR Mnemonic
PRIVATE_KEY=0xabcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890
# OR
MNEMONIC=test test test test test test test test test test test junk

# RPC URLs for supported networks
ETH_MAINNET_URL=https://eth-mainnet.g.alchemy.com/v2/YOUR_API_KEY
ETH_SEPOLIA_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY
OPTIMISM_SEPOLIA_URL=https://optimism-sepolia.infura.io/v3/YOUR_API_KEY
ARBITRUM_SEPOLIA_URL=https://arbitrum-sepolia.g.alchemy.com/v2/YOUR_API_KEY

# API keys for verification services
ETHERSCAN_API_KEY=YOUR_ETHERSCAN_API_KEY
OPTIMISM_ETHERSCAN_API_KEY=YOUR_OPTIMISM_ETHERSCAN_API_KEY
ARBISCAN_API_KEY=YOUR_ARBISCAN_API_KEY

# Optional configuration
GAS_PRICE_MULTIPLIER=1.1
```

### 3. Install Dependencies

```bash
pnpm install
```

### 4. Compile Contracts

```bash
# Compile with both Hardhat and Foundry
pnpm compile

# Or use specific tooling
pnpm compile:hardhat
pnpm compile:forge
```

## IDE Setup

### Visual Studio Code

1. Install the following extensions:
   - Solidity by Juan Blanco
   - Solidity Visual Developer
   - Hardhat Solidity
   - ESLint
   - Prettier

2. Configure VS Code settings for Solidity:
   ```json
   {
     "solidity.compileUsingRemoteVersion": "v0.8.22",
     "solidity.defaultCompiler": "localNodeModule",
     "solidity.formatter": "prettier",
     "editor.formatOnSave": true
   }
   ```

## LayerZero Configuration

### Setting Up LayerZero Config

The project includes a default `layerzero.config.ts` file, which you may need to update based on your deployment needs:

1. Identify the networks you want to deploy to
2. Configure the endpoint IDs for those networks
3. Set appropriate gas limits for cross-chain message execution

```typescript
// Example layerzero.config.ts configuration
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
    // Add more networks as needed
  },
};
```

## Next Steps

After completing the environment setup, you can:

- [Run the test suite](./testing_guide.md)
- [Deploy the contracts](./deployment_guide.md)
- [Explore the SDK](./sdk_documentation.md)

## Troubleshooting

### Common Issues

#### Compilation Errors

If you encounter compilation errors, try:

- Ensuring you're using the correct Solidity version (0.8.22)
- Clearing the cache: `pnpm hardhat clean`
- Updating dependencies: `pnpm update`

#### LayerZero Connection Issues

If you have problems with LayerZero endpoints:

- Verify your RPC URLs in the `.env` file
- Check that the endpoint IDs in `layerzero.config.ts` match the LayerZero documentation
- Ensure you have sufficient funds on the deployer account for both chains

#### Gas Estimation Errors

For gas-related errors:

- Try increasing the gas limit in `layerzero.config.ts`
- Set a higher `GAS_PRICE_MULTIPLIER` in your `.env` file

## Support

If you encounter any issues with the environment setup, please:

1. Check the [FAQ](../faq.md)
2. Search the [GitHub issues](https://github.com/Peace-Foundation/hien-luong-bridge/issues)
3. Create a new issue if your problem hasn't been reported

For more detailed support, contact the development team through [Discord](#) or [Telegram](#).
