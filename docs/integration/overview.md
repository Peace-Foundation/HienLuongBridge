# Integration Overview

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>Integration Guide for Developers</h2>
</div>

## Introduction

This guide provides an overview of how to integrate with the Hiền Lương Bridge protocol. It covers the different integration approaches, available tools, and best practices for developers looking to leverage cross-chain functionality in their applications.

## Integration Options

The Hiền Lương Bridge protocol offers several integration options to suit different needs:

1. **SDK Integration**: The recommended approach for most applications
2. **Direct Contract Interaction**: For advanced use cases requiring custom logic
3. **REST API**: For applications without direct blockchain interaction
4. **Widget Integration**: For quick implementation with minimal code

## Prerequisites

Before integrating with the protocol, ensure you have:

1. **Development Environment**: Node.js v18+ and a package manager (npm, yarn, or pnpm)
2. **Web3 Provider**: Access to blockchain nodes (via providers like Infura, Alchemy, etc.)
3. **Understanding of Cross-Chain Concepts**: Basic knowledge of how cross-chain messaging works
4. **API Keys**: Obtain API keys from the developer portal if using the REST API

## SDK Integration

### Installation

```bash
# npm
npm install @hien-luong/sdk

# yarn
yarn add @hien-luong/sdk

# pnpm
pnpm add @hien-luong/sdk
```

### Basic Setup

```typescript
import { HienLuongSDK, ChainId } from "@hien-luong/sdk";
import { ethers } from "ethers";

// Initialize provider and signer
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

// Initialize the SDK
const sdk = new HienLuongSDK({
  signer,
  defaultSourceChainId: ChainId.ETHEREUM,
});

// Check connection status
const isConnected = await sdk.isConnected();
console.log(`SDK connected: ${isConnected}`);
```

### SDK Modules

The SDK is organized into several modules:

```typescript
// Access specific modules
const { bridge, lending, staking } = sdk;

// Or access them directly
import { Bridge } from "@hien-luong/sdk";
const bridge = new Bridge({ signer });
```

For detailed SDK usage, see the [SDK Documentation](../development/sdk_documentation.md).

## Direct Contract Interaction

### Contract Addresses

The protocol's smart contracts are deployed at the following addresses:

```typescript
// Example contract addresses (replace with current addresses)
const CONTRACT_ADDRESSES = {
  [ChainId.ETHEREUM]: {
    bridge: "0x1234...",
    factory: "0xabcd...",
    lending: "0x5678...",
  },
  [ChainId.OPTIMISM]: {
    bridge: "0x9876...",
    factory: "0xefgh...",
    lending: "0x4321...",
  },
  // Other chains...
};
```

### ABI Definitions

ABI definitions are available:

1. As npm packages:

   ```bash
   npm install @hien-luong/contracts
   ```

2. In the GitHub repository:
   ```
   https://github.com/Peace-Foundation/hien-luong-bridge/tree/main/abis
   ```

### Example Contract Interaction

```typescript
import { ethers } from "ethers";
import { BridgeCore__factory } from "@hien-luong/contracts";

// Initialize provider and signer
const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

// Get contract instance
const bridgeAddress = "0x1234..."; // Replace with actual address
const bridge = BridgeCore__factory.connect(bridgeAddress, signer);

// Call contract methods
async function bridgeToken() {
  const tx = await bridge.bridgeToken(
    destinationChainId,
    recipientAddress,
    tokenAddress,
    amount,
    {
      gasLimit: 300000,
      value: messageFee, // For cross-chain message fee
    },
  );

  const receipt = await tx.wait();
  console.log(`Bridge transaction confirmed: ${receipt.transactionHash}`);
}
```

## REST API Integration

### Authentication

```typescript
import axios from "axios";

// Set up API client
const apiClient = axios.create({
  baseURL: "https://api.hienluongbridge.com/v1",
  headers: {
    "Content-Type": "application/json",
    "X-API-Key": "YOUR_API_KEY", // Replace with your actual API key
  },
});
```

### Example API Calls

```typescript
// Get supported chains
async function getSupportedChains() {
  const response = await apiClient.get("/chains");
  return response.data;
}

// Get bridge quote
async function getBridgeQuote(
  sourceChainId,
  destinationChainId,
  tokenAddress,
  amount,
) {
  const response = await apiClient.get("/quote", {
    params: {
      sourceChainId,
      destinationChainId,
      tokenAddress,
      amount,
    },
  });
  return response.data;
}

// Track transaction status
async function getTransactionStatus(txHash) {
  const response = await apiClient.get(`/transactions/${txHash}`);
  return response.data;
}
```

For full API documentation, see the [REST API Reference](https://docs.hienluongbridge.com/api).

## Widget Integration

### Script Installation

Add the widget script to your HTML:

```html
<script src="https://widget.hienluongbridge.com/v1/widget.js"></script>
```

### Basic Implementation

```html
<div id="bridge-widget"></div>

<script>
  HienLuongWidget.init({
    elementId: "bridge-widget",
    defaultSourceChain: "ethereum",
    defaultDestinationChain: "optimism",
    theme: "light", // or 'dark' or 'auto'
    partnerKey: "YOUR_PARTNER_KEY", // Replace with your partner key
    onSuccess: (transaction) => {
      console.log("Bridge transaction initiated:", transaction);
    },
    onError: (error) => {
      console.error("Bridge error:", error);
    },
  });
</script>
```

### Widget Customization

```javascript
HienLuongWidget.init({
  // Basic configuration
  elementId: "bridge-widget",

  // Appearance
  theme: "light",
  primaryColor: "#3498db",
  borderRadius: "10px",
  fontFamily: "Inter, sans-serif",

  // Functionality
  defaultSourceChain: "ethereum",
  defaultDestinationChain: "optimism",
  defaultTokenAddress: "0x1234...", // Optional default token
  showTestnets: false, // Hide testnet chains

  // Features
  enabledFeatures: ["bridge", "history"], // Exclude lending, staking, etc.

  // Callbacks
  onReady: () => console.log("Widget loaded"),
  onChainChange: (chain) => console.log("Chain changed:", chain),
  onTokenSelect: (token) => console.log("Token selected:", token),
  onSuccess: (tx) => console.log("Transaction initiated:", tx),
  onError: (error) => console.error("Error:", error),

  // Partner information
  partnerKey: "YOUR_PARTNER_KEY",
  partnerName: "Your App Name",
  referralAddress: "0xabcd...", // For fee sharing
});
```

For detailed widget documentation, see the [Widget Integration Guide](https://docs.hienluongbridge.com/widget).

## Common Integration Use Cases

### Dapp Integration for Asset Bridging

```typescript
import { Bridge, ChainId, TokenType } from "@hien-luong/sdk";

// Initialize Bridge module
const bridge = new Bridge({ signer });

// Bridge ERC20 token function
async function bridgeTokenToOptimism() {
  // Get quote first
  const quote = await bridge.getQuote({
    sourceChainId: ChainId.ETHEREUM,
    destinationChainId: ChainId.OPTIMISM,
    tokenAddress: "0x1234...",
    amount: ethers.utils.parseEther("10"),
  });

  console.log(`Estimated fee: ${ethers.utils.formatEther(quote.fee)} ETH`);
  console.log(`Estimated arrival time: ${quote.estimatedArrivalTime} seconds`);

  // Execute bridge transaction
  const tx = await bridge.bridgeToken({
    sourceChainId: ChainId.ETHEREUM,
    destinationChainId: ChainId.OPTIMISM,
    tokenAddress: "0x1234...",
    amount: ethers.utils.parseEther("10"),
    recipientAddress: await signer.getAddress(),
    tokenType: TokenType.ERC20,
  });

  const receipt = await tx.wait();

  // Track transaction
  bridge.on("transactionUpdate", (update) => {
    console.log(`Status: ${update.status}`);
    if (update.status === "completed") {
      console.log(`Tokens received on destination chain!`);
    }
  });

  bridge.monitorTransaction(receipt.transactionHash);
}
```

### NFT Marketplace with Cross-Chain Listings

```typescript
import { Bridge, ChainId, TokenType } from "@hien-luong/sdk";

// Initialize Bridge module
const bridge = new Bridge({ signer });

// Function to bridge an NFT to another chain for listing
async function bridgeNFTForListing(nftContract, tokenId, destinationChain) {
  // First approve the NFT transfer if needed
  const nftContractInstance = new ethers.Contract(
    nftContract,
    ["function approve(address to, uint256 tokenId)"],
    signer,
  );

  const bridgeAddress = await bridge.getContractAddress(ChainId.ETHEREUM);
  await nftContractInstance.approve(bridgeAddress, tokenId);

  // Bridge the NFT
  const tx = await bridge.bridgeToken({
    sourceChainId: ChainId.ETHEREUM,
    destinationChainId: destinationChain,
    tokenAddress: nftContract,
    tokenId: tokenId,
    recipientAddress: await signer.getAddress(),
    tokenType: TokenType.ERC721,
  });

  return await tx.wait();
}
```

### DeFi Protocol with Cross-Chain Liquidity

```typescript
import { Lending, ChainId } from "@hien-luong/sdk";

// Initialize Lending module
const lending = new Lending({ signer });

// Function to access cross-chain liquidity
async function borrowFromOptimism() {
  // First deposit collateral on Ethereum
  const depositTx = await lending.depositCollateral({
    chainId: ChainId.ETHEREUM,
    tokenAddress: "0xabcd...", // ETH or stablecoin
    amount: ethers.utils.parseEther("100"),
  });

  await depositTx.wait();

  // Then borrow on Optimism
  const borrowTx = await lending.borrowOnDestination({
    sourceChainId: ChainId.ETHEREUM,
    destinationChainId: ChainId.OPTIMISM,
    tokenAddress: "0x1234...", // Optimism stablecoin
    amount: ethers.utils.parseEther("50"),
  });

  return await borrowTx.wait();
}
```

## Event Tracking and Notifications

### Listening to Bridge Events

```typescript
// Set up event listeners
bridge.on("transactionSent", (event) => {
  console.log("Transaction sent on source chain:", event.transactionHash);
  notifyUser("Bridge transaction initiated");
});

bridge.on("transactionConfirmed", (event) => {
  console.log("Transaction confirmed on source chain:", event.transactionHash);
  notifyUser("Bridge transaction confirmed");
});

bridge.on("messageReceived", (event) => {
  console.log("Message received on destination chain:", event.transactionHash);
  notifyUser("Assets arriving on destination chain");
});

bridge.on("transactionCompleted", (event) => {
  console.log(
    "Transaction completed on destination chain:",
    event.transactionHash,
  );
  notifyUser("Assets received on destination chain!");
  updateUserInterface();
});

bridge.on("error", (error) => {
  console.error("Bridge error:", error);
  notifyUser("Error in bridge transaction", "error");
});
```

### Server-Side Notification Integration

```typescript
import { WebhookClient } from "@hien-luong/sdk";

// Server-side code to register webhooks
const webhookClient = new WebhookClient({
  apiKey: "YOUR_API_KEY",
  webhookSecret: "YOUR_WEBHOOK_SECRET",
  callbackUrl: "https://your-app.com/api/bridge-webhooks",
});

// Register webhook for user's transactions
async function registerUserWebhook(userId, userAddress) {
  await webhookClient.registerAddressWebhook({
    address: userAddress,
    events: [
      "transaction.sent",
      "transaction.confirmed",
      "transaction.completed",
    ],
    metadata: { userId },
  });
}

// Express route to handle webhooks
app.post("/api/bridge-webhooks", (req, res) => {
  // Verify webhook signature
  if (!webhookClient.verifySignature(req.headers["x-signature"], req.body)) {
    return res.status(401).send("Invalid signature");
  }

  const event = req.body;

  // Process the event
  switch (event.type) {
    case "transaction.completed":
      // Notify user that their assets have arrived
      notifyUserById(event.metadata.userId, "Assets received!");
      break;
    // Handle other events...
  }

  res.status(200).send("Webhook received");
});
```

## Gas Optimization

### Estimating Gas Costs

```typescript
// Get gas estimation for bridge transaction
const gasEstimation = await bridge.estimateGasCosts({
  sourceChainId: ChainId.ETHEREUM,
  destinationChainId: ChainId.OPTIMISM,
  tokenAddress: "0x1234...",
  amount: ethers.utils.parseEther("10"),
});

console.log(`Source chain gas: ${gasEstimation.sourceGas}`);
console.log(
  `LayerZero message fee: ${ethers.utils.formatEther(gasEstimation.messageFee)} ETH`,
);
console.log(`Destination chain gas: ${gasEstimation.destinationGas}`);
console.log(
  `Total estimated cost: ${ethers.utils.formatEther(gasEstimation.totalCost)} ETH`,
);
```

### Batching Transactions

```typescript
// Batch multiple token bridges into a single transaction
const batchTx = await bridge.batchBridgeTokens({
  sourceChainId: ChainId.ETHEREUM,
  destinationChainId: ChainId.OPTIMISM,
  recipientAddress: await signer.getAddress(),
  tokens: [
    { tokenAddress: "0x1111...", amount: ethers.utils.parseEther("10") },
    { tokenAddress: "0x2222...", amount: ethers.utils.parseEther("20") },
    { tokenAddress: "0x3333...", amount: ethers.utils.parseEther("30") },
  ],
});

await batchTx.wait();
```

## Security Best Practices

### Transaction Validation

Before submitting transactions, validate parameters:

```typescript
function validateBridgeParams(
  sourceChainId,
  destinationChainId,
  tokenAddress,
  amount,
) {
  // Check if chains are supported
  if (!bridge.isBridgeSupported(sourceChainId, destinationChainId)) {
    throw new Error("Bridge path not supported");
  }

  // Check if token is supported
  if (!bridge.isTokenSupported(sourceChainId, tokenAddress)) {
    throw new Error("Token not supported on source chain");
  }

  // Check minimum/maximum amount
  const token = bridge.getTokenInfo(sourceChainId, tokenAddress);
  if (amount.lt(token.minimumBridgeAmount)) {
    throw new Error(
      `Amount below minimum (${ethers.utils.formatUnits(token.minimumBridgeAmount, token.decimals)})`,
    );
  }

  if (amount.gt(token.maximumBridgeAmount)) {
    throw new Error(
      `Amount above maximum (${ethers.utils.formatUnits(token.maximumBridgeAmount, token.decimals)})`,
    );
  }
}
```

### Error Handling

Implement comprehensive error handling:

```typescript
try {
  const tx = await bridge.bridgeToken({
    sourceChainId: ChainId.ETHEREUM,
    destinationChainId: ChainId.OPTIMISM,
    tokenAddress: "0x1234...",
    amount: ethers.utils.parseEther("10"),
    recipientAddress: await signer.getAddress(),
  });

  await tx.wait();
} catch (error) {
  // Handle specific error types
  if (error.code === "BRIDGE_ERROR_INSUFFICIENT_ALLOWANCE") {
    // Handle token approval error
    showApprovalModal();
  } else if (error.code === "BRIDGE_ERROR_INSUFFICIENT_BALANCE") {
    // Handle insufficient balance
    showInsufficientBalanceError();
  } else if (error.code === "BRIDGE_ERROR_USER_REJECTED") {
    // User rejected in wallet
    console.log("User rejected transaction");
  } else if (error.code === "BRIDGE_ERROR_ESTIMATING_GAS") {
    // Gas estimation failed
    showGasEstimationError();
  } else {
    // Generic error handler
    console.error("Bridge error:", error);
    showGenericError(error.message);
  }
}
```

### Rate Limiting and DDoS Protection

For server-side integrations:

```typescript
import rateLimit from "express-rate-limit";

// Rate limit API endpoints
const apiLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  message: "Too many requests, please try again later",
});

// Apply to bridge-related API routes
app.use("/api/bridge", apiLimiter);
```

## Testing and Simulation

### Testnet Integration

For testing on testnets:

```typescript
import { HienLuongSDK, ChainId } from "@hien-luong/sdk";

// Testnet providers
const optimismSepoliaProvider = new ethers.providers.JsonRpcProvider(
  "https://optimism-sepolia.infura.io/v3/YOUR_KEY",
);
const arbitrumSepoliaProvider = new ethers.providers.JsonRpcProvider(
  "https://arbitrum-sepolia.infura.io/v3/YOUR_KEY",
);

// Initialize SDK for testnet
const testnetSdk = new HienLuongSDK({
  signer,
  defaultSourceChainId: ChainId.OPTIMISM_SEPOLIA,
  providers: {
    [ChainId.OPTIMISM_SEPOLIA]: optimismSepoliaProvider,
    [ChainId.ARBITRUM_SEPOLIA]: arbitrumSepoliaProvider,
  },
  isTestnet: true,
});

// Use test tokens
const testUSDC = {
  [ChainId.OPTIMISM_SEPOLIA]: "0xTestUSDC...",
  [ChainId.ARBITRUM_SEPOLIA]: "0xTestUSDC...",
};

// Bridge test tokens
async function testBridge() {
  const tx = await testnetSdk.bridge.bridgeToken({
    sourceChainId: ChainId.OPTIMISM_SEPOLIA,
    destinationChainId: ChainId.ARBITRUM_SEPOLIA,
    tokenAddress: testUSDC[ChainId.OPTIMISM_SEPOLIA],
    amount: ethers.utils.parseEther("10"),
    recipientAddress: await signer.getAddress(),
  });

  await tx.wait();
}
```

### Simulation Environment

The protocol provides a simulation environment:

```typescript
import { BridgeSimulator } from "@hien-luong/sdk";

// Create simulator
const simulator = new BridgeSimulator();

// Simulate bridge transaction
const simulation = await simulator.simulateBridge({
  sourceChainId: ChainId.ETHEREUM,
  destinationChainId: ChainId.OPTIMISM,
  tokenAddress: "0x1234...",
  amount: ethers.utils.parseEther("10"),
  recipientAddress: "0xabcd...",
});

// Review simulation results
console.log(`Simulated source transaction: ${simulation.sourceTx}`);
console.log(`Simulated destination transaction: ${simulation.destinationTx}`);
console.log(`Simulated fees: ${ethers.utils.formatEther(simulation.fees)} ETH`);
console.log(`Simulated execution time: ${simulation.estimatedTime} seconds`);
```

## Support and Resources

### Community Support

Join our developer community:

- [Discord Developer Channel](https://discord.gg/hienluongbridge-dev)
- [Developer Forum](https://forum.hienluongbridge.com/c/developers)
- [GitHub Discussions](https://github.com/Peace-Foundation/hien-luong-bridge/discussions)

### Documentation

Access comprehensive documentation:

- [SDK Documentation](../development/sdk_documentation.md)
- [API Reference](https://docs.hienluongbridge.com/api)
- [Smart Contract Reference](https://docs.hienluongbridge.com/contracts)

### Example Projects

Explore example integration projects:

- [React Integration Example](https://github.com/Peace-Foundation/bridge-react-example)
- [Next.js Integration](https://github.com/Peace-Foundation/bridge-nextjs-example)
- [Node.js Backend Integration](https://github.com/Peace-Foundation/bridge-nodejs-example)

## Conclusion

The Hiền Lương Bridge protocol provides flexible integration options for developers looking to add cross-chain functionality to their applications. Whether through the SDK, direct contract interaction, REST API, or widget integration, the protocol offers a seamless way to bridge assets and access cross-chain liquidity.

For additional support or custom integration assistance, contact the developer relations team at devrel@hienluongbridge.com.
