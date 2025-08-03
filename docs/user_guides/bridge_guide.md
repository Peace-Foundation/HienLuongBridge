# Bridge User Guide

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>How to Use the Hiền Lương Bridge</h2>
</div>

## Introduction

This guide provides step-by-step instructions for using the Hiền Lương Bridge to transfer assets between different blockchain networks. The bridge supports both fungible tokens (ERC20) and non-fungible tokens (ERC721).

## Prerequisites

Before using the Hiền Lương Bridge, ensure you have:

1. A Web3-enabled browser wallet (e.g., MetaMask, Trust Wallet)
2. Native tokens (ETH, MATIC, etc.) on the source chain for gas fees
3. Tokens you wish to bridge on the source chain

## Supported Chains

The Hiền Lương Bridge currently supports the following blockchains:

### Mainnets

- Ethereum
- Optimism
- Arbitrum
- Polygon
- Avalanche
- BNB Chain
- Base

### Testnets

- Ethereum Sepolia
- Optimism Sepolia
- Arbitrum Sepolia
- Polygon Mumbai
- Avalanche Fuji
- BNB Testnet
- Base Sepolia

## Bridging Tokens

### Step 1: Connect Your Wallet

1. Navigate to the Hiền Lương Bridge application.
2. Click on the "Connect Wallet" button in the top-right corner.
3. Select your preferred wallet provider from the list.
4. Complete the connection process as prompted by your wallet.

![Connect Wallet](../images/connect_wallet.png)

### Step 2: Select Source and Destination Chains

1. From the dropdown menu labeled "Source Chain," select the blockchain network where your tokens are currently located.
2. From the dropdown menu labeled "Destination Chain," select the blockchain network where you want to send your tokens.

![Select Chains](../images/select_chains.png)

### Step 3: Select Token Type

1. Choose the type of token you want to bridge:
   - **Fungible Token (ERC20)**: For cryptocurrencies and other divisible tokens
   - **Non-Fungible Token (ERC721)**: For NFTs and other unique digital assets

![Select Token Type](../images/select_token_type.png)

### Step 4A: Bridging Fungible Tokens (ERC20)

1. Select the token you want to bridge from the dropdown menu, or paste the token contract address if it's not listed.
2. Enter the amount you want to bridge in the "Amount" field.
3. Verify the recipient address in the "Recipient" field (by default, this is your connected wallet address).
4. Review the transaction details, including:
   - Bridge fee
   - LayerZero message fee
   - Estimated arrival time

5. Click "Approve" to authorize the bridge to access your tokens (if this is your first time bridging this token).
6. After approval, click "Bridge" to initiate the transfer.

![Bridge ERC20](../images/bridge_erc20.png)

### Step 4B: Bridging Non-Fungible Tokens (ERC721)

1. Enter the NFT contract address or select it from the dropdown menu if it's a popular collection.
2. Enter the token ID of the NFT you want to bridge.
3. Verify the recipient address in the "Recipient" field (by default, this is your connected wallet address).
4. Review the transaction details, including:
   - Bridge fee
   - LayerZero message fee
   - Estimated arrival time

5. Click "Approve" to authorize the bridge to access your NFT (if this is your first time bridging from this collection).
6. After approval, click "Bridge" to initiate the transfer.

![Bridge ERC721](../images/bridge_erc721.png)

### Step 5: Confirm the Transaction

1. Your wallet will prompt you to confirm the transaction.
2. Review the gas fees and transaction details in your wallet.
3. Confirm the transaction.

![Confirm Transaction](../images/confirm_transaction.png)

### Step 6: Track Your Transfer

1. After confirming the transaction, you'll see a progress indicator showing the status of your bridge transfer.
2. You can track the transfer status using the provided transaction ID.
3. Once the transfer is complete, you will receive a confirmation notification.

![Track Transfer](../images/track_transfer.png)

## Advanced Features

### Fast Mode

For supported chains, Fast Mode allows for quicker transfers at a higher fee:

1. In the bridge interface, toggle the "Fast Mode" option.
2. Note the increased fee and reduced estimated arrival time.
3. Proceed with the bridge process as usual.

### Batch Transfers

To transfer multiple tokens in a single transaction:

1. Click on the "Batch" option in the bridge interface.
2. Add multiple tokens and their respective amounts.
3. Review the total fees and details.
4. Proceed with approval and bridging as usual.

### Bridge History

To view your previous bridge transactions:

1. Click on the "History" tab in the navigation menu.
2. View all your past and pending bridge transactions.
3. Click on any transaction to see detailed information including:
   - Source and destination chains
   - Token details
   - Transaction hashes on both chains
   - Status and timestamps

![Bridge History](../images/bridge_history.png)

## Fees and Limits

### Fee Structure

Hiền Lương Bridge fees consist of two components:

1. **Protocol Fee**: 0.1% of the transaction value (minimum $0.50 USD)
2. **LayerZero Message Fee**: Varies based on destination chain and current gas prices

For NFTs, a fixed fee applies instead of a percentage.

### Bridging Limits

The following limits apply to bridge transactions:

- **Minimum Amount**: Varies by token, typically equivalent to $10 USD
- **Maximum Amount**: Varies by token and chain, typically up to $1,000,000 USD equivalent
- **Daily Limit**: Applies to some tokens for security reasons

## Security Features

### Transaction Verification

Every bridge transaction goes through multiple verification steps:

1. Source chain contract verification
2. LayerZero message verification
3. Destination chain verification

### Proof of Transfer

For each bridge transaction, you can view and download a proof of transfer that includes:

1. Source transaction hash
2. LayerZero message proof
3. Destination transaction hash

### Emergency Stop

In case of suspicious activity or technical issues, transactions can be temporarily paused using the emergency stop feature, which can be activated by the protocol's governance.

## Troubleshooting

### Common Issues

#### Transaction Pending for Too Long

If your transaction has been pending for an extended period:

1. Check the status on the bridge history page
2. Verify that the source transaction was confirmed
3. Check if there are any known issues with the destination chain
4. Contact support if the issue persists after 60 minutes

#### Failed Transactions

If your transaction failed:

1. Check if you had sufficient gas on the source chain
2. Verify that you approved the correct token amount
3. Check for any token transfer restrictions
4. Retry the transaction or contact support

#### Token Not Showing on Destination Chain

If you don't see your tokens after a successful bridge:

1. Check if you need to add the token to your wallet manually
2. Verify the transaction status in the bridge history
3. Wait for the estimated arrival time to pass
4. Contact support if tokens don't appear after the estimated time

### Support Resources

If you encounter any issues while using the Hiền Lương Bridge:

- Check the [FAQ page](../faq.md)
- Visit our community Discord server
- Submit a support ticket through the bridge interface
- Email support at support@hienluongbridge.com

## Bridge APIs and Integration

For developers looking to integrate with the Hiền Lương Bridge:

- See the [SDK Documentation](../development/sdk_documentation.md)
- Review the [Integration Guide](../integration/bridge_integration.md)
- Check the [API Reference](https://docs.hienluongbridge.com/api)

## Privacy Considerations

The Hiền Lương Bridge offers enhanced privacy features:

- Optional transaction shielding
- Address obfuscation on public explorers
- Zero-knowledge proof verification (available on selected chains)

See the [Privacy documentation](../privacy.md) for more details.

## Conclusion

The Hiền Lương Bridge provides a secure, efficient way to transfer assets between blockchain networks. By following this guide, you can confidently use the bridge to move your tokens across the supported chains.

For further assistance or feature requests, join our community channels or contact our support team.
