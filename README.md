Within this updraft Course i have learned some basics of solidity and created 3 applications with the course which are : SimpleStorage, StorageFactory and Fundme. 

As a summary:

I have used pragma solidity ^0.8.18; to specify the version of Solidity your contract is compatible with.
Importing External Contracts:

I have imported external contracts/interfaces using the import statement, such as AggregatorV3Interface from Chainlink and PriceConverter from your own file.
Using Libraries:

I have utilized a library called PriceConverter to extend the functionality of uint256 values with custom functions.
State Variables:

I have declared state variables like public constant MINIMUM_USD and address public i_owner.
Mappings and Arrays:

I have used a classic mapping mapping(address => uint256) public addressToAmountFunded and an array address[] public funders to store data.
Constructors:

I have defined a constructor constructor() to initialize state variables when the contract is deployed.
Functions:

I have implemented functions like fund(), getVersion(), and withdraw() with different access modifiers (public, internal, and external).
Modifiers:

I have used a custom modifier onlyOwner to restrict access to certain functions based on the caller's identity.
Error Handling:

I have defined a custom error using error NotOwner() and used require statements for conditions that must be met for function execution.
Ether Transactions:

I have demonstrated sending Ether with the fund() function and handling Ether balances with the withdraw() function.
Interface Usage:

I have used an interface AggregatorV3Interface to interact with an external contract (Chainlink Price Feed).
Comments and Documentation:

I have added comments (// and /* */) to explain code logic, provide hints, and document the purpose of functions and variables.
