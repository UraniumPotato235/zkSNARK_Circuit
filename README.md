# Circuit Deployment on Polygon
This repository contains the imlementation of the given circuit diagram using circom and also demonstrates 
how to deploy it on Polygon Mumbai Testnet


![PolyModule3](https://authoring.metacrafters.io/assets/cms/Assessment_b05f6ed658.png?updated_at=2023-02-24T00:00:37.278Z)

## Requirements

To successfully complete the Final Challenge, your project should:

1. Write a correct circuit.circom implementation
2. Compile the circuit to generate circuit intermediaries
3. Generate a proof using inputs A=0 B=1
4. Deploy a solidity verifier to Sepolia or Mumbai Testnet
5. Call the verifyProof() method on the verifier contract and assert output is true

## Circuit Implementation

The main circuit is defined in the circuit.circom file. The circuit consists of three basic gates (AND, OR, and NOT) and a template named Multiplier2. The circuit logic for Multiplier2 is as follows:

It takes two input signals, `a` and `b`.
It calculates the logical AND of `a` and `b` using the `AND` component and stores the result in signal `x`.
It computes the logical NOT of signal `b` using the `NOT` component and stores the result in signal `y`.
It calculates the logical OR of signals `x` and `y` using the `OR` component and stores the result in signal `Q`.
The value of signal `Q` is logged to the console.

## Prerequisites

Ensure you have the following installed on your machine:
- Node.js and npm
- Truffle, Hardhat, or other Ethereum development tool
- circom and snarkjs libraries
- Solidity compiler

## Implementation Steps
### 1. Designing the circom Circuit
Utilize the provided circuit.circom file to implement the logical gate for binary equality testing between a and b.

### 2. Compiling the Circuit
Compile the circuit using the circom compiler to generate the essential circuit.json file:
`npx hardhat circom`

### 3. Generating the Proof
Inside your input.json file paste
`{   "a": "0",   "b": "1" }` 

### 4. Deploying the Solidity Verifier
`npx hardhat run scripts/deploy.ts`
This script does 4 things

1. Deploys the MultiplierVerifier.sol contract
2. Generates a proof from circuit intermediaries with `generateProof()`
3. Generates calldata with `generateCallData()`
4. Calls `verifyProof()` on the verifier contract with calldata

### 5. Successful Deployment
Upon successful deployment, the terminal will display a confirmation, indicating the deployment of the verifier contract:
```
Compiled 1 Solidity file successfully
Verifier deployed to 0xcF77f0c1c76BBeed7c36946c1E47aaE1E3a62157
Verifier result: true
```
### Author

Ankit Kunwar
