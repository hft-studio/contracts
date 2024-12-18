// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {HFTToken} from "../src/HFTToken.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract HFTTokenScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // 1. Deploy the implementation contract
        HFTToken implementation = new HFTToken();

        // 2. Encode the initialization data
        bytes memory initData = abi.encodeWithSelector(
            HFTToken.initialize.selector,
            "HFT Token",
            "HFT"
        );

        // 3. Deploy the proxy contract
        ERC1967Proxy proxy = new ERC1967Proxy(
            address(implementation),
            initData
        );

        // The proxy address is what you'll interact with
        HFTToken token = HFTToken(address(proxy));

        vm.stopBroadcast();
    }
}
