To improve the performance of the multiplier, Booth multiplier is mostly used. 
The number of partial product rows that must be added to give the multiplication‟s result can be reduced by using Booth decoding. 

The Booth Radix-4 algorithm reduces the number of partial products by half while keeping the circuit’s complexity down to a minimum. 
This results in lower power operation in an FPGA and provides for multiplication when no hard multipliers are otherwise available. 
Booth Recoding makes these advantages possible by skipping clock cycles that add nothing new in the way of product terms. 
The Radix-4 Booth Recoding is simply a multiplexer that selects the correct shift-and-add operation based on the groupings of bits found in the product register. 
The product register holds the multiplier. The multiplicand and the two’s complement of the multiplicand are added based on the recording value.

The following project shows the following :

-Full listing of the verilog program.
-Test bench to show the design.
-Output waveforms achieved from simulation.

The following is a brief explanation of the main code that multiplies the 8-bit inputs(x and y).

1)The main module (multi) consist of seven ports (2 inputs and 5 output). 

2)The module consist of three registers of  different sizes.


    i.Size 3, to store the three bits that were encoded from the multiplier. 
    
    ii.Size 8, stores the partial products generated by the the booth’s criterion. 
    
Booth’s criterion from the three bits taken from the  multiplier input y using the radix-4 method:

000,111→ previous product +  zero.

001,010→ previous product + multiplicand.

011→ previous product + multiplicand shifted to the left by 1 bit.

100→ previous product + 2’s complement of the multiplicand shifted to the left by 1 bit.

101,110→ previous product +  2’s complement of multiplicand.

Size 16, to store the signed partial products.
The partial products, starting from the second one, were shifted to the left by 2 bits due to the radix 4 operation. 
The partial products were added by the carry-look-ahead adder defined by 16-bit adder module called cladder in the program.
The final product was passed to the 5-digit converter module via the output port.

Booth’s Algorithm for Binary Multiplication Example
![IMG_20240207_012714](https://github.com/NawshinRaf/Digital-Logic-Circuits/assets/43382522/52f974fe-0777-4aca-ac7e-2abf4f55c7f7)

![IMG_20240207_012645](https://github.com/NawshinRaf/Digital-Logic-Circuits/assets/43382522/d2b22c13-a33f-4ff8-ae64-79ad090c29c2)

x2 shr --> means shift to the right by 2 bits.


The adder used in this case is the Carry-look Ahead Adder. 

A Carry Look-Ahead Adder (CLA) is a type of adder circuit used in digital systems to perform fast addition of binary numbers. Unlike conventional adders like ripple carry adders, which propagate carry bits serially through each stage, a carry look-ahead adder generates carry signals for all stages in parallel. This parallel generation of carry signals results in faster addition, especially for large numbers of bits.

Here's how a Carry Look-Ahead Adder works:

Binary Addition:

A Carry Look-Ahead Adder performs binary addition just like any other adder. It takes two binary numbers as input and produces their sum along with the carry-out.


Pre-Computation of Carry Signals:
In a Carry Look-Ahead Adder, instead of waiting for carry signals to propagate through each stage, the carry signals for all stages are pre-computed in parallel based on the input bits.
This pre-computation is based on mathematical expressions derived from the binary addition operation.


Generation of Carry Look-Ahead Signals:
The carry look-ahead signals are generated using logical expressions that consider groups of input bits.
These expressions determine whether a carry will propagate from one stage to the next, allowing for the calculation of carry signals without needing to wait for the previous carry to propagate.
The algorithm computes the propagate (P) and generate (G) signals for each bit position using logical operations, and then computes the sum and carry-out based on these signals.

Carry Propagation:
Once the carry look-ahead signals are computed, they are used to propagate carry information through the adder circuit.
Each stage of the adder combines the input bits with the corresponding carry look-ahead signals to produce the sum and carry-out for that stage.


Parallel Carry Propagation:
Because the carry look-ahead signals are pre-computed in parallel, the carry propagation through the adder occurs in parallel as well.
This parallel carry propagation results in faster addition compared to ripple carry adders, especially for larger numbers of bits, as there is no need to wait for carry signals to ripple through each stage sequentially.


Fast Addition:
By eliminating the need to wait for carry propagation, a Carry Look-Ahead Adder reduces the critical path delay of addition operations, leading to faster addition times in digital circuits.


Overall, a Carry Look-Ahead Adder improves the speed of binary addition by pre-computing carry signals in parallel, allowing for faster propagation of carry information through the adder circuit compared to traditional ripple carry adders. However, it may require more complex logic to implement due to the generation of carry look-ahead signals.



![image](https://github.com/NawshinRaf/Digital-Logic-Circuits/assets/43382522/a870fdaf-da79-491c-a225-dce19488b01f)



