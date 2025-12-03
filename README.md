# Gas Cost Comparison: require vs if revert

This project compares the gas consumption of two error handling approaches in Solidity: `require` with custom error and `if revert` with custom error.

## Project Description

This project implements a comparison between:

1. **require + custom error** vs **if revert + custom error**

Both approaches use custom errors (not string errors) for gas efficiency, and we compare the gas cost difference between using `require()` statement and `if revert` pattern.

### Contract Functions

The `GasCost.sol` contract contains the following functions:

- `setNumberWithRequire()`: Uses `require(condition, CustomError())` for condition checking with custom error
- `setNumberWithIfRevert()`: Uses `if (condition) revert CustomError()` for condition checking with custom error

Both functions validate that:
- `newNumber != 0` (reverts with `NumberTooSmall()` if false)
- `newNumber < 1000` (reverts with `NumberTooLarge()` if false)

### Test Coverage

The test file `test/GasCost.t.sol` includes the following test scenarios:

- Gas consumption comparison when the first condition fails (number too small)
- Gas consumption comparison when the second condition fails (number too large)

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

## Test Results

Run `forge test -vvv` to see detailed gas consumption comparison:

```bash
$ forge test -vvv
```

### Test Output

```
[PASS] testCompareFailLarge() (gas: 14529)
Logs:
  === Gas Comparison (Fail - Number Too Large) ===
  Require gas used: 8130
  If revert gas used: 1077
  Difference: 7053

[PASS] testCompareFailSmall() (gas: 14493)
Logs:
  === Gas Comparison (Fail - Number Too Small) ===
  Require gas used: 8106
  If revert gas used: 1053
  Difference: 7053

Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 4.78ms (3.58ms CPU time)
```