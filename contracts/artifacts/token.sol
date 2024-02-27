// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Token {

    uint256 public totalSuply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;

    event NewTransfer(address from, address to, uint amount);
    event Approval(address approver, address spender, uint allowance);

    constructor(uint256 suply) {
        totalSuply = suply;
        balanceOf[msg.sender] = totalSuply;
    }

    function transfer(address to, uint256 amount) public  {
        balanceOf[msg.sender] = balanceOf[msg.sender] - amount;
        balanceOf[to] = balanceOf[to] + amount;

        emit NewTransfer(msg.sender, to, amount);
    }

    function approve(address spender, uint256 amount) public {
        allowance[msg.sender][spender] = amount;        
        emit Approval(msg.sender, spender, amount);
    }

    function transferFrom(address from, address to, uint amount) public {
        require(allowance[from][msg.sender] >= amount);
        allowance[from][msg.sender] -= amount;
        balanceOf[from] = balanceOf[from] - amount;
        balanceOf[to] = balanceOf[to] + amount;
    }

}
