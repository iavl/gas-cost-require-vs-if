# Gas Cost Comparison: require vs if revert

这个项目用于对比 Solidity 中 `require` 和 `if revert` 两种错误处理方式的 gas 消耗情况。

## 项目说明

本项目实现了以下对比：

1. **require + 字符串错误** vs **if revert + 字符串错误**
2. **字符串错误** vs **自定义错误（Custom Error）**

### 合约功能

`GasCost.sol` 合约包含以下函数：

- `setNumberWithRequire()`: 使用 `require` 进行条件检查（字符串错误）
- `setNumberWithIfRevert()`: 使用 `if revert` 进行条件检查（字符串错误）
- `setNumberWithIfRevertCustomError()`: 使用 `if revert` 进行条件检查（自定义错误）

### 测试覆盖

测试文件 `test/GasCost.t.sol` 包含以下测试场景：

- 成功情况下的 gas 消耗对比
- 第一个条件失败时的 gas 消耗对比
- 第二个条件失败时的 gas 消耗对比
- 字符串错误 vs 自定义错误的 gas 消耗对比

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

运行所有测试：
```shell
$ forge test
```

运行测试并显示 gas 报告：
```shell
$ forge test --gas-report
```

运行测试并显示详细输出（包括 console.log）：
```shell
$ forge test -vvv
```

运行特定测试：
```shell
$ forge test --match-test test_CompareGasCost_Success -vvv
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
