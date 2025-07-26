# Hiền Lương Bridge - AI Coding Agent Instructions

## Project Overview

Hiền Lương Bridge is a cross-chain protocol built on LayerZero that enables digital assets to be transferred between different blockchain networks. The project consists of three main components:

1. **Bridge** - Core cross-chain asset bridging functionality
2. **Lending** - Cross-chain lending protocol
3. **Staking** - Staking mechanisms (in development)

## Architecture & Code Structure

- `contracts/bridge/` - Contains the bridge implementation:
  - `BridgeCore.sol` - Central bridge contract for asset management
  - `oft/` - Omnichain Fungible Token contracts
  - `onft721/` - Omnichain NFT contracts
  - `interfaces/` - Contract interfaces
  - `libraries/` - Shared utility libraries (e.g., `CoreLibs.sol`)

- `contracts/lending/` - Contains lending protocols
  - `SourcePool.sol` - Lending pool on source chain
  - `DestinationPool.sol` - Corresponding pool on destination chain
  - `Oracle.sol` - Price oracle for lending operations

- `deploy/` - Deployment scripts using Hardhat deploy framework
  - `CoreOApp.ts` - Main deployment script for OApp contracts

## Technology Stack

- **Smart Contract Development**: Solidity 0.8.22
- **Testing Frameworks**:
  - Hardhat for TypeScript-based testing
  - Foundry (Forge) for Solidity-based testing
- **Cross-Chain Protocol**: LayerZero v2
- **Package Management**: pnpm

## Development Workflows

### Environment Setup

```bash
# Copy example env and configure with your keys
cp .env.example .env
# Set MNEMONIC or PRIVATE_KEY in .env

# Install dependencies
pnpm install
```

### Build & Compile

```bash
# Compile contracts with both Hardhat and Foundry
pnpm compile

# Compile with specific tooling
pnpm compile:hardhat
pnpm compile:forge
```

### Testing

```bash
# Run all tests (both Hardhat and Foundry)
pnpm test

# Run specific test frameworks
pnpm test:hardhat
pnpm test:forge
```

### Deployment

```bash
# Deploy to selected chains
pnpm hardhat lz:deploy --tags MyOApp
```

### Cross-Chain Messaging

The project leverages LayerZero OApp framework for cross-chain communication. When implementing new cross-chain functionality:

1. Define your contract as an OApp
2. Configure peer contracts in `layerzero.config.ts`
3. Set appropriate gas limits for cross-chain message execution
4. Use the `sendString` task to test messaging:
   ```bash
   pnpm hardhat lz:oapp:send --dstEid <ENDPOINT_ID> --string "Hello World"
   ```

## Key Integration Points

1. **LayerZero Protocol**: The project heavily utilizes LayerZero for cross-chain communication. All OApp contracts must correctly implement peer management and message handling.

2. **Token Standards**:
   - OFT (Omnichain Fungible Token) for ERC20-compatible tokens
   - ONFT (Omnichain NFT) for ERC721-compatible tokens

3. **Bridge Architecture**:
   - Normal mode: Create new token representations on destination chains
   - Adapter mode: Bridge existing tokens between chains

## Code Conventions & Patterns

1. **Contract Inheritance**: The project follows a modular approach with specialized base contracts for cross-chain functionality.

2. **Token Bridging**:
   - Fungible tokens use the OFT (Omnichain Fungible Token) standard
   - NFTs use the ONFT (Omnichain NFT) standard

3. **Core Libraries**: Use `CoreLibs.sol` for shared data structures and functionality

4. **Testing Approach**: All cross-chain functionality should have both Hardhat JS tests and Foundry Solidity tests

## Important Notes

- This project is under active development - many contracts are scaffolded but not yet implemented
- Always verify cross-chain message gas requirements with the `quoteSendString` function before sending messages
- The project targets LayerZero v2 on the Optimism Sepolia and Arbitrum Sepolia testnets by default
