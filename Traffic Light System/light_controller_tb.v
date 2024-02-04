`timescale 1 ns / 1 ps


module light_controller_tb();
reg InputC2,InputC1,InputC0;
wire G1;
wire G2;
wire R1;
wire R2;
wire Y1;
wire Y2;
	

light_controller Instance_1_of_Adder(
  .C0(InputC0),
  .C1(InputC1),
  .C2(InputC2),
  .G1(G1),
  .G2(G2),
  .R1(R1),
  .R2(R2),
  .Y1(Y1),
  .Y2(Y2));

initial
begin
	InputC2=0;
	InputC1=0;
 	InputC0=0;

	#50
	InputC2=0;
	InputC1=0;
 	InputC0=1;

	#50
	InputC2=0;
	InputC1=1;
 	InputC0=0;

	#50
	InputC2=0;
	InputC1=1;
 	InputC0=1;

	#50
	InputC2=1;
	InputC1=0;
 	InputC0=0;

	#50
	InputC2=1;
	InputC1=0;
 	InputC0=1;

	#50
	InputC2=1;
	InputC1=1;
 	InputC0=0;

	#50
	InputC2=1;
	InputC1=1;
 	InputC0=1;

	end 
endmodule
