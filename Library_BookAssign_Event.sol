// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract libraryapplicationdemo{

    address public Ravi;

    constructor() public{
        (Ravi = msg.sender);
    }
    
    modifier Admin(){
        require(msg.sender == Ravi);
        _;
    }

    event NewBookAssigned(string _name, uint _numofbook, uint _duration);

    struct bookassign{

        uint key;
        string book;
        string Sname;
        uint numberofbooks;
        uint duration;
    }
    mapping (uint => bookassign) Assigned;
     function assignbook
     (
        uint _ID,
        string memory _bookname,
        string memory _name,
        uint _numofbook,
        uint _duration
     ) public Admin
    {
        Assigned[_ID].book = _bookname;
        Assigned[_ID].Sname = _name;
        Assigned[_ID].numberofbooks = _numofbook;
        require(_numofbook<=2);
        Assigned[_ID].duration = _duration;
        emit NewBookAssigned(_name, _numofbook, _duration);
    }
    function readdetails
    (
        uint _ID
    )public view returns
    (
        string memory book,
        string memory Sname,
        uint numberofbooks,
        uint duration
    ){
        return 
        (
            Assigned[_ID].book,
            Assigned[_ID].Sname,
            Assigned[_ID].numberofbooks,
            Assigned[_ID].duration
        );
    }

}
