`timescale 1ns / 1ps

`include "cladder.v"
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_BAR4_8by8(
    input signed [7:0] mult,
    input signed [7:0] mcd,
    output signed [15:0] product
    
   );
   
   parameter width = 8;  //Declare the maximum number of bits the multiplier and multiplicand can be 
   parameter N = width/2; //For a radix-4, the number of cycles is equal to half the bit value.
  reg [2:0] operation; //Register to store the operation bits
  wire signed [7:0] inv_mcd; // Wire carrying the 2's complement of multiplicand
   reg signed [8:0] mult_holder ;
   integer i,count=0;
   reg signed [width+width-1:0] partial_product[N-1:0];
   wire signed [width+width-1:0] sum[N-1:0];
   
   assign inv_mcd = ~mcd+1'b1; //Evaluate the 2's complement and assign the value
    wire signed [15:0]sum11;   
   
   always @ (mult or mcd )
   begin
  
   count=0;
   
   mult_holder = {mult,1'b0};
   
   operation = mult_holder[2:0];
   
   for(i=0;i<N;i=i+1)
     begin
     case(operation)
     3'b001 , 3'b010 : partial_product[i]= mcd;
     3'b011 : partial_product[i] = mcd<<1;
     3'b100 : partial_product[i] = inv_mcd<<1;
     3'b101 , 3'b110 : partial_product[i] = inv_mcd;
     default : partial_product[i]=0;
     endcase
    
     mult_holder = mult_holder>>2;
     operation = mult_holder[2:0];
    
     
     partial_product[i] = partial_product[i]<<count;
     count=count+2;
    end
    
    end
    assign sum[0] = partial_product[0];
    assign sum[1] = partial_product[1];
    assign sum[2] = partial_product[2];
    assign sum[3] = partial_product[3];
    
    wire [15:0] sum4,sum5,sum6,sum7,sum9,sum11;
    
    cladder cladder_1(.a(sum[0]),.b(sum[1]), .cin(1'b0), .sum(sum4),.cout(sum5));
    cladder cladder_2(.a(sum4),.b(sum[2]), .cin(1'b0), .sum(sum6), .cout(sum7));
    cladder cladder_3(.a(sum6),.b(sum[3]), .cin(1'b0), .sum(sum11), .cout(sum9));
    
    assign product = sum11;
   

   
   
endmodule
