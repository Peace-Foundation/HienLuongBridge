# Governance Guide

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>How to Participate in Protocol Governance</h2>
</div>

## Introduction

The Hiền Lương Bridge protocol is governed by its community through a decentralized governance system. This guide explains how the governance process works and how token holders can participate in decision-making.

## Governance Overview

The governance system for Hiền Lương Bridge is designed to:

1. Enable community-driven decision making
2. Ensure protocol security and stability
3. Facilitate continuous improvement and adaptation
4. Maintain decentralization and censorship resistance

## Governance Token: HLB

### Token Utility

The HLB token serves as the primary governance token for the Hiền Lương Bridge protocol:

1. **Voting Rights**: Each HLB token represents one vote in governance decisions
2. **Proposal Creation**: Holders can create proposals with sufficient HLB
3. **Fee Sharing**: HLB stakers receive a share of protocol fees
4. **Protocol Access**: Some advanced features require HLB holdings

### Token Distribution

The initial distribution of the 100,000,000 HLB tokens is as follows:

- **Community Treasury**: 30% (30,000,000 HLB)
- **Team and Advisors**: 20% (20,000,000 HLB) - 4-year vesting
- **Protocol Incentives**: 25% (25,000,000 HLB)
- **Initial Contributors**: 15% (15,000,000 HLB) - 2-year vesting
- **Public Sale**: 10% (10,000,000 HLB)

## Governance Participants

### Token Holders

All HLB token holders can participate in governance by:

- Voting on active proposals
- Delegating voting power
- Creating new proposals (with sufficient HLB)

### Delegates

Delegates are addresses that receive voting power from token holders:

- Any address can be a delegate
- Delegation does not transfer tokens, only voting power
- Token holders can change their delegate at any time

### Core Contributors

The core development team participates in governance through:

- Technical input on proposals
- Implementation of approved changes
- Emergency response when needed

### Governance Council

A temporary governance council exists during the bootstrap phase:

- 7 members (3 core team, 4 community representatives)
- Oversees initial protocol parameters
- Will be phased out as full decentralization is achieved

## Governance Process

### Proposal Lifecycle

Governance proposals follow a structured lifecycle:

1. **Discussion Phase**
   - Informal discussion in the forum and Discord
   - Community feedback gathering
   - Technical feasibility assessment

2. **Temperature Check**
   - Snapshot vote to gauge community interest
   - Requires 1% of total HLB to participate
   - Non-binding but guides proposal development

3. **Formal Proposal**
   - On-chain proposal creation
   - Requires 10,000 HLB to submit
   - Includes executable code or parameter changes

4. **Voting Period**
   - 5-day on-chain voting period
   - Options: For, Against, or Abstain
   - Voting power based on HLB holdings or delegation

5. **Execution Delay**
   - 48-hour timelock before implementation
   - Allows users to react to approved changes
   - Emergency proposals may have shorter delays

6. **Implementation**
   - Automatic execution for parameter changes
   - Core team implements code changes
   - Results announced to the community

### Proposal Categories

Proposals fall into several categories:

1. **Parameter Updates**
   - Bridge fee adjustments
   - Interest rate modifications
   - Collateral factor changes
   - Gas limit adjustments

2. **Protocol Upgrades**
   - Smart contract upgrades
   - New feature implementations
   - Protocol extensions

3. **Treasury Management**
   - Funding allocations
   - Grants and investments
   - Token buybacks or burns

4. **Emergency Actions**
   - Pause/unpause protocol functions
   - Emergency parameter changes
   - Urgent security fixes

## How to Participate

### Staking HLB

To participate in governance, start by staking your HLB tokens:

1. Visit the [Staking Page](https://app.hienluongbridge.com/staking)
2. Connect your wallet
3. Stake your HLB tokens
4. Select "Enable Governance" option

See the [Staking Guide](./staking_guide.md) for detailed instructions.

### Delegating Your Vote

To delegate your voting power:

1. Visit the [Governance Page](https://app.hienluongbridge.com/governance)
2. Connect your wallet
3. Select the "Delegation" tab
4. Enter the delegate's address
5. Confirm the delegation transaction

![Delegate Voting Power](../images/governance_delegate.png)

### Participating in Discussions

Before formal proposals, participate in community discussions:

1. Join the [Governance Forum](https://forum.hienluongbridge.com)
2. Participate in Discord governance channels
3. Attend community calls (held bi-weekly)
4. Provide feedback on draft proposals

### Voting on Proposals

To vote on active proposals:

1. Visit the [Governance Page](https://app.hienluongbridge.com/governance)
2. Connect your wallet
3. Browse active proposals
4. Select a proposal to view details
5. Choose your vote: "For," "Against," or "Abstain"
6. Confirm your vote transaction

![Vote on Proposal](../images/governance_vote.png)

### Creating a Proposal

To create a new governance proposal:

1. Draft your proposal on the [Governance Forum](https://forum.hienluongbridge.com)
2. Gather community feedback
3. Conduct a temperature check via Snapshot
4. If favorable, visit the [Governance Page](https://app.hienluongbridge.com/governance)
5. Select "Create Proposal"
6. Fill in the proposal details:
   - Title and description
   - Links to discussion threads
   - Technical specifications
   - On-chain actions to execute
7. Submit your proposal (requires 10,000 HLB)

![Create Proposal](../images/governance_create_proposal.png)

## Governance Parameters

### Quorum Requirements

For a proposal to be valid, it must meet the following quorum requirements:

- **Standard Proposals**: 4% of total HLB supply must vote
- **Critical Proposals**: 10% of total HLB supply must vote
- **Emergency Proposals**: 15% of total HLB supply must vote

### Voting Thresholds

For a proposal to pass, it must meet these voting thresholds:

- **Standard Proposals**: >50% of votes in favor
- **Critical Proposals**: >66% of votes in favor
- **Emergency Proposals**: >75% of votes in favor

### Timeframes

Governance operates on the following timeframes:

- **Discussion Period**: Minimum 3 days recommended
- **Temperature Check**: 3 days
- **Voting Period**: 5 days
- **Execution Delay**: 48 hours
- **Emergency Proposals**: Expedited timeframes possible

## Advanced Governance Features

### Governance Simulator

Before submitting formal proposals, use the governance simulator:

1. Visit the [Simulator Page](https://app.hienluongbridge.com/governance/simulator)
2. Input your proposed parameter changes
3. View the simulated impact on protocol metrics
4. Adjust your proposal based on simulation results

### Multi-Chain Governance

The governance system operates across multiple chains:

1. **Primary Governance Chain**: Ethereum
2. **Secondary Governance Chains**: Optimism, Arbitrum
3. Cross-chain message passing ensures consistent governance

### Specialized Committees

For specific domains, specialized committees provide expertise:

1. **Technical Committee**: Smart contract and protocol architecture
2. **Risk Committee**: Parameter recommendations and risk monitoring
3. **Treasury Committee**: Fund allocation and financial management

To join a committee:

1. Apply through the governance forum
2. Undergo community vetting
3. Be elected through a governance proposal

## Governance Security

### Timelocks

All governance actions are subject to timelocks:

1. **Standard Changes**: 48-hour timelock
2. **Critical Changes**: 72-hour timelock
3. **Emergency Actions**: 6-hour minimum timelock

### Multi-Signature Control

Critical protocol functions are secured by multi-signature control:

1. 4-of-7 signature threshold
2. Distributed across team and community members
3. Geographic and jurisdictional diversity

### Guardian Function

A temporary guardian function exists to prevent catastrophic exploits:

1. Can pause specific protocol functions
2. Cannot access user funds or modify balances
3. Actions are transparent and require justification
4. Will be phased out through governance

## Governance Analytics

### Proposal Dashboard

Track proposal statistics and governance activity:

1. Visit the [Analytics Page](https://app.hienluongbridge.com/governance/analytics)
2. View historical proposal data
3. Track voter participation rates
4. Monitor delegate activity

![Governance Analytics](../images/governance_analytics.png)

### Voting Power Distribution

Monitor the distribution of voting power:

1. Top delegates and their voting history
2. Voting power concentration metrics
3. Active vs. passive token distribution
4. Historical voting patterns

## Common Governance Scenarios

### Protocol Fee Adjustment

To adjust protocol fees:

1. Create a forum post with the proposed change
2. Include data supporting the adjustment
3. Run simulations showing the impact
4. Follow the standard proposal process

### Adding New Supported Chains

To add support for a new blockchain:

1. Technical assessment post in the forum
2. Security review of the chain's architecture
3. Integration cost and resource estimation
4. Formal proposal with implementation plan

### Emergency Protocol Pause

In case of detected vulnerabilities:

1. Core team or guardians initiate emergency pause
2. Immediate community notification
3. Technical investigation and fix development
4. Governance vote on fix implementation and restart

## Best Practices

### For Proposal Creation

1. **Research Thoroughly**: Understand the full impact of your proposal
2. **Seek Feedback Early**: Share drafts before formal submission
3. **Be Specific**: Clearly define what changes and why
4. **Provide Data**: Support arguments with relevant metrics
5. **Consider Alternatives**: Address potential alternative approaches

### For Voting

1. **Do Your Research**: Understand proposals before voting
2. **Consider Long-Term Impact**: Look beyond immediate effects
3. **Participate Regularly**: Consistent participation strengthens governance
4. **Delegate Responsibly**: If delegating, choose delegates who share your values
5. **Vote Independently**: Form your own opinion rather than following others

## Resources

### Governance Platforms

- [Governance Portal](https://app.hienluongbridge.com/governance)
- [Governance Forum](https://forum.hienluongbridge.com)
- [Snapshot Page](https://snapshot.org/#/hienluongbridge.eth)

### Documentation

- [Governance Technical Specification](../governance/technical_spec.md)
- [HLB Token Economics](../governance/tokenomics.md)
- [Proposal Templates](../governance/proposal_templates.md)

### Community Channels

- Discord: [Join](https://discord.gg/hienluongbridge)
- Twitter: [@HienLuongBridge](https://twitter.com/HienLuongBridge)
- Telegram: [Join](https://t.me/hienluongbridge)

## Conclusion

Governance is the heart of the Hiền Lương Bridge protocol, ensuring that it remains community-driven and adaptable. By participating in governance, you help shape the future of cross-chain infrastructure and contribute to the decentralization of the protocol.

For further assistance or questions about governance, join our community channels or contact the governance team at governance@hienluongbridge.com.
