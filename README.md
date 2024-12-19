# HFT Token

An upgradeable ERC20 token deployed on Base mainnet.

## Deployment Information

### Base Mainnet
- Proxy Contract (Main Address): `0x9283562629E708B694514E494004Ebd471348b16`
- Implementation Contract: `0x1040FbA35f42F0aD0fcfA852255347Fb1e6Ea881`
- Network: Base Mainnet
- Block: 23847089
- Deployment Cost: 0.00003419378337742 ETH (1928390 gas * avg 0.017731778 gwei)

## Contract Architecture
The token uses a proxy pattern consisting of two contracts:
1. **Proxy Contract** (`0x9283562629E708B694514E494004Ebd471348b16`)
   - This is the main address users interact with
   - Stores all contract state (balances, etc.)
   - Address remains constant through upgrades

2. **Implementation Contract** (`0x1040FbA35f42F0aD0fcfA852255347Fb1e6Ea881`)
   - Contains the contract logic
   - Can be upgraded by the contract owner
   - No state storage

## Contract Features
- ERC20 Standard Implementation
- Upgradeable (UUPS Pattern)
- Pausable functionality
- Ownable with access control
- Backend-managed reward distribution
- veNFT integration for governance and rewards

## Development

### Build
```shell
$ forge build
```

### Test
```shell
$ forge test
```

### Deploy
```shell
$ source .env && forge script script/HFTToken.s.sol:HFTTokenScript \
    --rpc-url <your_rpc_url> \
    --private-key $PRIVATE_KEY \
    --broadcast
```

### Upgrade
```shell
$ source .env && forge script script/HFTTokenUpgrade.s.sol:UpgradeScript \
    --rpc-url <your_rpc_url> \
    --private-key $PRIVATE_KEY \
    --broadcast
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/HFTToken.s.sol:HFTTokenScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help

