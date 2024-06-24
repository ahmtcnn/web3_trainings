// I'm a comment!
// SPDX-License-Identifier: MIT

# specify the compiler version to be used with pragma solidity
pragma solidity 0.8.19;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;


// To create a contract, use contract keyword.
contract SimpleStorage {
    // we can use bool, uint256, uint8..., strings variables
    uint256 myFavoriteNumber;

    // we can create our own custom variable type with struct 
    struct Person {
        uint256 favoriteNumber;
        string name;
    }


    // uint256[] public anArray; //to declare array

    //variable types:
    //private -> only the contract can call it
    //internal -> only the contract and child contracts can call it
    //public - > Everybody can see it. Other contracts can call it. It could be function or variable. If it is variable, a getter function is created for it. 

    // if you haven't set a visibility, it is internal as default.

    Person[] public listOfPeople;

    // Mapping means like dictionary. {'string':<int>}
    mapping(string => uint256) public nameToFavoriteNumber;


    //for example this function is public, means externally can be call.
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // we see the view keyword here. This means, this function is going to return a value. This is a read state. It is not going to initiate transaction. This means there is no gas usage.
    // Also we have "pure" functions. If you set pure instead of "view", pure means it is going to return a static value like "return 'ahmet'". Not a variable but a static value.
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // since strings are special datas, you should specify them in function parameters.
    // memory and calldata are temporary storage. Means: after executing this function, these variables are going to trash. Its lifecycle is duration of function execution. If you set it calldata, you can't change the variable. That's the differences. It is immutable and cheaper than memory.
    //storage : the variables that we have defined above like 'myFavoriteNumber'
    //stack : variables that defined in functions as locally.
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}