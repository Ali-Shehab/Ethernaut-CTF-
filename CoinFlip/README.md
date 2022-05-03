Deriving pseudo-randomness based on blockhash or blocknumber is not safe at all. It make them vulnerable, since somebody who nows the inputs can easily guess the ```random outcome```.

How to bypass this level?
1. First we need to calculate the values the same way the CoinFlip is doing.
```solidity
uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
uint256 blockValue = uint256(blockhash(block.number.sub(1)));
uint256 coinFlip = blockValue.div(FACTOR);
```
2. Now let us add a function that allow us to send true or false by knowing ther value that the contract will calculate.
3. ```bool side = coinFlip == 1 ? true : false;``` , this variable will be true if coinFlip==1 else it will be false.
4. Now we compare if side==_guess we will send the gues the user entered else we will send the oposite.