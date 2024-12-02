// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {

    // //Variables
    // uint public myUint = 1;
    // string public myString = "Hello, World!";
    // bytes32 public myBytes32 = "Hello, World!";//Array of chars
    // address public myAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    


    // struct MyStruct{
    //     uint256 myUint256;
    //     string myString;
    // }

    // MyStruct public myStruct = MyStruct(1, "Hello, World");



    // function getValue() public pure returns(uint){
    //     uint value = 1;
    //     return value;
    // }


    // //Arrays
    // uint[] public uintArray = [1, 2, 3];
    // string[] public values;
    // uint256[][] public array2D = [[1,2,3], [4,5,6]];

    // function addValue(string memory _value) public{
    //     values.push(_value);
    // }
    
    // function valueCount() public view returns(uint){
    //     return values.length;
    // }

    // //Mappings
    // mapping(uint => string) public names;
    // mapping(uint => Book) public books;
    // mapping(address => mapping(uint => Book)) public myBooks;

    // struct Book {
    //     string title;
    //     string author;
    // }

    // constructor() {
    //     names[1] = "Adam";
    //     names[2] = "Bruce";
    //     names[3] = "Carl";
    // }

    // function addBook(uint _id, string memory _title, string memory _author) public {
    //     books[_id] = Book(_title, _author);
    // }

    // function addMyBook(uint _id, string memory _title, string memory _author) public {
    //     myBooks[msg.sender][_id] = Book(_title, _author);
    // }


    //Conditionals
    //Loops

    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function countEvens() public view returns(uint){
        uint count = 0;

        for (uint i = 0; i < numbers.length; i++){
            if(isEven(numbers[i])){
                count++;
            }
        }

        return count;
    }

    function isEven(uint _number) public pure returns(bool){
        if(_number % 2 == 0){
            return true;
        }else{
            return false;
        }
    }

    function isOwner() public view returns(bool){
        return(msg.sender == owner);
    }



}