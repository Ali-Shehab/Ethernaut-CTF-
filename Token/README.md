Inorder to solve this level, you must know what is underflow and overflow.
### underflow:
If you have uint8=0 and then you subtract from it -1, then underflow will occur and it will return 255.
### overflow:
If you have uint8=255 and then you add to it +1,then overflow will occur and it will return 0.

## The contract:
You are given a 20 token and you must get more tokens. As you can see, the version of solidty is ```^0.6.0``` and no ```SafeMath``` is used, so you must directly check for underflow. Simply by calling 21 token and send it to anyother address,other than you account. Underflow will occur and you will got a hug amount of tokens.