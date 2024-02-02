module Ripple_CarryAdder_4bits(
    output [3:0] Sum,
    output CarryOut,
    input [3:0] A,
    input [3:0] B,
    input CarryIn


    );
    
    wire [3:1] c;
    
    //Instantiate the 4 full adders
    full_adder FA0(Sum[0], c[1], A[0], B[0], CarryIn);
    full_adder FA1(Sum[1], c[2], A[1], B[1], c[1]);
    full_adder FA3(Sum[2], c[3], A[2], B[2], c[2]);
    full_adder FA4(Sum[3], CarryOut, A[3], B[3], c[3]);

endmodule
