# Testing Guide

<div align="center">
  <img src="../../assets/images/hien_luong_bridge_logo.png" alt="Hiền Lương Bridge Logo" width="200" />
  <h2>Testing Methodology and Guide</h2>
</div>

## Overview

Hiền Lương Bridge employs a comprehensive testing strategy using two complementary frameworks:

1. **Hardhat** - TypeScript-based testing for integration tests and scenarios involving multiple contracts
2. **Foundry** - Solidity-based testing for unit tests and gas optimization

This dual approach ensures thorough coverage and leverages the strengths of both frameworks.

## Test Structure

```
test/
├── hardhat/
│   ├── bridge/
│   │   ├── BridgeCore.test.ts
│   │   ├── NormalOFT.test.ts
│   │   ├── AdapterOFT.test.ts
│   │   └── ...
│   ├── lending/
│   │   ├── SourcePool.test.ts
│   │   └── ...
│   └── CoreOApp.test.ts
└── foundry/
    ├── bridge/
    │   ├── BridgeCore.t.sol
    │   ├── NormalOFT.t.sol
    │   └── ...
    ├── lending/
    │   ├── SourcePool.t.sol
    │   └── ...
    └── CoreOApp.t.sol
```

## Running Tests

### All Tests

To run the complete test suite (both Hardhat and Foundry):

```bash
pnpm test
```

### Hardhat Tests

For running only the Hardhat TypeScript tests:

```bash
pnpm test:hardhat
```

To run specific test files:

```bash
pnpm hardhat test test/hardhat/bridge/BridgeCore.test.ts
```

### Foundry Tests

For running only the Foundry Solidity tests:

```bash
pnpm test:forge
```

To run specific test files:

```bash
forge test --match-path test/foundry/bridge/BridgeCore.t.sol -vvv
```

Use verbosity flags to see more details:

- `-v`: Display test names
- `-vv`: Display test names and logs
- `-vvv`: Display test names, logs, and traces

## Writing Tests

### Hardhat TypeScript Tests

Hardhat tests are written in TypeScript and are located in the `test/hardhat` directory. They are particularly useful for testing complex cross-chain scenarios.

#### Example Hardhat Test

```typescript
import { expect } from "chai";
import { ethers } from "hardhat";
import { deployBridgeFixture } from "../fixtures/bridgeFixture";

describe("BridgeCore", function () {
  it("Should register a fungible token correctly", async function () {
    const { bridgeCore, mockERC20, owner } = await deployBridgeFixture();

    await bridgeCore
      .connect(owner)
      .registerFungibleToken(mockERC20.address, "Test Token", "TEST", 18);

    const tokenData = await bridgeCore.getFungibleTokenData(mockERC20.address);
    expect(tokenData.name).to.equal("Test Token");
    expect(tokenData.symbol).to.equal("TEST");
    expect(tokenData.decimals).to.equal(18);
  });

  // Add more tests...
});
```

### Foundry Solidity Tests

Foundry tests are written in Solidity and are located in the `test/foundry` directory. They are especially useful for unit testing and gas optimization.

#### Example Foundry Test

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "forge-std/Test.sol";
import "../../contracts/bridge/BridgeCore.sol";
import "../mocks/MockERC20.sol";

contract BridgeCoreTest is Test {
  BridgeCore bridgeCore;
  MockERC20 mockToken;
  address owner = address(1);

  function setUp() public {
    vm.startPrank(owner);
    bridgeCore = new BridgeCore();
    mockToken = new MockERC20("Test Token", "TEST", 18);
    vm.stopPrank();
  }

  function testRegisterFungibleToken() public {
    vm.prank(owner);
    bridgeCore.registerFungibleToken(
      address(mockToken),
      "Test Token",
      "TEST",
      18
    );

    (string memory name, string memory symbol, uint8 decimals) = bridgeCore
      .getFungibleTokenData(address(mockToken));
    assertEq(name, "Test Token");
    assertEq(symbol, "TEST");
    assertEq(decimals, 18);
  }

  // Add more tests...
}
```

## Testing Cross-Chain Functionality

Testing cross-chain functionality requires simulating multiple chains and their interactions. Both frameworks provide tools for this:

### Hardhat Approach

Use the built-in forking capabilities to simulate different chains:

```typescript
import { deployBridgeFixture } from "../fixtures/bridgeFixture";

describe("Cross-chain Bridge", function () {
  it("Should bridge tokens across chains", async function () {
    // Set up two mock chains
    const { sourceChain, destChain } = await setupCrossChainTest();

    // Deploy bridge on both chains
    const sourceBridge = await deployBridgeFixture(sourceChain);
    const destBridge = await deployBridgeFixture(destChain);

    // Register the bridges as peers
    await sourceBridge.setPeer(destChain.endpointId, destBridge.address);
    await destBridge.setPeer(sourceChain.endpointId, sourceBridge.address);

    // Test bridging
    // ...
  });
});
```

### Foundry Approach

Foundry provides cheatcodes to simulate different chains and execute cross-chain messages:

```solidity
function testCrossChainBridge() public {
    // Set up source chain environment
    vm.selectFork(sourceFork);
    vm.startPrank(user);

    // Perform action on source chain
    sourceBridge.bridgeToken(destChainId, destAddress, token, amount);

    // Switch to destination chain
    vm.selectFork(destFork);

    // Execute the message (simulating LayerZero delivery)
    bytes memory message = /* construct message */;
    destEndpoint.receiveMessage(sourceChainId, sourceAddress, message);

    // Verify results on destination chain
    assertEq(destToken.balanceOf(destAddress), amount);
}
```

## Gas Optimization Testing

Foundry excels at gas optimization testing. Use the `.gas` assertion to ensure functions remain within gas limits:

```solidity
function testBridgeGasUsage() public {
  // Set up test
  // ...

  // Measure gas usage
  uint256 gasBefore = gasleft();
  bridge.bridgeToken(destChainId, destAddress, token, amount);
  uint256 gasUsed = gasBefore - gasleft();

  // Assert gas usage is within acceptable limits
  assertLe(gasUsed, 200000);
}
```

## Coverage Reports

Generate test coverage reports to identify untested code:

### Hardhat Coverage

```bash
pnpm hardhat coverage
```

This generates a coverage report in the `coverage/` directory that can be viewed in your browser.

### Foundry Coverage

```bash
forge coverage
```

## Continuous Integration

The project uses GitHub Actions for continuous integration testing. The workflow runs on every pull request and includes:

1. Running the full test suite
2. Generating coverage reports
3. Static code analysis
4. Gas usage reports

## Best Practices

When writing tests for Hiền Lương Bridge, follow these best practices:

1. **Isolation**: Each test should be independent and not rely on the state from other tests
2. **Fixtures**: Use fixtures to set up common test scenarios
3. **Complete Testing**: Test both happy paths and edge cases
4. **Gas Optimization**: Include tests for gas usage on critical functions
5. **Security Testing**: Include tests that verify security properties (e.g., access control, input validation)
6. **Cross-Chain Testing**: Always test both ends of cross-chain operations
7. **Deterministic Tests**: Avoid using random values that could make tests flaky

## Common Testing Patterns

### Testing LayerZero Messages

```typescript
it("Should correctly send and receive cross-chain messages", async function () {
  // Setup source and destination chains

  // Mock LayerZero endpoint on source chain
  const mockEndpoint = await ethers.getContractFactory("MockEndpoint");
  const sourceEndpoint = await mockEndpoint.deploy();

  // Initialize bridge with mock endpoint
  const bridgeFactory = await ethers.getContractFactory("BridgeCore");
  const sourceBridge = await bridgeFactory.deploy(sourceEndpoint.address);

  // Send message
  await sourceBridge.sendMessage(destChainId, message);

  // Get the last message from the mock endpoint
  const lastMessage = await sourceEndpoint.getLastMessage();

  // Verify message contents
  expect(lastMessage.dstChainId).to.equal(destChainId);
  expect(lastMessage.message).to.equal(message);
});
```

### Testing Token Bridging

```typescript
it("Should lock tokens on source chain and mint on destination chain", async function () {
  // Setup bridges on both chains

  // Mint tokens to user on source chain
  await sourceToken.mint(user.address, amount);

  // Approve bridge to spend tokens
  await sourceToken.connect(user).approve(sourceBridge.address, amount);

  // Bridge tokens
  await sourceBridge
    .connect(user)
    .bridgeToken(destChainId, destUser.address, sourceToken.address, amount);

  // Verify tokens are locked on source chain
  expect(await sourceToken.balanceOf(sourceBridge.address)).to.equal(amount);

  // Simulate message delivery to destination chain
  // ...

  // Verify tokens are minted on destination chain
  expect(await destToken.balanceOf(destUser.address)).to.equal(amount);
});
```

## Troubleshooting

### Common Testing Issues

1. **Gas Estimation Errors**:
   - Increase the gas limit in the test configuration
   - Check for infinite loops or other gas-intensive operations

2. **LayerZero Simulation Errors**:
   - Ensure mock endpoints are correctly configured
   - Verify message format matches what the real endpoint expects

3. **Test Timing Issues**:
   - Use `evm_increaseTime` in Hardhat or `vm.warp` in Foundry to simulate time passing
   - Be careful with asynchronous operations in TypeScript tests

4. **Inconsistent Test Results**:
   - Reset the blockchain state between tests
   - Avoid dependencies between tests

## Additional Resources

- [Hardhat Testing Documentation](https://hardhat.org/hardhat-runner/docs/guides/test-contracts)
- [Foundry Book - Testing](https://book.getfoundry.sh/forge/writing-tests)
- [LayerZero Testing Guide](https://docs.layerzero.network/developers/testing)
