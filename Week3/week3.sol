//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Studentship {

    struct student {
        string name;
        uint level;
        string department;
        string matric_no;
        string status;
    }


    mapping(string => student) matricToStudent;

    function registerStudent(string memory _name, uint _level, string memory _dept, string memory matric) public {
        matricToStudent[matric] = student(_name, _level, _dept, matric, "active");
    }

    function viewRegisteredStudent(string memory matric) public view returns(student memory){
        student memory _student;
        _student = matricToStudent[matric];
        return _student;
    }
}