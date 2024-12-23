// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

//Contract must receive and store information, then return it
contract simpleStorage{
    uint storeData;

    function set(uint x) public{
        storeData = x;
    }

    function get() public view returns(uint){
        return storeData;
    }
}
