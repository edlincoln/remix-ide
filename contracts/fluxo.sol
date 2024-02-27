// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ControleFluxo {

    struct Student {
        address addr;
        bool pay;
    }

    Student[] public  students;

    function addStudent(address addr) public {
        students.push(Student(addr, false));
    }

    function pay() payable public  {
        require(msg.value > 1, "valor invalido");
        for(uint i=0; i < students.length; i++) {
            Student storage s = students[i];
            if (s.addr == msg.sender) {
                s.pay = true;
            }
        }
    }

    function removeStudent(address addr) public  {
        for (uint i = students.length; i > 0; i--) {
            Student storage s = students[i-1];
            if (addr == s.addr) {
                students[i - 1] = students[students.length - 1];
                students.pop();
            }
        }
    } 
}