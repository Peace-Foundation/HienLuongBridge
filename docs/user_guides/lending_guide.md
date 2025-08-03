# Lending Protocol User Guide

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>How to Use the Cross-Chain Lending Protocol</h2>
</div>

## Introduction

The Hiền Lương Bridge Lending Protocol enables users to deposit assets on one blockchain and borrow against their collateral on another blockchain. This guide provides step-by-step instructions for using the cross-chain lending features.

## Prerequisites

Before using the lending protocol, ensure you have:

1. A Web3-enabled browser wallet (e.g., MetaMask, Trust Wallet)
2. Native tokens (ETH, MATIC, etc.) on the respective chains for gas fees
3. Tokens to deposit as collateral

## Supported Chains

The lending protocol currently supports the following blockchains:

### Mainnets

- Ethereum
- Optimism
- Arbitrum
- Polygon
- Avalanche

### Testnets

- Ethereum Sepolia
- Optimism Sepolia
- Arbitrum Sepolia
- Polygon Mumbai
- Avalanche Fuji

## Supported Assets

The following assets are currently supported for lending and borrowing:

- **Collateral Assets**: ETH, WBTC, USDC, USDT, DAI
- **Borrowable Assets**: USDC, USDT, DAI

## Key Concepts

### Source Pool vs. Destination Pool

- **Source Pool**: Where you deposit your collateral
- **Destination Pool**: Where you borrow assets against your collateral

### Collateralization Ratio

- The ratio between the value of your collateral and the value of your borrowed assets
- Example: A 150% collateralization ratio means you need $150 worth of collateral to borrow $100

### Liquidation Threshold

- The collateralization ratio at which your position becomes eligible for liquidation
- Example: A 120% liquidation threshold means your position can be liquidated if your collateralization ratio falls below 120%

### Interest Rates

- **Supply APY**: Annual interest earned on deposited assets
- **Borrow APY**: Annual interest paid on borrowed assets

## Using the Lending Protocol

### Step 1: Connect Your Wallet

1. Navigate to the Hiền Lương Bridge Lending application.
2. Click on the "Connect Wallet" button in the top-right corner.
3. Select your preferred wallet provider from the list.
4. Complete the connection process as prompted by your wallet.

![Connect Wallet](../images/lending_connect_wallet.png)

### Step 2: Deposit Collateral (Source Chain)

1. Select the "Deposit" tab in the lending interface.
2. Choose the source chain where you want to deposit collateral.
3. Select the asset you want to deposit from the dropdown menu.
4. Enter the amount you want to deposit.
5. Review the transaction details, including:
   - Current supply APY
   - Estimated collateral value
   - Potential borrowing power on destination chains

6. Click "Approve" to authorize the lending protocol to access your tokens (if this is your first time depositing this token).
7. After approval, click "Deposit" to complete the deposit.

![Deposit Collateral](../images/lending_deposit.png)

### Step 3: Borrow Assets (Destination Chain)

1. Select the "Borrow" tab in the lending interface.
2. Choose the destination chain where you want to borrow assets.
3. Select the asset you want to borrow from the dropdown menu.
4. Enter the amount you want to borrow (the interface will show your maximum available based on your collateral).
5. Review the transaction details, including:
   - Current borrow APY
   - Resulting collateralization ratio
   - Liquidation threshold
   - Estimated repayment schedule

6. Click "Borrow" to initiate the borrowing process.
7. Confirm the cross-chain message in your wallet.

![Borrow Assets](../images/lending_borrow.png)

### Step 4: Manage Your Position

After depositing and borrowing, you can manage your position through the "Dashboard" tab:

1. View all your active positions across different chains.
2. Monitor your collateralization ratios for each position.
3. View accrued interest on both deposits and loans.
4. Receive alerts when positions approach liquidation thresholds.

![Dashboard](../images/lending_dashboard.png)

### Step 5: Repay Loans

To repay your borrowed assets:

1. Select the "Repay" tab in the lending interface.
2. Choose the chain where you borrowed assets.
3. Select the loan you want to repay.
4. Enter the amount you want to repay (or click "Max" to repay the full amount).
5. Click "Approve" if repaying with the borrowed token.
6. After approval, click "Repay" to complete the repayment.

![Repay Loan](../images/lending_repay.png)

### Step 6: Withdraw Collateral

To withdraw your deposited collateral:

1. Select the "Withdraw" tab in the lending interface.
2. Choose the chain where you deposited collateral.
3. Select the asset you want to withdraw.
4. Enter the amount you want to withdraw (the interface will show your maximum available based on any outstanding loans).
5. Click "Withdraw" to initiate the withdrawal.

![Withdraw Collateral](../images/lending_withdraw.png)

## Advanced Features

### Cross-Chain Collateral Management

Manage collateral across multiple chains from a single interface:

1. From the "Dashboard," click on "Cross-Chain Management."
2. View your collateral distribution across all supported chains.
3. Rebalance collateral between chains by clicking "Rebalance."
4. Select the source and destination chains for rebalancing.
5. Enter the amount to rebalance.
6. Confirm the transaction.

### Flash Loans

Access instant, uncollateralized loans for a single transaction:

1. Select the "Flash Loan" tab in the lending interface.
2. Choose the chain for the flash loan.
3. Select the asset and enter the amount.
4. Enter the contract address that will utilize the flash loan.
5. Click "Execute" to initiate the flash loan.

### Interest Rate Swaps

Lock in fixed interest rates for your loans:

1. From the "Dashboard," select a variable rate loan.
2. Click "Convert to Fixed Rate."
3. Choose the fixed rate term (30, 60, or 90 days).
4. Review the fixed interest rate offered.
5. Confirm the conversion.

## Risk Management

### Monitoring Your Health Factor

The Health Factor is a key metric representing the safety of your position:

1. Health Factor = (Collateral Value × Liquidation Threshold) ÷ Borrowed Value
2. A Health Factor below 1.0 triggers liquidation
3. The interface color-codes your Health Factor:
   - Green: Safe (≥ 2.0)
   - Yellow: Caution (1.5 - 2.0)
   - Orange: Warning (1.1 - 1.5)
   - Red: Danger (< 1.1)

### Liquidation Process

If your position becomes undercollateralized:

1. Liquidators can repay part of your debt (up to 50%).
2. In exchange, they receive a portion of your collateral with a liquidation penalty (typically 5-10%).
3. You'll receive notifications when your position approaches liquidation.
4. To avoid liquidation, you can:
   - Repay part of your loan
   - Add more collateral
   - Use the emergency collateral addition feature

### Emergency Collateral Addition

If your position is at risk of liquidation:

1. From the "Dashboard," locate the at-risk position.
2. Click "Emergency Add Collateral."
3. Select the asset and amount to add as additional collateral.
4. Confirm the transaction with high priority.

## Fees and Rewards

### Fee Structure

The lending protocol includes the following fees:

1. **Origination Fee**: 0.1% of the borrowed amount, charged at loan origination
2. **Cross-Chain Message Fee**: Varies based on destination chain and current gas prices
3. **Liquidation Fee**: 5-10% of the liquidated collateral value

### Reward Programs

Participate in protocol reward programs:

1. **Deposit Rewards**: Earn additional yield on your deposits in protocol tokens
2. **Borrower Incentives**: Receive rewards for maintaining healthy positions
3. **Referral Program**: Earn rewards for referring new users to the protocol

Access rewards from the "Rewards" tab in the interface.

## Security Features

### Collateral Security

Your collateral is protected by multiple security measures:

1. Multi-signature contracts requiring multiple approvals for critical operations
2. Regular security audits by leading blockchain security firms
3. Insurance coverage for protocol funds
4. Time-locked contract upgrades

### Chainlink Oracle Integration

Price feeds are secured through:

1. Decentralized Chainlink oracle network
2. Multiple independent price sources
3. Time-weighted average pricing to prevent manipulation
4. Heartbeat checks to ensure price freshness

## Troubleshooting

### Common Issues

#### Transaction Pending for Too Long

If your lending transaction has been pending for an extended period:

1. Check the status in your wallet
2. Verify that you have sufficient gas on the respective chain
3. Consider cancelling and resubmitting with higher gas if network is congested

#### Cannot Borrow Maximum Amount

If you cannot borrow the expected amount:

1. Check the current oracle prices for your collateral
2. Verify the utilization rate of the lending pool
3. Check if any borrowing caps are in place

#### Cross-Chain Message Delays

If cross-chain operations are delayed:

1. Check the LayerZero explorer for message status
2. Verify that both chains are functioning normally
3. Wait for the estimated cross-chain message delivery time
4. Contact support if delays exceed 30 minutes

### Support Resources

If you encounter any issues while using the lending protocol:

- Check the [FAQ page](../faq.md)
- Visit our community Discord server
- Submit a support ticket through the interface
- Email lending-support@hienluongbridge.com

## Integration APIs

For developers looking to integrate with the lending protocol:

- See the [SDK Documentation](../development/sdk_documentation.md)
- Review the [Lending Integration Guide](../integration/lending_integration.md)
- Check the [API Reference](https://docs.hienluongbridge.com/lending/api)

## Risk Disclaimer

Using the lending protocol involves financial risks:

1. **Market Risk**: Collateral value fluctuations may lead to liquidation
2. **Smart Contract Risk**: Despite audits, smart contracts may contain undiscovered vulnerabilities
3. **Oracle Risk**: Price feed disruptions could affect liquidation processes
4. **Cross-Chain Risk**: Delays or failures in cross-chain messaging could impact operations

Please ensure you understand these risks before using the protocol.

## Conclusion

The Hiền Lương Bridge Lending Protocol provides a powerful way to access liquidity across multiple blockchains. By following this guide, you can confidently use the protocol to deposit collateral and borrow assets across chains.

For further assistance or feature requests, join our community channels or contact our support team.
