// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface SimpleToken {
    function destroy(address payable _to) external;
}