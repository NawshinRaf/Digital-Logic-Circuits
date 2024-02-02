You can use this code to test your own ripple carry adder. 

What are adders?
 Adders are fundamental building blocks in digital logic circuits that perform the arithmetic operation of addition.
 They are used to add two binary numbers and generate a sum output along with a carry output. 
 The simplest form of an adder is a half adder, and it can add two binary digits (bits) and produce a sum and a carry output.

1.Half Adder:

A half adder takes two input bits, A and B, and produces two outputs: the sum (S) and the carry (C).
The sum output (S) is the XOR (exclusive OR) of A and B.
The carry output (C) is the AND of A and B.
Truth table:
A | B | S | C
--|---|---|---
0 | 0 | 0 | 0
0 | 1 | 1 | 0
1 | 0 | 1 | 0
1 | 1 | 0 | 1

2.Full Adder:

A full adder is an extension of the half adder. It takes three inputs: A, B, and a carry input (Cin) from a previous stage.
It produces two outputs: the sum (S) and the carry (Cout).
The sum output (S) is the XOR of A, B, and Cin.
The carry output (Cout) is generated using a combination of AND, OR, and XOR gates.
Truth table:
A | B | Cin | S | Cout
--|---|-----|---|-----
0 | 0 | 0   | 0 | 0
0 | 0 | 1   | 1 | 0
0 | 1 | 0   | 1 | 0
0 | 1 | 1   | 0 | 1
1 | 0 | 0   | 1 | 0
1 | 0 | 1   | 0 | 1
1 | 1 | 0   | 0 | 1
1 | 1 | 1   | 1 | 1

These adders are the building blocks for more complex arithmetic operations in digital circuits, such as the addition of multi-bit binary numbers
and the implementation of arithmetic logic units (ALUs) in processors.

Here is a demonstration of how 2 numbers that is within the range of 0 to 7 can be added using the ripple carry adder.
Why 0 to 7 is the range?
Since bits can be defined by only two values, 0 and 1, each position has a combination of forming 2 possible outcomes. 
The reason bits are powers of 2 is that each bit position represents a doubling of the value from the previous position. The rightmost bit represents 
2^0(1), the next bit to the left represents 2^1(2), the next represents 2^2(4), and so on. This binary exponential growth is a consequence of the base-2 numbering system.
![image](https://github.com/NawshinRaf/Digital-Logic-Circuits/assets/43382522/23bd88c5-e4c9-416b-bcd7-7e07ac4886a6)
