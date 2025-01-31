// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

import {ZoraDeployerBase} from "../src/ZoraDeployerBase.sol";
import {ZoraDeployerUtils} from "../src/ZoraDeployerUtils.sol";
import {Deployment, ChainConfig} from "../src/DeploymentConfig.sol";

contract DeployErc20Minter is ZoraDeployerBase {
    function run() public returns (string memory) {
        string memory pkString = vm.envString("PRIVATE_KEY");
        uint256 pk = vm.parseUint(pkString);

        Deployment memory deployment = getDeployment();
        ChainConfig memory chainConfig = getChainConfig();

        vm.startBroadcast(pk);

        deployment.erc20Minter = ZoraDeployerUtils.deployErc20Minter(chainConfig);

        vm.stopBroadcast();

        return getDeploymentJSON(deployment);
    }
}
