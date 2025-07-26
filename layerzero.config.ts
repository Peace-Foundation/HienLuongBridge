import { EndpointId } from '@layerzerolabs/lz-definitions'
import { ExecutorOptionType } from '@layerzerolabs/lz-v2-utilities'
import { TwoWayConfig, generateConnectionsConfig } from '@layerzerolabs/metadata-tools'
import { OAppEnforcedOption, OmniPointHardhat } from '@layerzerolabs/toolbox-hardhat'

// Define BridgeCore contracts for each chain
const optimismBridgeCore: OmniPointHardhat = {
    eid: EndpointId.OPTSEP_V2_TESTNET,
    contractName: 'BridgeCore',
}

const arbitrumBridgeCore: OmniPointHardhat = {
    eid: EndpointId.ARBSEP_V2_TESTNET,
    contractName: 'BridgeCore',
}

// For cross-chain bridging operations, we need appropriate gas limits
// These values should be adjusted based on profiling the actual gas usage
// in your specific implementation
const EVM_ENFORCED_OPTIONS: OAppEnforcedOption[] = [
    {
        msgType: 1,
        optionType: ExecutorOptionType.LZ_RECEIVE,
        gas: 200000, // Higher gas limit for token bridging operations
        value: 0,
    },
]

// Connect the chains bidirectionally
// Optimism <-> Arbitrum
const pathways: TwoWayConfig[] = [
    [
        optimismBridgeCore, // Chain A contract
        arbitrumBridgeCore, // Chain B contract
        [['LayerZero Labs'], []], // [ requiredDVN[], [ optionalDVN[], threshold ] ]
        [1, 1], // [A to B confirmations, B to A confirmations]
        [EVM_ENFORCED_OPTIONS, EVM_ENFORCED_OPTIONS], // Chain B enforcedOptions, Chain A enforcedOptions
    ],
]

export default async function () {
    // Generate the connections config based on the pathways
    const connections = await generateConnectionsConfig(pathways)
    return {
        contracts: [{ contract: optimismBridgeCore }, { contract: arbitrumBridgeCore }],
        connections,
    }
}
