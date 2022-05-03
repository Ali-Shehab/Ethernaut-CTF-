This is an easy exercises you just need to understand some information about ERC20. There is different method to transfer token in ERC20 other than the ``transfer`` method. You can call the ```increaseAllowance``` function which will approve that you can transfer tokens then call the ``transferFrom`` method to transfer tokens.

## From the console:
await contract.increaseAllowance(player,"1000000000000000000000000")
await contract.transferFrom(player,"ADDRESS","1000000000000000000000000")