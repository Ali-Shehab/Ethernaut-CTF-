This is an easy contract, just by calling the ```changeOwner``` function from a contract not directly from the user and passing your account as a parameter. 
It will pass the if() and then you will be the owner.


## Takeaway:
It is highly recommended to use ```msg.sender``` instead of ```tx.origin```. As tx.origin is vulnerable to phishing attacks. 
