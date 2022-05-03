If a contract do not have a paybale function, you can not send recieve and send ether, however using ```selfdestruct()```.
This function is used to destroy a contract and using it you can force the contract to send the ether to another contract using:
```selfdestruct(addressTarget)```
## Solving this level:
Create an Attack contract and add recieve function to recieve ether.
Create the attacj function that selfdestruct the contract of the challenge.
