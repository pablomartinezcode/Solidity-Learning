// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased;

    constructor() payable {
        owner = msg.sender; //represents address being called
        fortune = msg.value; //represents how much ether is being sent
        deceased = false;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    modifier mustBeDeceased{
        require(deceased == true);
        _;
    }

    address payable[] familyWallets;

    mapping(address => uint) inheritance;

    function setInheritance(address payable wallet, uint amount) public {
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    function payout() private mustBeDeceased{
        for(uint i = 0; i < familyWallets.length; i++){
            address payable currWallet = familyWallets[i];
            currWallet.transfer(inheritance[currWallet]);
        }
    }

    function hasDeceased() public onlyOwner{
        deceased = true;
        payout();
    }

}