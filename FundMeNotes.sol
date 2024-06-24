// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;



// We are importing from the chainlink which is an oracle network. 
//For example: https://data.chain.link/feeds/ethereum/mainnet/eth-usd
//https://docs.chain.link/data-feeds/using-data-feeds


//Interface - It's more like a contract definition that can be used to interact with deployed contracts
//Interface - Interfaces are a way of defining a structure (a pattern or the expected functionality of a contract).

//you can use functions defined in an interface to interact with a deployed contract without having access to the contract's full implementation code.

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

// Defining errors to use on functions to throw.
error NotOwner();

contract FundMe {

    //When we use the using keyword. we can use value.getconversionrate() instead of getconversionrate(value)
    using PriceConverter for uint256;

    /classic mapping, dictionary style
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    // Could we make this constant?  /* hint: no! We should make it immutable! */

    //Well if we are not going to change a variable value after setting it on contractor, we should make it immutable for gas efficiency.

    address public /* immutable */ i_owner;

    //If we are going to set the variable at some static value like blow: we should use constant keyword
    uint256 public constant MINIMUM_USD = 5 * 10 ** 18;

    constructor() {
        // we have set the i_owner in constructor and we will not change it. So it means we can use immutable
        i_owner = msg.sender;
    }

    //If we are going to send eth to this contract, we should use payable keyword on this function
    function fund() public payable {

        //If we need some conditions, we can use require, and then set the error string like below:
        require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
        // require(PriceConverter.getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");

        //add to the dictionary 
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }


    //this comes from the chhainlink libray.
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    //we can use modifier to specify a condition. So we can use this onlyOwner keywords on functions to set a condition like blow:
    modifier onlyOwner() {
        // require(msg.sender == owner);
        if (msg.sender != i_owner) revert NotOwner();
        _;
    }

    //onlyOwner modifier
    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);

        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \
    //         yes  no
    //         /     \
    //    receive()?  fallback()
    //     /   \
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }
}

// Concepts we didn't cover yet (will cover in later sections)
// 1. Enum
// 2. Events
// 3. Try / Catch
// 4. Function Selector
// 5. abi.encode / decode
// 6. Hash with keccak256
// 7. Yul / Assembly