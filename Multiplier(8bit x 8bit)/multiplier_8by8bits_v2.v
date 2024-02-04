`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 03:56:42 PM
// Design Name: 
// Module Name: Multiplier_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_8by8bits_v2( input [7:0] mcd,input [7:0] mlt,input clk,input rst,input st,
output [15:0] prod,output done  );

//Declare the registers
reg [16:0] product =0; //register to assign the product


reg m =0,rm=0;
integer i =0;
reg done =0;
//reg done=0;

always @(posedge clk,posedge rst) begin
    if(rst)begin
        product <=0;
        done <=0;
       end 
   else begin 
      product[7:0] = mlt;
      product[16:8] = 0;
      
      for( i=0;i<8;i=i+1)begin
        m = product[0];
        if(m==1)begin
          product[16:8] = product[15:8] + mcd ;
        end
        product = product >> 1 ;    
          end  
    end 
 end                          
  
assign prod = product[15:0];




endmodule
