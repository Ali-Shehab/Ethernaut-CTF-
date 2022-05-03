This is another easy challenge you must notice that ```Fal1out``` is different then the name of the Contract ```Fallout```.

```solidity
/* constructor */
  function Fal1out() public payable {
    owner = msg.sender;
    allocations[owner] = msg.value;
  }
```

 So you only need to call the Function ```Fal1out``` and then you will be the owner.