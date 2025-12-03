// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {GasCost} from "../src/GasCost.sol";

contract GasCostTest is Test {
    GasCost public gasCost;

    function setUp() public {
        gasCost = new GasCost();
    }

    // Comparison test: gas consumption in fail case (number too small)
    function testCompareFailSmall() public {
        // Test require
        uint256 gasBefore1 = gasleft();
        vm.expectRevert(GasCost.NumberTooSmall.selector);
        gasCost.setNumberWithRequire(0);
        uint256 gasUsedRequire = gasBefore1 - gasleft();

        // Test if revert
        uint256 gasBefore2 = gasleft();
        vm.expectRevert(GasCost.NumberTooSmall.selector);
        gasCost.setNumberWithIfRevert(0);
        uint256 gasUsedIfRevert = gasBefore2 - gasleft();

        console.log("=== Gas Comparison (Fail - Number Too Small) ===");
        console.log("Require gas used:", gasUsedRequire);
        console.log("If revert gas used:", gasUsedIfRevert);
        console.log(
            "Difference:",
            gasUsedRequire > gasUsedIfRevert ? gasUsedRequire - gasUsedIfRevert : gasUsedIfRevert - gasUsedRequire
        );
    }

    // Comparison test: gas consumption in fail case (number too large)
    function testCompareFailLarge() public {
        // Test require
        uint256 gasBefore1 = gasleft();
        vm.expectRevert(GasCost.NumberTooLarge.selector);
        gasCost.setNumberWithRequire(1000);
        uint256 gasUsedRequire = gasBefore1 - gasleft();

        // Test if revert
        uint256 gasBefore2 = gasleft();
        vm.expectRevert(GasCost.NumberTooLarge.selector);
        gasCost.setNumberWithIfRevert(1000);
        uint256 gasUsedIfRevert = gasBefore2 - gasleft();

        console.log("=== Gas Comparison (Fail - Number Too Large) ===");
        console.log("Require gas used:", gasUsedRequire);
        console.log("If revert gas used:", gasUsedIfRevert);
        console.log(
            "Difference:",
            gasUsedRequire > gasUsedIfRevert ? gasUsedRequire - gasUsedIfRevert : gasUsedIfRevert - gasUsedRequire
        );
    }
}

