module full_adder(
    output Sum,
    output Carryout,
    input input_X,
    input input_Y,
    input input_Z
    );
    
    assign Sum = input_X^input_Y^input_Z;
    assign Carryout = (input_X&input_Y) | (input_Z&(input_X^input_Y));
    
    
endmodule
