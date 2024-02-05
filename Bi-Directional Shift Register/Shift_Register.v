`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2023 03:11:14 PM
// Design Name: 
// Module Name: Shift_Register
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


module Shift_Register(
   input [7:0]InputNumber,
   input RightNotLeft,
   input clk,
   input reset,
   input [2:0]N,
   output [7:0]OutputNumber
 );
 
 reg [7:0]result = 0 ;
 
 wire [7:0]vals;
 assign vals = InputNumber;

 assign OutputNumber = result;

 //wire r = ~reset;
 
 always @(posedge clk)
 begin
    
    if(reset)begin
        result <= 0;
           
    end
    else begin
       
            if(RightNotLeft)begin
               
                result <= vals >> N;
                
               
            end   
            
            else begin
               
                    result <= vals << N;
                  
               
               
            end
        
     
 
       end
 end

        

endmodule
