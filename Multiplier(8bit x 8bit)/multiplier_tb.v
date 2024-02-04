`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 11:16:54 PM
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb(

    );
    
     reg [7:0] mcd =0;
     reg [7:0] mlt =0;
     reg ON =1 ;
     reg clk = 0;
     reg rst = 0;
     
     wire [1:0] state;
     
     wire [15:0]product;
     wire done;

/*############COMMENT OUT THE MULTIPLIER VERSION YOU ARE USING ##########*/
 //multiplier_8by8bits_v2 multiplier_instance(mcd,mlt,ON,clk,rst,product,done);
 /*multiplier_8by8bits multiplier_instance(.multiplier(mlt),
    .multiplicand(mcd),
    .clk(clk),
    .reset(rst),
    .start(ON),
    .result(product),.done(done),.s(state));*/

    initial begin
     
      rst=0;
      end
     always 
        #1 clk = ~clk;
    
     always begin
        
       // ON = 0;
        #1
        ON =1;
        mcd = $urandom_range(255,0);
        mlt =$urandom_range(255,0);
        #50;
        ON=0;
        #5;
   
        
        
     end
     
     
     
     
endmodule
