// SPDX-License-Identifier: GPL-3.0
import "./AccessControl.sol";

pragma solidity >=0.8.2 <0.9.0;

contract Storage is AccessControl {

    uint256 number;

    constructor() { }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    function pay() public payable {}

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}