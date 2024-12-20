// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {HFTToken} from "../src/HFTToken.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract HFTTokenScript is Script {
    function run() public returns (address proxyAddress) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // 1. Deploy the implementation contract
        HFTToken implementation = new HFTToken();
        console2.log("Implementation deployed at:", address(implementation));

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
        console2.log("Proxy deployed at:", address(proxy));

        // 4. Create token instance
        HFTToken token = HFTToken(address(proxy));

        // 5. Verify initialization
        require(bytes(token.name()).length > 0, "Token not initialized");
        
        vm.stopBroadcast();
        return address(proxy);
    }
}
