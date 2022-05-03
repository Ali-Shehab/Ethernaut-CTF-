As we learn in delegation in level 6, if a contract makes a delegate call to another contract both contract must have same vars and in same order. If you look in LibraryContract we have only one variable which is ``uint storedTime``.We can take advantage of this. First we create a contract from ``PreservationAttack`` and we add variables in same order as ``Preservation`` contract. We add ``setTime`` function  but inside it we change the owner variable.  Now we deploy the contract.

From the console:
1. We call the setFirstTime method and we add the paramter will be the address of the contract.
await contract.setFirstTime("ADDRESS_OF_CONTRACT_WE_DEPLOYED")
2. Now the timeZoneLibrary have our address,so it is time to be the owner.
3. Send another setFirstTime call and this time the setTime function that will be called is the one in our contract and we are the owners.
await contract.setFirstTime("123")