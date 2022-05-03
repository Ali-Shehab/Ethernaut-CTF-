This contract is vulnerable to a simple reentrance attack, since the contract is sending ether to the user before chaning his amount on the mapping balances. So you write a contract that has an attack() funtion that call the donate method and that will trigger a fallback function. In the fallback() function you will call a withdraw() function that will withdraw amount and then will be triggered again and it will repeated until it reaches that condition that we add 
```solidity
if (address(owner).balance != 0 )
{
    owner.withdraw(amount); 
}
```