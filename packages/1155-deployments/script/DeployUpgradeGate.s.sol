// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import {ZoraDeployerBase} from "../src/ZoraDeployerBase.sol";
import {Deployment} from "../src/DeploymentConfig.sol";
import {ZoraDeployerUtils} from "../src/ZoraDeployerUtils.sol";
import {DeploymentTestingUtils} from "../src/DeploymentTestingUtils.sol";
import {DeterministicDeployerScript} from "../src/DeterministicDeployerScript.sol";

contract DeployUpgradeGate is ZoraDeployerBase {
    function run() public returns (string memory) {
        string memory pkString = vm.envString("PRIVATE_KEY");
        uint256 pk = vm.parseUint(pkString);
        vm.startBroadcast(pk);

        Deployment memory deployment = getDeployment();


        deployUpgradeGateDeterminstic(deployment);

        vm.stopBroadcast();

        // now test signing and executing premint

        return getDeploymentJSON(deployment);
    }
}
