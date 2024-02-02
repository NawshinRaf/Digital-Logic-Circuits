`timescale 1ns / 1ps



module ripple_CarryAdder_4bits_tb();
  reg [0:3]  inputX,inputY;
  reg  inputZ;
	wire [0:3] Sum;
	wire  CarryOut;


Ripple_CarryAdder_4bits Instance_1_of_Adder(
  
  .Sum(Sum),
  .CarryOut(CarryOut),
  .A(inputX),
  .B(inputY),
  .CarryIn(inputZ));

initial
begin
	
	//Initialize the X,Y and Z inputs
	inputX= 4'b0000;
	inputY=4'b0000;
 	inputZ=0;
 	#50
 	
 	for(integer i=0;i<15;i=i+1) begin
 	inputX = inputX+1;
 	
 	for(integer j=0;j<15;j=j+1) begin
 	  inputY = inputY+1;
 	  
 	  for(integer k=0;k<2;k=k+1) begin
 	   inputZ=k;
 	    #50;
 	  end
 	  
 	
 	end
 	
 	end

	

	end 
