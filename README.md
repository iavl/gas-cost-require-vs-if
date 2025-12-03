# Gas Cost Comparison: require vs if revert

This project compares the gas consumption of two error handling approaches in Solidity: `require` and `if revert`.

## Project Description

This project implements the following comparisons:

1. **require + string error** vs **if revert + string error**
2. **String error** vs **Custom Error**

### Contract Functions

The `GasCost.sol` contract contains the following functions:

- `setNumberWithRequire()`: Uses `require` for condition checking (string error)
- `setNumberWithIfRevert()`: Uses `if revert` for condition checking (string error)
- `setNumberWithIfRevertCustomError()`: Uses `if revert` for condition checking (custom error)

### Test Coverage

The test file `test/GasCost.t.sol` includes the following test scenarios:

- Gas consumption comparison in success cases
- Gas consumption comparison when the first condition fails
- Gas consumption comparison when the second condition fails
- Gas consumption comparison: string error vs custom error

## Usage

### Build

```shell
$ forge build
```

### Run Tests

Run all tests:
```shell
$ forge test
```

Run tests with gas report:
```shell
$ forge test --gas-report
```

Run tests with verbose output (including console.log):
```shell
$ forge test -vvv
```

Run a specific test:
```shell
$ forge test --match-test test_CompareGasCost_Success -vvv
```