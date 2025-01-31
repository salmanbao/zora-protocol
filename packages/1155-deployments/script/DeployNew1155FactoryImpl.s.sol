// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import {ZoraDeployerBase} from "../src/ZoraDeployerBase.sol";
import {Deployment} from "../src/DeploymentConfig.sol";
import {DeterministicDeployerScript} from "../src/DeterministicDeployerScript.sol";
import {ZoraDeployerUtils} from "../src/ZoraDeployerUtils.sol";

/// @dev Deploys implementation contracts for 1155 contracts.
/// @notice Run after deploying the minters
/// @notice This
contract DeployNew1155FactoryImpl is ZoraDeployerBase {
    function run() public returns (string memory) {
        string memory pkString = vm.envString("PRIVATE_KEY");

        Deployment memory deployment = getDeployment();
        uint256 pk = vm.parseUint(pkString);
        vm.startBroadcast(pk);


        deployNewFactoryImpl(deployment);

        return getDeploymentJSON(deployment);
    }
}
