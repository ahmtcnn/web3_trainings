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
- To send eth from a contract to an address, we can use 
-- `payable(msg.sender).transfer(this).balance;`
-- `bool Success = payable(msg.sender).send(this).balance;`
-- `(bool Success, ) = payable(msg.sender).call{value: address(this).balance}("");`





#### Smart Contract Size

The size of a smart contract in Ethereum is limited by the block gas limit, currently around 12.5 million gas. This translates to roughly 24 kilobytes for bytecode (the compiled contract). This limitation helps ensure that contracts can be executed within reasonable gas limits.


#### create vs create2:

create: This is a Solidity opcode used to deploy new contracts. It takes the bytecode of the contract to be deployed and any constructor arguments needed.
create2: This opcode allows for deterministic contract creation. It takes additional input, including a salt value, to compute the address where the contract will be deployed. This is useful for certain design patterns, like creating contracts whose addresses can be known in advance.


#### Arithmetic Changes in Solidity 0.8.0:

Solidity 0.8.0 introduced stricter checks for overflow and underflow in arithmetic operations. Previously, these checks were not automatically enforced, potentially leading to vulnerabilities if not handled carefully.


#### Challenges of Blockchain Random Numbers:

Generating truly random numbers on the blockchain is challenging due to its deterministic nature. Methods often involve using block data or external oracles, but these can introduce biases or vulnerabilities if not implemented carefully.


#### Mapping vs Array for Address Allowlist:

Mapping: Generally better for address allowlists due to O(1) time complexity for checking if an address is allowed.
Array: Requires iterating through potentially all entries to check membership, resulting in O(n) complexity, which can be less efficient for large lists.


#### Avoiding tx.origin for Authentication:

tx.origin should not be used for authentication because it represents the original sender of a transaction, which can be misleading in certain contexts (e.g., when transactions are initiated by contracts).


#### Hash Function Used by Ethereum:

Ethereum primarily uses the Keccak-256 hash function, which is a variant of the SHA-3 standard. It's used for various purposes, including generating addresses from public keys and hashing data within smart contracts


#### 1 Gwei of Ether: 
1 Gwei (Gigawei) is equal to 0.000000001 Ether (10^-9 Ether). It's commonly used to denote the smallest unit of Ether used in gas price calculations.


#### require vs assert:

- require is used to validate inputs, conditions, or state variables. It's used for regular checks and conditions where failure is expected under certain circumstances.
assert is used for internal consistency checks and to ensure conditions that should never fail. If an assert statement fails, it indicates a critical issue with the contract's logic or state.

- In practice, require is commonly used for input validation and state requirements, while assert is used for internal sanity checks and invariant conditions. Both help ensure that smart contracts behave predictably and securely.


#### Flash Loan:

A flash loan is a type of decentralized finance (DeFi) transaction where a user can borrow assets from a lending pool without needing collateral, provided the borrowed amount is returned within the same transaction. It allows for arbitrage opportunities and complex financial maneuvers within the blockchain ecosystem.


#### Reentrancy in Smart Contracts:

Reentrancy refers to a scenario where a contract can call back into itself or another contract before completing its initial execution. This can lead to unexpected behavior and security vulnerabilities, such as reentrant attacks.