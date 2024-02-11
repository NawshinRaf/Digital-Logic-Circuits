module digit5_bcd(number,tenthousand_seg7, thousand_seg7, hundred_seg7, ten_seg7, one_seg7);
 // I/O Signal Definitions 
input [15:0] number; 
// 16-bit binary number 
reg [3:0] tenthousands; 
reg [3:0] thousands; 
reg [3:0] hundreds;
reg [3:0] tens; 
reg [3:0] ones;
output [6:0] tenthousand_seg7;
output [6:0] thousand_seg7;
output [6:0] hundred_seg7; 
output [6:0] ten_seg7; 
output [6:0] one_seg7;
 // Internal variable for storing bits 
reg [36:0] shift;
 integer i;
 always @(number) begin // Clear previous number and store new number in shift register shift[36:16] = 0; 
shift[15:0] = number;
 // Loop sixteen times 
for (i=0; i<16;i=i+1) begin
 if (shift[19:16] >= 5)
shift[19:16] = shift[19:16] + 3; 
 if (shift[23:20] >= 5) 
shift[23:20] = shift[23:20] + 3;
 if (shift[27:24] >= 5) 
shift[27:24] = shift[27:24] + 3;
 if (shift[31:28] >= 5) 
shift[31:28] = shift[31:28] + 3;
 if (shift[35:32] >= 5) 
shift[35:32] = shift[35:32] + 3;
 // Shift entire register left once 
shift = shift << 1; 
end  
 // Push decimal numbers to output
tenthousands [3:0] = shift[35:32];
thousands [3:0] = shift[31:28];
hundreds [3:0] = shift[27:24];
tens [3:0] = shift[23:20];
 ones [3:0] = shift[19:16];
 end 
segment7 bcd_seg7tth (.bcd(tenthousands), .seg(tenthousand_seg7));
segment7 bcd_seg7th (.bcd(thousands), .seg(thousand_seg7));
segment7 bcd_seg7h (.bcd(hundreds), .seg(hundred_seg7)); 
segment7 bcd_seg7t (.bcd(tens), .seg(ten_seg7));
segment7 bcd_seg7o (.bcd(ones), .seg(one_seg7)); 
endmodule
