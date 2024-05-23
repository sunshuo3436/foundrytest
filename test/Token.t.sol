// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/Token.sol";

contract TokenTest is Test {
    Token token;
    address user1 = address(0x1);
    address user2 = address(0x2);

    function setUp() public {
        token = new Token();
        vm.deal(user1, 1 ether);
        vm.deal(user2, 1 ether);
    }

    function testInitialBalance() public {
        uint256 balance = token.balanceOf(address(this));
        assertEq(balance, 1000000000000000000);
    }

    function testTransfer() public {
        uint256 amount = 100000000000000000;
        token.transfer(user1, amount);
        assertEq(token.balanceOf(user1), amount);
        assertEq(token.balanceOf(address(this)), 900000000000000000);
    }

    function testApproveAndTransferFrom() public {
        uint256 amount = 100000000000000000;
        token.approve(user1, amount);
        vm.prank(user1);
        token.transferFrom(address(this), user2, amount);
        assertEq(token.balanceOf(user2), amount);
        assertEq(token.balanceOf(address(this)), 900000000000000000);
    }

    function testAllowance() public {
        uint256 amount = 100000000000000000;
        token.approve(user1, amount);
        uint256 allowance = token.allowance(address(this), user1);
        assertEq(allowance, amount);
    }
}
