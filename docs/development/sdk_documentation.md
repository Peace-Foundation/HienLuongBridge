# SDK Documentation

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>Developer SDK Guide</h2>
</div>

## Overview

The Hiền Lương Bridge SDK provides developers with a simple, intuitive interface to interact with the Hiền Lương Bridge protocol. This SDK allows developers to seamlessly integrate cross-chain functionality into their applications without needing to understand the underlying complexity of the LayerZero protocol.

## Installation

### npm / yarn / pnpm

```bash
# npm
npm install @hien-luong/sdk

# yarn
yarn add @hien-luong/sdk

# pnpm
pnpm add @hien-luong/sdk
```

## SDK Modules

The SDK is organized into several modules, each corresponding to a core component of the Hiền Lương Bridge protocol:

1. **Bridge** - For cross-chain asset transfers
2. **Lending** - For cross-chain lending operations
3. **Staking** - For staking operations (coming soon)
4. **Common** - Shared utilities and types

## Basic Usage

### Bridge Module

```typescript
import { ethers } from "ethers";
import { Bridge, ChainId, TokenType } from "@hien-luong/sdk";

// Initialize provider and signer
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

// Initialize Bridge SDK
const bridge = new Bridge({
  signer,
  defaultSourceChainId: ChainId.OPTIMISM,
});

// Bridge ERC20 token
async function bridgeERC20() {
  const tokenAddress = "0x1234..."; // Address of the token to bridge
  const amount = ethers.utils.parseEther("10"); // Amount to bridge
  const destinationAddress = "0xabcd..."; // Recipient address on destination chain

  const tx = await bridge.bridgeToken({
    sourceChainId: ChainId.OPTIMISM,
    destinationChainId: ChainId.ARBITRUM,
    tokenAddress,
    amount,
    recipientAddress: destinationAddress,
    tokenType: TokenType.ERC20,
  });

  const receipt = await tx.wait();
  console.log(`Bridge transaction confirmed: ${receipt.transactionHash}`);

  // Get estimated arrival time
  const estimatedTime = await bridge.getEstimatedArrivalTime(
    receipt.transactionHash,
  );
  console.log(`Estimated arrival on destination chain: ${estimatedTime}`);
}

// Bridge ERC721 token
async function bridgeERC721() {
  const tokenAddress = "0x5678..."; // Address of the NFT contract
  const tokenId = 123; // ID of the NFT to bridge
  const destinationAddress = "0xabcd..."; // Recipient address on destination chain

  const tx = await bridge.bridgeToken({
    sourceChainId: ChainId.OPTIMISM,
    destinationChainId: ChainId.ARBITRUM,
    tokenAddress,
    tokenId,
    recipientAddress: destinationAddress,
    tokenType: TokenType.ERC721,
  });

  const receipt = await tx.wait();
  console.log(`Bridge transaction confirmed: ${receipt.transactionHash}`);
}
```

### Lending Module

```typescript
import { ethers } from "ethers";
import { Lending, ChainId } from "@hien-luong/sdk";

// Initialize provider and signer
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

// Initialize Lending SDK
const lending = new Lending({
  signer,
  defaultSourceChainId: ChainId.OPTIMISM,
});

// Deposit funds to source lending pool
async function depositToSourcePool() {
  const tokenAddress = "0x1234..."; // Address of the token to deposit
  const amount = ethers.utils.parseEther("100"); // Amount to deposit

  const tx = await lending.depositToSourcePool({
    tokenAddress,
    amount,
  });

  const receipt = await tx.wait();
  console.log(`Deposit transaction confirmed: ${receipt.transactionHash}`);

  // Get updated balance
  const balance = await lending.getUserBalance({
    tokenAddress,
    userAddress: await signer.getAddress(),
  });

  console.log(`Updated balance: ${ethers.utils.formatEther(balance)}`);
}

// Borrow assets from a destination chain
async function borrowFromDestination() {
  const tokenAddress = "0x5678..."; // Address of the token to borrow
  const amount = ethers.utils.parseEther("50"); // Amount to borrow

  const tx = await lending.borrowFromDestination({
    destinationChainId: ChainId.ARBITRUM,
    tokenAddress,
    amount,
    duration: 30 * 24 * 60 * 60, // 30 days in seconds
  });

  const receipt = await tx.wait();
  console.log(`Borrow transaction initiated: ${receipt.transactionHash}`);

  // Track the borrow transaction
  const status = await lending.getTransactionStatus(receipt.transactionHash);
  console.log(`Current status: ${status}`);
}
```

## Advanced Usage

### Custom Configuration

```typescript
import { Bridge, BridgeConfig, ChainId } from "@hien-luong/sdk";

// Create custom configuration
const customConfig: BridgeConfig = {
  signer,
  defaultSourceChainId: ChainId.OPTIMISM,
  contractAddresses: {
    [ChainId.OPTIMISM]: {
      bridge: "0x1234...",
      factory: "0xabcd...",
    },
    [ChainId.ARBITRUM]: {
      bridge: "0x5678...",
      factory: "0xefgh...",
    },
  },
  gasSettings: {
    gasLimit: 500000,
    gasMultiplier: 1.2,
  },
  retrySettings: {
    maxRetries: 3,
    retryInterval: 1000, // ms
  },
};

// Initialize Bridge SDK with custom configuration
const bridge = new Bridge(customConfig);
```

### Gas Estimation

```typescript
// Estimate gas for bridging
const gasEstimation = await bridge.estimateBridgeGas({
  sourceChainId: ChainId.OPTIMISM,
  destinationChainId: ChainId.ARBITRUM,
  tokenAddress: "0x1234...",
  amount: ethers.utils.parseEther("10"),
  tokenType: TokenType.ERC20,
});

console.log(`Estimated gas on source chain: ${gasEstimation.sourceGas}`);
console.log(
  `Estimated gas on destination chain: ${gasEstimation.destinationGas}`,
);
console.log(
  `Estimated total gas cost (in ETH): ${ethers.utils.formatEther(gasEstimation.totalGasCost)}`,
);
```

### Transaction Monitoring

```typescript
// Monitor a bridge transaction
const transactionHash = "0x1234...";

// Get the current status
const status = await bridge.getTransactionStatus(transactionHash);
console.log(`Current status: ${status}`);

// Set up a listener for transaction progress
bridge.on("transactionUpdate", (update) => {
  console.log(`Transaction ${update.hash} status: ${update.status}`);
  if (update.confirmations) {
    console.log(`Confirmations: ${update.confirmations}`);
  }
});

// Start monitoring the transaction
bridge.monitorTransaction(transactionHash);
```

## Events

The SDK provides event emitters for monitoring various operations:

```typescript
// Bridge events
bridge.on("transactionSent", (event) =>
  console.log("Transaction sent:", event),
);
bridge.on("transactionConfirmed", (event) =>
  console.log("Transaction confirmed:", event),
);
bridge.on("messageReceived", (event) =>
  console.log("Message received on destination chain:", event),
);
bridge.on("error", (error) => console.error("Bridge error:", error));

// Lending events
lending.on("deposit", (event) => console.log("Deposit event:", event));
lending.on("withdraw", (event) => console.log("Withdraw event:", event));
lending.on("borrow", (event) => console.log("Borrow event:", event));
lending.on("repay", (event) => console.log("Repay event:", event));
lending.on("error", (error) => console.error("Lending error:", error));
```

## Error Handling

```typescript
try {
  const tx = await bridge.bridgeToken({
    sourceChainId: ChainId.OPTIMISM,
    destinationChainId: ChainId.ARBITRUM,
    tokenAddress: "0x1234...",
    amount: ethers.utils.parseEther("10"),
    recipientAddress: "0xabcd...",
    tokenType: TokenType.ERC20,
  });

  const receipt = await tx.wait();
} catch (error) {
  if (error.code === "INSUFFICIENT_FUNDS") {
    console.error("Insufficient funds to complete the transaction");
  } else if (error.code === "BRIDGE_NOT_AVAILABLE") {
    console.error("Bridge is not available for the selected chains");
  } else if (error.code === "UNSUPPORTED_TOKEN") {
    console.error("Token is not supported by the bridge");
  } else if (error.code === "USER_REJECTED") {
    console.error("User rejected the transaction");
  } else {
    console.error("Unknown error:", error);
  }
}
```

## Utilities

### Token Allowance

```typescript
// Check if token allowance is sufficient
const hasAllowance = await bridge.hasTokenAllowance({
  tokenAddress: "0x1234...",
  amount: ethers.utils.parseEther("10"),
});

if (!hasAllowance) {
  // Approve token allowance
  const approveTx = await bridge.approveTokenAllowance({
    tokenAddress: "0x1234...",
    amount: ethers.utils.parseEther("10"),
  });

  await approveTx.wait();
  console.log("Token allowance approved");
}
```

### Chain Information

```typescript
// Get information about supported chains
const supportedChains = bridge.getSupportedChains();
console.log("Supported chains:", supportedChains);

// Get details about a specific chain
const chainInfo = bridge.getChainInfo(ChainId.ARBITRUM);
console.log("Chain info:", chainInfo);

// Check if a pair of chains is supported
const isSupported = bridge.isBridgeSupported(
  ChainId.OPTIMISM,
  ChainId.ARBITRUM,
);
console.log("Bridge supported:", isSupported);
```

### Fee Calculation

```typescript
// Calculate bridge fees
const fee = await bridge.calculateBridgeFee({
  sourceChainId: ChainId.OPTIMISM,
  destinationChainId: ChainId.ARBITRUM,
  tokenAddress: "0x1234...",
  amount: ethers.utils.parseEther("10"),
  tokenType: TokenType.ERC20,
});

console.log(`Bridge fee: ${ethers.utils.formatEther(fee.protocolFee)} ETH`);
console.log(`LayerZero fee: ${ethers.utils.formatEther(fee.layerZeroFee)} ETH`);
console.log(`Total fee: ${ethers.utils.formatEther(fee.totalFee)} ETH`);
```

## TypeScript Support

The SDK is written in TypeScript and includes comprehensive type definitions for all functionality.

```typescript
import {
  Bridge,
  Lending,
  BridgeConfig,
  LendingConfig,
  ChainId,
  TokenType,
  BridgeTransaction,
  TransactionStatus,
  BridgeEvent,
  LendingEvent,
} from "@hien-luong/sdk";

// All parameters and return values are fully typed
const bridge = new Bridge({
  signer,
  defaultSourceChainId: ChainId.OPTIMISM,
});

// TypeScript will enforce correct parameter types
const tx: Promise<ethers.ContractTransaction> = bridge.bridgeToken({
  sourceChainId: ChainId.OPTIMISM,
  destinationChainId: ChainId.ARBITRUM,
  tokenAddress: "0x1234...",
  amount: ethers.utils.parseEther("10"),
  recipientAddress: "0xabcd...",
  tokenType: TokenType.ERC20,
});
```

## Browser and Node.js Support

The SDK supports both browser and Node.js environments:

```javascript
// Browser (with bundler like webpack, rollup, etc.)
import { Bridge } from "@hien-luong/sdk";

// Node.js
const { Bridge } = require("@hien-luong/sdk");
```

## Contributing

Contributions to the SDK are welcome. Please refer to the contribution guidelines in the GitHub repository.

## License

The SDK is licensed under the MIT License.

## Additional Resources

- [API Reference](https://docs.hienluongbridge.com/sdk/api)
- [Example Projects](https://github.com/Peace-Foundation/hien-luong-examples)
- [SDK GitHub Repository](https://github.com/Peace-Foundation/hien-luong-sdk)
