// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;


//Only creator can create more coins
 contract Coin{
    address public minter;
    mapping(address => uint) public balances;
    
    //Stores log of transaction before added to chain
    event Sent(address from, address to, uint amount);

    constructor(){
      minter = msg.sender;

    }
    
    
    //Make new coins and send them to an address
    //Only owner can send these coins
    function mint(address receiver, uint amount) public{
      require(msg.sender == minter);
      balances[receiver] += amount;
    }

    //Error object
    error insufficientBalance(uint requested, uint available);

    //Send any amount of coins to an existing address
    function send(address receiver, uint amount) public {
      if(amount > balances[msg.sender])
      revert insufficientBalance({
         requested: amount,
         available: balances[msg.sender]
      });
      balances[msg.sender] -= amount;
      balances[receiver] += amount;

      //Emitting event
      emit Sent(msg.sender, receiver, amount);
    }

    
 }