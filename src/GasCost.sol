// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

contract GasCost {
    uint256 public number;

    // Custom error definitions
    error NumberTooSmall();
    error NumberTooLarge();

    // Using if revert with custom error (simulating require behavior)
    function setNumberWithRequire(uint256 newNumber) public {
        if (newNumber == 0) {
            revert NumberTooSmall();
        }
        if (newNumber >= 1000) {
            revert NumberTooLarge();
        }
        number = newNumber;
    }

    // Using if revert with custom error
    function setNumberWithIfRevert(uint256 newNumber) public {
        if (newNumber == 0) {
            revert NumberTooSmall();
        }
        if (newNumber >= 1000) {
            revert NumberTooLarge();
        }
        number = newNumber;
    }

    // Reset number for testing
    function reset() public {
        number = 0;
    }
}
