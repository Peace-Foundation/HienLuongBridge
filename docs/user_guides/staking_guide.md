# Staking Protocol User Guide

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>How to Participate in Protocol Staking</h2>
</div>

## Introduction

The Hiền Lương Bridge Staking Protocol allows users to stake their HLB tokens to earn rewards and participate in protocol governance. This guide provides step-by-step instructions for using the staking features.

## Prerequisites

Before using the staking protocol, ensure you have:

1. A Web3-enabled browser wallet (e.g., MetaMask, Trust Wallet)
2. Native tokens (ETH, MATIC, etc.) on the respective chains for gas fees
3. HLB tokens to stake

## Supported Chains

The staking protocol is currently available on:

### Mainnets

- Ethereum
- Optimism
- Arbitrum

### Testnets

- Ethereum Sepolia
- Optimism Sepolia
- Arbitrum Sepolia

## Key Concepts

### HLB Token

- **HLB**: The native governance token of the Hiền Lương Bridge protocol
- **Total Supply**: 100,000,000 HLB
- **Utility**: Governance voting, fee sharing, staking rewards

### Staking Mechanisms

- **Single-Chain Staking**: Stake HLB on a single chain
- **Cross-Chain Staking**: Stake HLB on one chain and claim rewards on another
- **Liquid Staking**: Receive stHLB tokens representing your staked HLB

### Reward Structure

- **Base Rewards**: Fixed APY for staking (currently 5-10%)
- **Protocol Fees**: Share of bridge and lending protocol fees (variable)
- **Bonus Rewards**: Additional rewards for governance participation

### Governance Power

- **Voting Rights**: Proportional to your staked HLB amount
- **Proposal Creation**: Requires minimum stake (currently 10,000 HLB)
- **Delegation**: Option to delegate voting power to other addresses

## Using the Staking Protocol

### Step 1: Connect Your Wallet

1. Navigate to the Hiền Lương Bridge Staking application.
2. Click on the "Connect Wallet" button in the top-right corner.
3. Select your preferred wallet provider from the list.
4. Complete the connection process as prompted by your wallet.

![Connect Wallet](../images/staking_connect_wallet.png)

### Step 2: Stake HLB Tokens

1. Select the "Stake" tab in the staking interface.
2. Choose the chain where you want to stake your HLB tokens.
3. Enter the amount of HLB you want to stake.
4. Select the staking duration (flexible, 30 days, 90 days, or 180 days).
5. Review the staking details, including:
   - Expected APY
   - Lock-up period
   - Estimated rewards
   - Governance power gained

6. Click "Approve" to authorize the staking contract to access your HLB tokens (if this is your first time staking).
7. After approval, click "Stake" to complete the staking process.

![Stake Tokens](../images/staking_stake.png)

### Step 3: Choose Staking Options

After initiating staking, you'll be presented with additional options:

1. **Receive Liquid Staking Tokens**: Toggle to receive stHLB tokens representing your stake
2. **Auto-Compound Rewards**: Toggle to automatically reinvest earned rewards
3. **Cross-Chain Rewards**: Select destination chains for claiming rewards
4. **Boost Options**: Select additional boost parameters (if eligible)

Make your selections and click "Confirm" to finalize your staking preferences.

![Staking Options](../images/staking_options.png)

### Step 4: Monitor Your Staked Position

After staking, you can monitor your position through the "Dashboard" tab:

1. View your total staked amount across all chains.
2. Track accumulated rewards in real-time.
3. See your current governance power and voting rights.
4. Monitor remaining lock-up periods for time-locked stakes.

![Staking Dashboard](../images/staking_dashboard.png)

### Step 5: Claim Rewards

To claim your staking rewards:

1. Select the "Rewards" tab in the staking interface.
2. View available rewards across different chains.
3. Select which rewards you want to claim.
4. Choose the destination chain for receiving rewards.
5. Click "Claim" to initiate the reward claim.
6. Confirm the transaction in your wallet.

![Claim Rewards](../images/staking_claim_rewards.png)

### Step 6: Unstake Tokens

To unstake your HLB tokens:

1. Select the "Unstake" tab in the staking interface.
2. Choose the staking position you want to unstake.
3. Enter the amount you want to unstake (partial or full).
4. Review any applicable early withdrawal penalties (if unstaking before lock-up period ends).
5. Click "Unstake" to initiate the unstaking process.
6. If using time-locked staking, initiate the unstaking cooldown period.
7. After the cooldown period (if applicable), return to claim your unstaked tokens.

![Unstake Tokens](../images/staking_unstake.png)

## Advanced Staking Features

### Liquid Staking with stHLB

When you choose liquid staking, you receive stHLB tokens representing your staked position:

1. stHLB tokens are transferable and can be used in DeFi protocols.
2. The stHLB/HLB exchange rate increases over time as rewards accrue.
3. To use liquid staking:
   - Select "Receive stHLB" when staking
   - Your stHLB balance will appear in your wallet
   - You can trade or use stHLB while maintaining staking rewards

### Boost Multipliers

Increase your staking rewards with boost multipliers:

1. **Lock-up Boost**: Longer lock-up periods provide higher APY
   - 30 days: 1.2x multiplier
   - 90 days: 1.5x multiplier
   - 180 days: 2.0x multiplier

2. **Activity Boost**: Active protocol usage increases rewards
   - Bridge user: +0.1x multiplier
   - Lending user: +0.2x multiplier
   - Both: +0.3x multiplier

3. **Governance Boost**: Governance participation increases rewards
   - Vote on proposals: +0.1x multiplier
   - Create proposals: +0.2x multiplier

### Cross-Chain Staking

Stake on one chain and receive benefits across multiple chains:

1. From the "Advanced" tab, select "Cross-Chain Staking"
2. Choose your source chain for staking
3. Select destination chains for rewards distribution
4. Set percentage allocations for each destination chain
5. Confirm your cross-chain staking configuration

### Delegation

Delegate your governance voting rights while maintaining staking rewards:

1. From the "Governance" tab, select "Delegate"
2. Enter the address of your chosen delegate
3. Select whether to delegate all or partial voting power
4. Confirm the delegation transaction
5. You can change or revoke delegation at any time

## Governance Participation

### Viewing Proposals

To view active governance proposals:

1. Select the "Governance" tab in the staking interface
2. Browse active, pending, and completed proposals
3. Click on any proposal to view details:
   - Proposal description
   - Voting options
   - Current voting results
   - Voting deadline
   - Implementation timeline

![Governance Proposals](../images/staking_governance.png)

### Voting on Proposals

To vote on active proposals:

1. From the proposal details page, select your voting position
2. Choose your vote: "For," "Against," or "Abstain"
3. Review your voting power being used
4. Click "Vote" to submit your vote
5. Confirm the transaction in your wallet

### Creating Proposals

To create a new governance proposal:

1. From the "Governance" tab, click "Create Proposal"
2. Verify you meet the minimum staking requirement (10,000 HLB)
3. Fill in the proposal details:
   - Title
   - Description
   - Actions to be executed if approved
   - Voting period
   - Implementation delay
4. Submit your proposal for review
5. After review, your proposal will be published for voting

## Rewards and Fee Sharing

### Types of Rewards

The staking protocol distributes several types of rewards:

1. **Base Staking Rewards**: Fixed emission of HLB tokens
2. **Protocol Fee Sharing**: Percentage of bridge and lending fees
   - Bridge fees: 50% to stakers
   - Lending fees: 50% to stakers
3. **Special Incentives**: Temporary boost periods and events

### Reward Distribution Schedule

Rewards are distributed on the following schedule:

1. **Base Rewards**: Continuously accrued, claimable anytime
2. **Protocol Fees**: Distributed weekly
3. **Governance Rewards**: Distributed after proposal execution

### Reward Calculation Formula

The reward calculation is based on:

1. Your staked amount
2. Staking duration
3. Applied boost multipliers
4. Total protocol fees collected
5. Total staked HLB in the protocol

The formula is:

```
Your Reward = (Your Staked HLB / Total Staked HLB) × Total Rewards × Your Boost Multiplier
```

## Security Features

### Timelock Mechanisms

The staking protocol includes several timelock mechanisms for security:

1. **Unstaking Cooldown**: 1-7 days depending on stake duration
2. **Emergency Withdrawal**: Available with penalty in case of critical issues
3. **Governance Implementation Delay**: 48 hours between approval and execution

### Multi-Signature Control

Critical protocol parameters are controlled by a multi-signature wallet:

1. Requires 4-of-7 signatures to execute changes
2. Signers include team members and community representatives
3. All parameter changes are proposed through governance

### Audit Status

The staking protocol has undergone security audits:

1. Smart contracts audited by [Audit Firm Name]
2. Economic model reviewed by [Economic Research Firm]
3. Regular internal security reviews
4. Bug bounty program active

## Troubleshooting

### Common Issues

#### Staking Transaction Fails

If your staking transaction fails:

1. Verify you have sufficient HLB tokens and gas
2. Check if there is a minimum staking amount (currently 100 HLB)
3. Try with a smaller amount if staking a large position
4. Refresh the page and try again

#### Rewards Not Appearing

If your rewards are not appearing:

1. Check if the rewards distribution period has passed
2. Verify that your stake has been active for at least 24 hours
3. Check if rewards are available on a different chain
4. Contact support if rewards are still missing after 7 days

#### Cannot Vote on Governance

If you cannot vote on governance proposals:

1. Verify you have sufficient staked HLB
2. Check if the proposal is still in the voting period
3. Ensure you haven't already voted on the proposal
4. Check if you've delegated your voting rights

### Support Resources

If you encounter any issues while using the staking protocol:

- Check the [FAQ page](../faq.md)
- Visit our community Discord server
- Submit a support ticket through the interface
- Email staking-support@hienluongbridge.com

## Staking Risks

### Risk Factors

Be aware of the following risks when staking:

1. **Smart Contract Risk**: Despite audits, smart contracts may contain vulnerabilities
2. **Lock-up Risk**: Time-locked stakes cannot be withdrawn early without penalties
3. **Governance Risk**: Protocol parameters may change through governance votes
4. **Market Risk**: HLB token value fluctuations affect the value of staking rewards

### Risk Mitigation

The protocol implements several risk mitigation strategies:

1. Regular security audits and code reviews
2. Insurance coverage for smart contract risks
3. Emergency pause mechanisms for critical issues
4. Gradual parameter change limits in governance

## Conclusion

The Hiền Lương Bridge Staking Protocol provides an opportunity to earn rewards while contributing to the security and governance of the protocol. By following this guide, you can confidently stake your HLB tokens and participate in the protocol's ecosystem.

For further assistance or feature requests, join our community channels or contact our support team.
