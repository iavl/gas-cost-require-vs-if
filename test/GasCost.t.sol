// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {GasCost} from "../src/GasCost.sol";

contract GasCostTest is Test {
    GasCost public gasCost;

    function setUp() public {
        gasCost = new GasCost();
    }

    // Test gas consumption of require (success case)
    function test_SetNumberWithRequire_Success() public {
        uint256 gasBefore = gasleft();
        gasCost.setNumberWithRequire(100);
        uint256 gasUsed = gasBefore - gasleft();
        console.log("Gas used (require, success):", gasUsed);
        assertEq(gasCost.number(), 100);
    }

    // Test gas consumption of if revert (success case)
    function test_SetNumberWithIfRevert_Success() public {
        uint256 gasBefore = gasleft();
        gasCost.setNumberWithIfRevert(100);
        uint256 gasUsed = gasBefore - gasleft();
        console.log("Gas used (if revert, success):", gasUsed);
        assertEq(gasCost.number(), 100);
    }

    // Test gas consumption of require (fail case - first condition)
    function test_SetNumberWithRequire_FailFirst() public {
        uint256 gasBefore = gasleft();
        vm.expectRevert("Number must be greater than 0");
        gasCost.setNumberWithRequire(0);
        uint256 gasUsed = gasBefore - gasleft();
        console.log("Gas used (require, fail first):", gasUsed);
    }

    // Test gas consumption of if revert (fail case - first condition)
    function test_SetNumberWithIfRevert_FailFirst() public {
        uint256 gasBefore = gasleft();
        vm.expectRevert("Number must be greater than 0");
        gasCost.setNumberWithIfRevert(0);
        uint256 gasUsed = gasBefore - gasleft();
        console.log("Gas used (if revert, fail first):", gasUsed);
    }

    // Test gas consumption of require (fail case - second condition)
    function test_SetNumberWithRequire_FailSecond() public {
        uint256 gasBefore = gasleft();
        vm.expectRevert("Number must be less than 1000");
        gasCost.setNumberWithRequire(1000);
        uint256 gasUsed = gasBefore - gasleft();
        console.log("Gas used (require, fail second):", gasUsed);
    }

    // Test gas consumption of if revert (fail case - second condition)
    function test_SetNumberWithIfRevert_FailSecond() public {
        uint256 gasBefore = gasleft();
        vm.expectRevert("Number must be less than 1000");
        gasCost.setNumberWithIfRevert(1000);
        uint256 gasUsed = gasBefore - gasleft();
        console.log("Gas used (if revert, fail second):", gasUsed);
    }

    // Comparison test: gas consumption in success case
    function test_CompareGasCost_Success() public {
        // Test require
        gasCost.reset();
        uint256 gasBefore1 = gasleft();
        gasCost.setNumberWithRequire(100);
        uint256 gasUsedRequire = gasBefore1 - gasleft();

        // Test if revert
        gasCost.reset();
        uint256 gasBefore2 = gasleft();
        gasCost.setNumberWithIfRevert(100);
        uint256 gasUsedIfRevert = gasBefore2 - gasleft();

        console.log("=== Gas Comparison (Success Case) ===");
        console.log("Require gas used:", gasUsedRequire);
        console.log("If revert gas used:", gasUsedIfRevert);
        console.log(
            "Difference:",
            gasUsedRequire > gasUsedIfRevert ? gasUsedRequire - gasUsedIfRevert : gasUsedIfRevert - gasUsedRequire
        );
    }

    // Comparison test: gas consumption in fail case (first condition)
    function test_CompareGasCost_FailFirst() public {
        // Test require
        uint256 gasBefore1 = gasleft();
        vm.expectRevert("Number must be greater than 0");
        gasCost.setNumberWithRequire(0);
        uint256 gasUsedRequire = gasBefore1 - gasleft();

        // Test if revert
        uint256 gasBefore2 = gasleft();
        vm.expectRevert("Number must be greater than 0");
        gasCost.setNumberWithIfRevert(0);
        uint256 gasUsedIfRevert = gasBefore2 - gasleft();

        console.log("=== Gas Comparison (Fail First Condition) ===");
        console.log("Require gas used:", gasUsedRequire);
        console.log("If revert gas used:", gasUsedIfRevert);
        console.log(
            "Difference:",
            gasUsedRequire > gasUsedIfRevert ? gasUsedRequire - gasUsedIfRevert : gasUsedIfRevert - gasUsedRequire
        );
    }

    // Comparison test: gas consumption in fail case (second condition)
    function test_CompareGasCost_FailSecond() public {
        // Test require
        uint256 gasBefore1 = gasleft();
        vm.expectRevert("Number must be less than 1000");
        gasCost.setNumberWithRequire(1000);
        uint256 gasUsedRequire = gasBefore1 - gasleft();

        // Test if revert
        uint256 gasBefore2 = gasleft();
        vm.expectRevert("Number must be less than 1000");
        gasCost.setNumberWithIfRevert(1000);
        uint256 gasUsedIfRevert = gasBefore2 - gasleft();

        console.log("=== Gas Comparison (Fail Second Condition) ===");
        console.log("Require gas used:", gasUsedRequire);
        console.log("If revert gas used:", gasUsedIfRevert);
        console.log(
            "Difference:",
            gasUsedRequire > gasUsedIfRevert ? gasUsedRequire - gasUsedIfRevert : gasUsedIfRevert - gasUsedRequire
        );
    }

    // Comparison test: string error vs custom error (success case)
    function test_CompareGasCost_StringVsCustomError_Success() public {
        // Test require (string error)
        gasCost.reset();
        uint256 gasBefore1 = gasleft();
        gasCost.setNumberWithRequire(100);
        uint256 gasUsedRequire = gasBefore1 - gasleft();

        // Test if revert (custom error)
        gasCost.reset();
        uint256 gasBefore2 = gasleft();
        gasCost.setNumberWithIfRevertCustomError(100);
        uint256 gasUsedCustomError = gasBefore2 - gasleft();

        console.log("=== Gas Comparison (String Error vs Custom Error, Success) ===");
        console.log("Require (string) gas used:", gasUsedRequire);
        console.log("If revert (custom error) gas used:", gasUsedCustomError);
        console.log(
            "Difference:",
            gasUsedRequire > gasUsedCustomError
                ? gasUsedRequire - gasUsedCustomError
                : gasUsedCustomError - gasUsedRequire
        );
    }

    // Comparison test: string error vs custom error (fail case)
    function test_CompareGasCost_StringVsCustomError_Fail() public {
        // Test require (string error)
        uint256 gasBefore1 = gasleft();
        vm.expectRevert("Number must be greater than 0");
        gasCost.setNumberWithRequire(0);
        uint256 gasUsedRequire = gasBefore1 - gasleft();

        // Test if revert (custom error)
        uint256 gasBefore2 = gasleft();
        vm.expectRevert(GasCost.NumberTooSmall.selector);
        gasCost.setNumberWithIfRevertCustomError(0);
        uint256 gasUsedCustomError = gasBefore2 - gasleft();

        console.log("=== Gas Comparison (String Error vs Custom Error, Fail) ===");
        console.log("Require (string) gas used:", gasUsedRequire);
        console.log("If revert (custom error) gas used:", gasUsedCustomError);
        console.log(
            "Difference:",
            gasUsedRequire > gasUsedCustomError
                ? gasUsedRequire - gasUsedCustomError
                : gasUsedCustomError - gasUsedRequire
        );
    }
}

