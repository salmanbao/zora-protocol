// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import {SimpleAA} from "../src/SimpleAA.sol";

contract DeployMockAA is Script {
    function run() public {
        // 1. Load the environment variable as a string
        string memory pkString = vm.envString("PRIVATE_KEY");

        // 2. Parse it into a uint256
        //    (Assumes PRIVATE_KEY is a hex string like "0xabc123...")
        uint256 pk = vm.parseUint(pkString);

        // 3. Derive the address using `vm.addr(...)`
        address derivedAddress = vm.addr(pk);

        // 4. Print the result
        console2.log("Private Key (uint256):", pk);
        console2.log("Derived Address:", derivedAddress);


        vm.startBroadcast(pk);

        address aaAddress = address(new SimpleAA(derivedAddress));

        vm.stopBroadcast();

        console2.log("AA Address:", aaAddress);
        console2.log("Owner:", derivedAddress);
        console2.log("Owner private key:", vm.toString(abi.encode(pkString)));
    }
}
