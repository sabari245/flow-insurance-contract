# Flow Insurance Demo Application

This is a simple demo implementation of the working of a web3 insurance application for the flow blockchain. This smart contracts in this repo has been created with flow version 0.42

## functions of the Contract

The contract allows the user to perform 3 tasks essentially

1. create a insurance policy

`CreatePolicy(beneficiary: Address, amount: UFix64)`.

2. claim the insurance if it has not already been claimed before during the period

`ClaimPolicy(beneficiary: Address, claimAmmount: UFix64)`

3. renew the policy to be able to claim it again

`RenevalPolicy(beneficiary: Address, amount: UFix64)`

> note: ClaimPolicy and RenevalPolicy functions both have pre conditions, note the conditions before sending the transactions

## customizations

- The default claimable amount is set to 10000, which can be edited in `cadence/contracts/Insurance.cdc` contract. set it to the desired number you wish
- All the transactions inside the folder `cadence/transactions` have default values, update it to perform custom operations

## Executions Commands

1. run the emulator using the command

`flow emulator`

2. deploy the contract using the command

`flow dev`

3. To run any transaction use the command

`flow transactions send <path\to\the\transactions.cdc>`

4. To run any script use the command

`flow scripts execute <path\to\the\script.cdc>`git

# Warning

DO NOT USE THIS CODE IN PRODUCTION. THIS CODEBASE IS CREATED AS AN EDUCATIONAL PROJECT DO NOT DEPLOY IT AND USE IT IN PRODUCTION
