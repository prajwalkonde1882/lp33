//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

contract StudentData{

    //structure

    struct Student{
        string name;
        uint256 rollno;
    }

    Student[]public studentarr;

    function addStudent(string memory name,uint rollno) public{
        for (uint i=0; i< studentarr.length;i++){
            if (studentarr[i].rollno==rollno){
                revert ("Student with thiss roll no already exists");
            }
        }
        studentarr.push(Student(name,rollno));
    }

    function getStudentsLength()public view returns(uint){
        return studentarr.length;
    }

    function displayAllStudents()public view returns (Student[]memory){
        return studentarr;
    }

    function getStudentByIndex(uint idx) public returns(Student memory){
        require(idx<studentarr.length,"Index out of bound!");
        return studentarr[idx];
    }

    fallback()external payable{
        //this function will handle external function call that is not there in our contracct
    }

    receive() external payable{
        // this function will handle the ether send by external user but without data mentioned
    }

}
