<div align="center">
  <a href="https://github.com/Peace-Foundation">
    <img alt="Hiền Lương Bridge" style="width: 20%" src="/assets/images/hien_luong_bridge_with_text_logo.png"/>
  </a>

  <h1>Hiền Lương Bridge</h1>

  <p>
    <strong>Cross-Chain Protocol</strong>
  </p>

  <p>
    <a href="./documentation_index.md"><img alt="Documentation" src="https://img.shields.io/badge/docs-documentation-blueviolet" /></a>
    <a href="./docs/architecture.md"><img alt="Architecture" src="https://img.shields.io/badge/docs-architecture-orange" /></a>
    <a href="./whitepapper/whitepaper.md"><img alt="Whitepaper" src="https://img.shields.io/badge/docs-whitepaper-blue" /></a>
  </p>
</div>

Hiền Lương Bridge is a comprehensive cross-chain protocol built on LayerZero that enables seamless asset transfer and interoperability across multiple blockchain networks. Named after the historic bridge that once connected North and South Vietnam, our protocol symbolizes connection and unity in the fragmented blockchain landscape.

## Requirements

- `Node.js` - `>=18.16.0`
- `pnpm` (recommended) - or another package manager of your choice (npm, yarn)
- `forge` (optional) - `>=0.2.0` for testing, and if not using Hardhat for compilation

## Setup

- Copy `.env.example` into a new `.env`
- Set up your deployer address/account via the `.env`
  - You can specify either `MNEMONIC` or `PRIVATE_KEY`:

    ```
    MNEMONIC="test test test test test test test test test test test junk"
    or...
    PRIVATE_KEY="0xabc...def"
    ```

- Fund this deployer address/account with the native tokens of the chains you want to deploy to. This example by default will deploy to the following chains' testnets: **Optimism Sepolia** and **Arbitrum Sepolia**.

## Build

### Compiling your contracts

This project supports both `hardhat` and `forge` compilation. By default, the `compile` command will execute both:

```bash
pnpm compile
```

If you prefer one over the other, you can use the tooling-specific commands:

```bash
pnpm compile:forge
pnpm compile:hardhat
```

## Deploy

To deploy the OApp contracts to your desired blockchains, run the following command:

```bash
pnpm hardhat lz:deploy --tags MyOApp
```

Select all the chains you want to deploy the OApp to.

## Documentation

Comprehensive documentation for the Hiền Lương Bridge protocol is available in the following locations:

- [Documentation Index](./documentation_index.md) - Main index of all documentation
- [Project Overview](./docs/project_overview.md) - Introduction to the protocol
- [Architecture](./docs/architecture.md) - Technical architecture details
- [Bridge Documentation](./docs/bridge.md) - Bridge functionality
- [Lending Documentation](./docs/lending.md) - Cross-chain lending
- [Staking Documentation](./docs/staking.md) - Staking mechanisms
- [Whitepaper](./whitepapper/whitepaper.md) - Technical whitepaper

### Key Components

The Hiền Lương Bridge protocol consists of three main components:

1. **Bridge** - Core cross-chain asset bridging functionality for both fungible and non-fungible tokens
2. **Lending** - Cross-chain lending protocol enabling lending and borrowing across different blockchains
3. **Staking** - Staking mechanisms for protocol participation and governance

See the [documentation index](./documentation_index.md) for complete details on all components.
