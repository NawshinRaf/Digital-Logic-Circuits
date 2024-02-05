`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2023 03:22:42 PM
// Design Name: 
// Module Name: Lab5b_tb
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


module Shift_Register_tb(
    );
    
    reg [7:0] inp=10;
    reg [2:0]N=1;
    reg RnL=0,clk=0,reset=0;
    
   wire [7:0]out ;
   
   Shift_Register ii(inp,RnL,clk,reset,N,out);
   
   always 
   #50 clk=~clk;
   
   initial begin
   
   //Synchronous testing
   //a
    inp = 8'b11001100;
    reset = 1;
    #100
    reset = 0;
    N=2;
    RnL = 1;
    #200
    reset = 1;
    //b
    #100
    N=1;
    RnL = 0;
    inp = 8'b10101010;
    reset = 0;
    #100
    reset = 1;
    //c
    #100
    N=5;
    RnL = 1;
    inp = 8'b11100000;
    reset = 0;
    #100
    reset=1;
    #100
    //d
    #100
    N=7;
    RnL = 0;
    inp = 8'b00000001;
    reset = 0;
    #100
    reset=1; 
    /*
    reset = 0;
    #100
    reset=1;
    N=5;
    RnL = 1;
    inp = 8'b01010101;
    */
   
    
    end
   
endmodule
