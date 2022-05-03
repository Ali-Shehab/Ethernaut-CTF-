# NOTE: 
Never store a private data on blockchain unless you want it to be read by anybody.

## Contract:
Inorder to solve this level you must know how variables are stored.
* bool need one byte. slot 0
* bytes32 need 32 bytes which is a coplete slot so we cannot add it next to bool and it will be on slot 1.

``storage = w3.eth.getStorageAt(vault.address,1)`` call this method first to get the data on slot 1 and store it on storage.
``vault.unlock(storage,{"from":account})`` now send this call and the contract will be unlocked.
