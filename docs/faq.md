# Frequently Asked Questions

<div align="center">
  <img src="../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>Hiền Lương Bridge FAQ</h2>
</div>

## General Questions

### What is Hiền Lương Bridge?

Hiền Lương Bridge is a comprehensive cross-chain protocol built on LayerZero that enables seamless asset transfer and interoperability across multiple blockchain networks. Named after the historic bridge that once connected North and South Vietnam, our protocol symbolizes connection and unity in the fragmented blockchain landscape.

### What blockchain networks does Hiền Lương Bridge support?

Hiền Lương Bridge currently supports the following networks:

**Mainnets:**

- Ethereum
- Optimism
- Arbitrum
- Polygon
- Avalanche
- BNB Chain
- Base

**Testnets:**

- Ethereum Sepolia
- Optimism Sepolia
- Arbitrum Sepolia
- Polygon Mumbai
- Avalanche Fuji
- BNB Testnet
- Base Sepolia

We are continuously adding support for more networks based on community demand and technical feasibility.

### How does Hiền Lương Bridge differ from other cross-chain bridges?

Hiền Lương Bridge offers several unique advantages:

1. **Comprehensive Protocol**: Combines bridging, lending, and staking in a unified protocol
2. **LayerZero Integration**: Built on LayerZero's secure and reliable cross-chain messaging protocol
3. **Multiple Token Types**: Supports both fungible (ERC20) and non-fungible tokens (ERC721)
4. **Cross-Chain Lending**: Allows users to deposit assets on one chain and borrow on another
5. **Enhanced Security**: Multiple security layers including oracles, validators, and timelock mechanisms
6. **Privacy Features**: Optional transaction shielding and zero-knowledge proofs
7. **User-Friendly Interface**: Intuitive design for both novice and experienced users

### Who is behind Hiền Lương Bridge?

Hiền Lương Bridge is developed by Peace Foundation, a team of blockchain developers, researchers, and financial experts dedicated to building interoperable blockchain infrastructure. The team has extensive experience in blockchain development, cryptography, and decentralized finance.

## Bridge Functionality

### How do I bridge tokens using Hiền Lương Bridge?

To bridge tokens:

1. Connect your wallet to the [Hiền Lương Bridge app](https://app.hienluongbridge.com)
2. Select source and destination chains
3. Choose the token and amount to bridge
4. Approve the token (if needed)
5. Confirm the bridge transaction in your wallet
6. Wait for the transaction to complete

For detailed instructions, see our [Bridge User Guide](./user_guides/bridge_guide.md).

### How long does a bridge transaction take?

Bridge transaction times vary based on:

1. Source chain congestion (for transaction confirmation)
2. LayerZero message delivery time (typically 1-5 minutes)
3. Destination chain congestion

On average, bridging transactions complete in 3-10 minutes. For time-sensitive transfers, you can use "Fast Mode" which prioritizes your transaction for an additional fee.

### What are the fees for bridging tokens?

Bridging fees consist of:

1. **Protocol Fee**: 0.1% of the transaction value (minimum $0.50 USD)
2. **LayerZero Message Fee**: Varies based on destination chain and current gas prices
3. **Gas Fees**: Standard network transaction fees on both source and destination chains

You can see the exact fee breakdown before confirming any transaction.

### Is there a minimum or maximum amount I can bridge?

Yes, bridging limits vary by token:

- **Minimum**: Typically equivalent to $10 USD (varies by token)
- **Maximum**: Up to $1,000,000 USD equivalent (varies by token and chain)
- **Daily Limits**: Some tokens have daily bridging limits for security reasons

### What happens if my bridge transaction fails?

If a bridge transaction fails:

1. On the source chain: Your tokens remain in your wallet (minus gas fees)
2. During cross-chain message delivery: Our monitoring system will detect the failure and retry the delivery
3. On the destination chain: The transaction will be retried automatically

If your transaction remains stuck for more than 30 minutes, please contact our support team.

### Can I bridge NFTs (non-fungible tokens)?

Yes, Hiền Lương Bridge supports bridging of ERC721 NFTs across supported chains. The process is similar to bridging fungible tokens, but you'll need to select the NFT and its token ID instead of an amount.

## Lending Functionality

### How does cross-chain lending work?

Cross-chain lending allows you to:

1. Deposit collateral assets on one blockchain (source chain)
2. Borrow assets on another blockchain (destination chain)
3. Repay loans on the destination chain
4. Withdraw collateral from the source chain

This enables capital efficiency across multiple blockchains without needing to bridge assets each time.

### What are the supported assets for lending?

Currently supported assets:

**Collateral Assets:**

- ETH/WETH
- WBTC
- USDC
- USDT
- DAI

**Borrowable Assets:**

- USDC
- USDT
- DAI

We continually add support for additional assets based on community governance decisions.

### What are the interest rates for lending and borrowing?

Interest rates are dynamic and based on utilization rates:

1. **Supply APY**: Currently ranges from 1-5% for stablecoins and 0.1-2% for volatile assets
2. **Borrow APY**: Currently ranges from 3-12% for stablecoins and 2-8% for volatile assets

Rates are updated in real-time and can be viewed in the lending interface.

### What is the collateralization ratio and liquidation threshold?

**Collateralization Ratio**: The ratio between your collateral value and borrowed amount

**Liquidation Thresholds** by asset type:

- Stablecoins: 110-120%
- ETH/WBTC: 130-150%
- Other volatile assets: 150-200%

If your collateralization ratio falls below the liquidation threshold, your position may be partially liquidated to restore a healthy ratio.

## Staking Functionality

### What is HLB token staking?

HLB token staking allows you to:

1. Lock your HLB tokens in the protocol
2. Earn rewards from protocol fees and token emissions
3. Participate in protocol governance
4. Receive boosted rewards based on staking duration and activity

### What are the rewards for staking?

Staking rewards include:

1. **Base Rewards**: Currently 5-10% APY in HLB tokens
2. **Protocol Fee Share**: 50% of bridge and lending fees distributed to stakers
3. **Boosted Rewards**: Additional rewards based on lock-up duration and governance participation

### How long do I need to stake my tokens?

Staking options include:

1. **Flexible Staking**: No lock-up, but lower rewards
2. **30-Day Staking**: 30-day lock-up with 1.2x reward multiplier
3. **90-Day Staking**: 90-day lock-up with 1.5x reward multiplier
4. **180-Day Staking**: 180-day lock-up with 2.0x reward multiplier

### Can I participate in governance without staking?

While all HLB holders can view proposals and participate in discussions, voting requires staking your HLB tokens or delegating your voting power to a staker.

## Security

### How secure is the Hiền Lương Bridge protocol?

Hiền Lương Bridge employs multiple security measures:

1. **Smart Contract Audits**: Contracts audited by leading security firms
2. **Multi-Signature Control**: Critical functions require multiple approvals
3. **Timelocks**: Parameter changes subject to timelock delays
4. **Security Council**: Emergency response team for incident management
5. **Bug Bounty Program**: Rewards for responsibly disclosed vulnerabilities
6. **Insurance Coverage**: Protection against potential exploits
7. **Open Source Codebase**: Transparent code available for community review

### Has the protocol been audited?

Yes, Hiền Lương Bridge has been audited by multiple security firms. Audit reports are available in our [Security documentation](./security/audit_reports.md).

### What happens if there's a security incident?

In case of a security incident:

1. The Security Council can pause affected functions
2. Users will be notified via all communication channels
3. The technical team will investigate and develop a fix
4. After thorough testing, the fix will be implemented
5. Operations will resume once security is confirmed
6. A post-mortem report will be published

### Is there insurance for funds in the protocol?

Yes, we have partnered with DeFi insurance providers to offer coverage for funds in the protocol. Users can purchase additional coverage through these partners if desired.

## Technical Questions

### What is LayerZero and how does it relate to Hiền Lương Bridge?

LayerZero is an omnichain interoperability protocol that enables trustless cross-chain messaging. Hiền Lương Bridge is built on LayerZero's OApp framework, utilizing its secure messaging infrastructure to enable cross-chain asset transfers and functionality.

### How does the bridge handle different token standards?

The bridge handles different token standards through specialized adapters:

1. **ERC20 Tokens**: Uses the OFT (Omnichain Fungible Token) standard
2. **ERC721 Tokens**: Uses the ONFT (Omnichain Non-Fungible Token) standard

Each adapter implements the necessary logic for locking, minting, burning, and releasing tokens across chains.

### What happens to my tokens when I bridge them?

When bridging tokens:

1. **Native Tokens (on source chain)**: Locked in the bridge contract
2. **Wrapped Tokens (on destination chain)**: Minted as wrapped versions of the original

When bridging back:

1. **Wrapped Tokens**: Burned on the destination chain
2. **Native Tokens**: Released from the bridge contract on the source chain

### Are there any known limitations or edge cases?

Current limitations include:

1. **Complex NFTs**: Some NFTs with complex metadata or functionality may not bridge correctly
2. **Rebasing Tokens**: Tokens that rebase may not maintain the same value across chains
3. **Blacklisted Addresses**: Addresses blacklisted by token contracts cannot receive bridged tokens
4. **Gas Token Bridging**: Native gas tokens (like ETH) must be wrapped before bridging

We're continuously working to address these limitations.

## Privacy Features

### What privacy features does Hiền Lương Bridge offer?

Privacy features include:

1. **Transaction Shielding**: Obscures transaction details from block explorers
2. **Address Obfuscation**: Prevents linking addresses across chains
3. **Zero-Knowledge Proofs**: For privacy-preserving verification (on selected chains)
4. **Mixer Integration**: Optional integration with privacy mixers

### How do I use the privacy features?

To use privacy features:

1. Select "Privacy Mode" when initiating a bridge transaction
2. Choose your desired privacy level
3. Follow the additional steps for your selected privacy features
4. Note that privacy transactions may incur additional fees

See our [Privacy documentation](./privacy.md) for details.

## Troubleshooting

### My transaction has been pending for a long time. What should I do?

If your transaction is pending:

1. Check the transaction status on the [Bridge History page](https://app.hienluongbridge.com/history)
2. Verify that the source transaction is confirmed on the blockchain
3. Check the [Status Page](https://status.hienluongbridge.com) for any protocol issues
4. If pending for more than 30 minutes, contact support with your transaction hash

### I don't see my bridged tokens in my wallet. What should I do?

If you don't see your tokens:

1. Check if you need to add the token to your wallet manually
   - In MetaMask: Click "Import tokens" and enter the contract address
2. Verify the transaction status in the bridge history
3. Confirm that you're looking at the correct network in your wallet
4. If the transaction shows as completed but tokens aren't visible, contact support

### The app shows an error when I try to bridge. What does it mean?

Common errors and solutions:

1. **Insufficient Allowance**: Approve the token first
2. **Insufficient Balance**: Check that you have enough tokens and gas
3. **Price Impact Too High**: Try bridging a smaller amount
4. **Unsupported Token**: Verify the token is supported on both chains
5. **Network Error**: Check your internet connection and retry

For persistent errors, please contact support with a screenshot.

## Business and Partnership

### How can I integrate Hiền Lương Bridge into my application?

To integrate with Hiền Lương Bridge:

1. Review our [Integration Guide](./integration/overview.md)
2. Choose your integration method (SDK, API, or Widget)
3. Register for API keys on our [Developer Portal](https://developers.hienluongbridge.com)
4. Follow the integration steps for your chosen method
5. Test your integration on testnet before going live

For custom integration support, contact our developer relations team.

### Does Hiền Lương Bridge have a partnership program?

Yes, we offer partnership opportunities including:

1. **Integration Partnerships**: For applications integrating the bridge
2. **Liquidity Partnerships**: For protocols providing liquidity
3. **Referral Program**: Fee sharing for user referrals

Contact partnerships@hienluongbridge.com for details.

### How can I list my token on Hiền Lương Bridge?

To list your token:

1. Submit a token listing request on our [website](https://hienluongbridge.com/list-token)
2. Provide token contract addresses on relevant chains
3. Submit required documentation and security audits
4. If approved, the token will be added through governance

## Additional Resources

### Where can I find more information about Hiền Lương Bridge?

- [Documentation Hub](https://docs.hienluongbridge.com)
- [GitHub Repository](https://github.com/Peace-Foundation/hien-luong-bridge)
- [Medium Blog](https://medium.com/hienluongbridge)
- [YouTube Tutorials](https://youtube.com/hienluongbridge)

### How can I get support?

For support:

- [Discord Community](https://discord.gg/hienluongbridge)
- [Telegram Group](https://t.me/hienluongbridge)
- [Support Ticket](https://support.hienluongbridge.com)
- Email: support@hienluongbridge.com

### How can I contribute to the protocol?

Ways to contribute:

1. **Code Contributions**: Submit pull requests on GitHub
2. **Governance Participation**: Vote on protocol proposals
3. **Bug Reports**: Report issues through our bug bounty program
4. **Documentation**: Help improve documentation
5. **Community Support**: Help answer questions in community channels

See our [Contribution Guide](https://github.com/Peace-Foundation/hien-luong-bridge/blob/main/CONTRIBUTING.md) for details.

### Where can I find the latest announcements and updates?

Stay updated through:

- [Twitter](https://twitter.com/HienLuongBridge)
- [Discord Announcements](https://discord.gg/hienluongbridge)
- [Newsletter](https://hienluongbridge.com/newsletter)
- [Governance Forum](https://forum.hienluongbridge.com)
