//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

//i created a smart contract that allows a user to deposit, withdraw and save ETH!!
    

contract Bank{
    
    address public accHolder;
    uint256 balance = 0;

    constructor(){
        accHolder = msg.sender;
    }
    //0xd9145CCE52D386f254917e481eB44e9943F39138
    

    //we create the fucntion of witdraw 
   function withdraw() payable public{
        //we create a require arg to make sure the balance of the sender is >= _amount if not ERR
        require (balance > 0, "you dont havce enough balance.");
        require(msg.sender== accHolder, "you are not the account owner.");
        payable(msg.sender).transfer(balance);
        balance = 0;
   }
    

// whatever the user deposit is added to msg.value of the sender address we mapped above
   function deposit() public payable{
        require (msg.value > 0 , "Deposit amount should be greater than 0.");
        require(msg.sender== accHolder, "you are not the account owner.");
        balance += msg.value; 
              
    }

    function getBal() public view returns(uint){
        require(msg.sender== accHolder, "you are not the account owner.");
        return address(this).balance;
    }
}
