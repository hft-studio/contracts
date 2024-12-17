# HFT Token

## Deployment Information

### Base Sepolia Testnet
- **Contract Address**: `0x4d7F286BF85f7511710fD4DbB72c71c0b991a483`
- **Transaction Hash**: `0xe045fc1888f111810dd54562c581a109b0f7bd4f7aa50f8ce9f67bb8e6ef92f8`
- **Block Number**: 18296633
- **Network**: Base Sepolia (Chain ID: 84532)
- **Block Explorer**: [View on Basescan](https://sepolia.basescan.org/address/0x4d7F286BF85f7511710fD4DbB72c71c0b991a483)

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

