// auto-generated by running `pnpm run generate`
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import { {{baseTestClass}} } from "../upgrades/{{baseTestClass}}.sol";

contract {{ outputTestFile}} is {{baseTestClass}} {
    {{#each forks}}
    function test_{{../baseTestFunction}}_{{this}}() external {
        // create and select the fork, which will be used for all subsequent calls
        setupForkTest("{{this}}");

        {{../baseTestFunction}}();
    }
    {{/each}}
    
}
