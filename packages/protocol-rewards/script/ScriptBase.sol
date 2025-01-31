// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";

interface ImmutableCreate2Factory {
    function findCreate2Address(bytes32 salt, bytes memory initCode) external view returns (address deploymentAddress);

    function findCreate2AddressViaHash(bytes32 salt, bytes32 initCodeHash) external view returns (address deploymentAddress);

    function hasBeenDeployed(address deploymentAddress) external view returns (bool);

    function safeCreate2(bytes32 salt, bytes memory initializationCode) external payable returns (address deploymentAddress);
}

contract ScriptBase is Script {
    address deployer;

    ImmutableCreate2Factory constant IMMUTABLE_CREATE2_FACTORY = ImmutableCreate2Factory(0x5D2A567B95868a6c6331056Ad7AE70bcD37d1600);

    function setUp() public {}
}
