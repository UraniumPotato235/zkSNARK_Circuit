pragma circom 2.0.0;


/*
1. Write a correct circuit.circom implementation
2. Compile the circuit to generate circuit intermediaries
3. Generate a proof using inputs A=0 B=1
4. Deploy a solidity verifier to Sepolia or Mumbai Testnet
5. Call the verifyProof() method on the verifier contract and assert output is true
*/

template Multiplier2 () {  
   //SIGNAL INPUT
   signal input a;
   signal input b;

   //SIGNAL FROM GATES 
   signal X;
   signal Y;

   //FINAL SIGNAL OUT
   signal output Q;

   //COMPONENT GATE USED TO CREATE CUSTOM CIRCUIT
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   //CIRCUIT LOGIIC

   //andGate logic
   andGate.a <== a;
   andGate.b <== b;
   X <== andGate.out;

   //notGate logic
   notGate.in <== b;
   Y <== notGate.out;

   //orGate logic
   orGate.a <== X;
   orGate.b <== Y;
   Q <== orGate.out;
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

component main = Multiplier2();