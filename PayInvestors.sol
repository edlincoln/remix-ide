// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract AddressWallets {

    uint fortune;    
    address payable[] investorWallets;     
    mapping(address => uint) investors;
    
    constructor() payable {
        fortune= msg.value;
    }
    
    function payInvestors(address payable wallet, uint amount) public {
        investorWallets.push(wallet);
        investors[wallet] = amount;
    }
    
    function payout() private {
        for(uint i =0; i<investorWallets.length; i++) {
            investorWallets[i].transfer(investors[investorWallets[i]]);
            
        }
    } 
        
    function makePayment() public {
                        payout();
    }


    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }    
}