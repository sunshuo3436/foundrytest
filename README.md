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
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
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
```
# foundrytest
### basic knowlegde
Default Template：
```shell
$ cd hello_foundry
$ tree . -d -L 1
.
├── lib
├── script
├── src
└── test

4 directories
```
```shell
$ forge build
$ forge test
```
Then two new directories pop up: out and cache.
-   **cache**: 用于forge重新编译必要的内容
-   **out**:包含合同文件，例如 ABI

### Foundry working on an Existing Project
```shell
$ git clone https://github.com/PaulRBerg/foundry-template
$ cd foundry-template
$ forge install
$ bun install # install Solhint, Prettier, and other Node.js deps
```
Then,
```shell
$ forge build
$ forge test
```
### Clone a Verified Contract on Chain
```shell
$ forge clone 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 WETH9
```
"0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2"is the contract's address.

This creates a new directory WETH9, configures it as a foundry project and clones all the source code of the contract into it. This also initializes a new git repository.

The cloned Forge project comes with an additional .clone.meta metadata file besides those ordinary files that a normal Forge project has.
```shell
{
  "path": "src/Contract.sol",
  "targetContract": "WETH9",
  "address": "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2",
  "chainId": 1,
  "creationTransaction": "0xb95343413e459a0f97461812111254163ae53467855c0d73e0f1e7c5b8442fa3",
  "deployer": "0x4f26ffbe5f04ed43630fdc30a87638d53d0b0876",
  "constructorArguments": "0x",
  "storageLayout": {
    "storage": [],
    "types": {}
  }
}

```
