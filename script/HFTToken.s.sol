// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {HFTToken} from "../src/HFTToken.sol";

contract HFTTokenScript is Script {
    HFTToken public token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // Deploy HFT token with initial parameters
        token = new HFTToken(
            "Trading Rewards",  // name
            "HFT"              // symbol
        );

        console.log("HFT Token deployed to:", address(token));

        vm.stopBroadcast();
    }
}
