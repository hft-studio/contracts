// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {HFTToken} from "../src/HFTToken.sol";

contract HFTTokenTest is Test {
    HFTToken public token;
    address public owner;
    address public user;

    function setUp() public {
        owner = address(this);
        user = address(0x1);
        token = new HFTToken("Trading Rewards", "HFT");
    }

    function test_PauseAndUnpause() public {
        token.pause();
        assertTrue(token.paused(), "Token should be paused");
        
        token.unpause();
        assertFalse(token.paused(), "Token should be unpaused");
    }

    function testFail_MintWhenPaused() public {
        token.pause();
        token.mint(user, 100 * 10**18); // Should fail when paused
    }

    function test_MintAfterUnpause() public {
        token.pause();
        token.unpause();
        uint256 amount = 100 * 10**18;
        token.mint(user, amount);
        assertEq(token.balanceOf(user), amount, "Should mint after unpausing");
    }

    function testFail_NonOwnerPause() public {
        vm.prank(user);
        token.pause(); // Should fail as non-owner
    }
} 