### Updraft Course Summary

Within the Updraft Course, I have learned some basics of Solidity and created 3 applications:

1. **SimpleStorage**
2. **StorageFactory**
3. **FundMe**

#### Summary of Learnings:

- Used `pragma solidity ^0.8.18;` to specify Solidity version compatibility.
- Imported external contracts/interfaces using the `import` statement (e.g., `AggregatorV3Interface` from Chainlink and `PriceConverter` from a custom file).
- Utilized the `PriceConverter` library to extend functionality for `uint256` values.
- Declared state variables like `public constant MINIMUM_USD` and `address public i_owner`.
- Used mappings and arrays (`mapping(address => uint256) public addressToAmountFunded` and `address[] public funders`) for data storage.
- Defined a constructor `constructor()` for initializing state variables upon contract deployment.
- Implemented functions (`fund()`, `getVersion()`, `withdraw()`) with different access modifiers (`public`, `internal`, `external`).
- Applied a custom modifier `onlyOwner` to restrict function access based on caller identity.
- Handled errors with custom error definition (`error NotOwner()`) and `require` statements for conditions.
- Demonstrated Ether transactions with `fund()` and `withdraw()` functions.
- Utilized `AggregatorV3Interface` to interact with external contracts (e.g., Chainlink Price Feed).
- Added comments (`//` and `/* */`) for code explanation, hints, and documentation.

