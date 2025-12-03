// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

contract GasCost {
    uint256 public number;

    // Using require statement
    function setNumberWithRequire(uint256 newNumber) public {
        require(newNumber > 0, "Number must be greater than 0");
        require(newNumber < 1000, "Number must be less than 1000");
        number = newNumber;
    }

    // Using if revert statement
    function setNumberWithIfRevert(uint256 newNumber) public {
        if (newNumber == 0) {
            revert("Number must be greater than 0");
        }
        if (newNumber >= 1000) {
            revert("Number must be less than 1000");
        }
        number = newNumber;
    }

    // Custom error definitions
    error NumberTooSmall();
    error NumberTooLarge();

    // Using if revert with custom error (more gas efficient)
    function setNumberWithIfRevertCustomError(uint256 newNumber) public {
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
