// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import {ZoraDeployerBase} from "../src/ZoraDeployerBase.sol";
import {Deployment} from "../src/DeploymentConfig.sol";
import {DeterministicDeployerScript} from "../src/DeterministicDeployerScript.sol";

/// @dev Deploys implementation contracts for 1155 contracts.
/// @notice Run after deploying the minters
/// @notice This
contract DeployNewImplementations is ZoraDeployerBase {
    function run() public returns (string memory) {
        // 1. Load the environment variable as a string
        string memory pkString = vm.envString("PRIVATE_KEY");
        // 2. Parse it into a uint256
        //    (Assumes PRIVATE_KEY is a hex string like "0xabc123...")
        uint256 pk = vm.parseUint(pkString);

        Deployment memory deployment = getDeployment();

        vm.startBroadcast(pk);

        deployNew1155AndFactoryImpl(deployment);

        return getDeploymentJSON(deployment);
    }
}
