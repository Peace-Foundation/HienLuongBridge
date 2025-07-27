import assert from 'assert'

import { type DeployFunction } from 'hardhat-deploy/types'

// Bridge core contract name
const bridgeCoreContract = 'BridgeCore'

const deploy: DeployFunction = async (hre) => {
    const { getNamedAccounts, deployments } = hre

    const { deploy } = deployments
    const { deployer } = await getNamedAccounts()

    assert(deployer, 'Missing named deployer account')

    console.log(`Network: ${hre.network.name}`)
    console.log(`Deployer: ${deployer}`)

    // Get the LayerZero Endpoint address from external deployments
    const endpointV2Deployment = await hre.deployments.get('EndpointV2')

    // Deploy BridgeCore contract
    const { address: bridgeCoreAddress } = await deploy(bridgeCoreContract, {
        from: deployer,
        args: [
            endpointV2Deployment.address, // LayerZero's EndpointV2 address
            deployer, // owner
        ],
        log: true,
        skipIfAlreadyDeployed: false,
    })

    console.log(`Deployed BridgeCore contract, network: ${hre.network.name}, address: ${bridgeCoreAddress}`)

    // Deploy BridgeFactory contract for easy deployment of token contracts
    const bridgeFactoryContract = 'BridgeFactory'
    const { address: bridgeFactoryAddress } = await deploy(bridgeFactoryContract, {
        from: deployer,
        args: [
            endpointV2Deployment.address, // LayerZero's EndpointV2 address
        ],
        log: true,
        skipIfAlreadyDeployed: false,
    })

    console.log(`Deployed BridgeFactory contract, network: ${hre.network.name}, address: ${bridgeFactoryAddress}`)

    // Example of deploying a sample token via ethers directly (not using hardhat-deploy)
    // Uncomment and modify as needed
    /*
    const BridgeFactoryFactory = await hre.ethers.getContractFactory('BridgeFactory')
    const bridgeFactory = BridgeFactoryFactory.attach(bridgeFactoryAddress)
    
    // Deploy a sample OFT token
    console.log('Deploying sample OFT token...')
    const tx = await bridgeFactory.deployNormalOFT(
        'Hien Luong Test Token',
        'HLTT',
        18
    )
    const receipt = await tx.wait()
    const tokenEvent = receipt.events.find((e) => e.event === 'NormalOFTDeployed')
    const tokenAddress = tokenEvent.args.token
    console.log(`Deployed sample OFT token at: ${tokenAddress}`)
    */
}

deploy.tags = [bridgeCoreContract, 'BridgeFactory']

export default deploy
