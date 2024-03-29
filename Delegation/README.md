## Some info about Delegation:
Delegate call is used when we want to interact with a contract and we do not know the contract ABI.
## Explanation:
When contract A calls contract B using delegatecall. It is telling contract B to run his context inside contract A(strogafe,msg.sender,msg.data...)
## Keep in mind:
When using delegatecall there is 2 things to keep in mind:
1. Delegatecall preserves context.
2. Storage layout must be the same for A and B. (both must declare same state vars in same order)

## Back to Contract:
In this level, we have Delegation contract is making call to contract Delegate through a fallback function.
So we can trigger the attack by sending a call function and inside it we add "pwn()" the name of the function we want to call.
``` owner.call(abi.encodeWithSignature("pwn()")); ```

## Solving it directly in the browser

It is also possible to slove it with no need to create contract. So we want to pass data to the sendTransaction function, this data will be "pwn()" so that it can call it in the above contract.
1. pwnFunc = web3.utils.sha3("pwn()") we will have the hash now.
2. await contract.sendTransaction({data: pwnFunction})

