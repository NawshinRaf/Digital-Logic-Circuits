`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2023 12:28:03 PM
// Design Name: 
// Module Name: light_controller
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


module light_controller(
  C0,
  C1,
  C2,
  G1,
  G2,
  R1,
  R2,
  Y1,
  Y2);
  
input C0;
input C1;
input C2;
output G1;
output G2;
output Y1;
output Y2;
output R1;
output R2;
    
assign G1 = ~C2 & (C1^C0);
assign G2 = C2 & (C1^C0);
assign Y1 = ~C2 & C1 & C0;
assign Y2 =  C2 & C1 & C0;
assign R1 = C2 | (~C1 & ~C0);
assign R2 = ~C2 | (~C1 & ~C0);


endmodule
