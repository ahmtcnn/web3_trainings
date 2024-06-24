// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";

//Import files as the following: import "./SimpleStorage.sol"; This method imports everything
//Blow methods is better that only the requested objects are imported
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    //we want to store fav number of people other than us. So we need to create contract for each of them.
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {

        //Creation of the object
        SimpleStorage simpleStorageContractVariable = new SimpleStorage();
        // SimpleStorage simpleStorage = new SimpleStorage();

        //We add contract to our array with push.
        listOfSimpleStorageContracts.push(simpleStorageContractVariable);
    }

    // the contract have store function itself. But we wrap that function with the following, get the index of the contract and store the number:
    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _simpleStorageNumber
    ) public {
        // Address
        // ABI
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        listOfSimpleStorageContracts[_simpleStorageIndex].store(
            _simpleStorageNumber
        );
    }

    // The same as sfStore, since this is public function we can call this.
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}