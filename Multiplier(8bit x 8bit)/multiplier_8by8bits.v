`timescale 1ns / 1ps


module multiplier_8by8bits(
    input [7:0] mlt,
    input [7:0] mcd,
    input clk,
    input rst,
    input st,
    output [15:0] prod,output done
    );
   
    reg [16:0] product = 0;
    reg [3:0] counter = 4'b0000;
    reg k = 0;
    reg m=0;
    reg [1:0] state = 2'b00;
    reg [7:0] mcand =0;
    integer i;
   
    always @(posedge clk)begin
    if(~rst) begin
   
        case(state)
        2'b00 : begin
       
//            m = 0;
           
               if(st)begin
                product[7:0] <= mlt;
                product[16:8] <= 0;
                state <= 2'b01;
                k<=0;
                counter <=0;
                end 
                
                else begin 
                    state <=0;
                    k<=0;
                    counter <=0;
                    product <=0;
                end
               
            
           
            //product[7:0] <= multiplier;
            //state = 2'b01;
            end
        2'b01 : begin
              if(~k)begin
                m = product[0];
                //m = 1;
                //k = 1;
                if(m)begin
                    state <= 2'b10;
                end
                else if(~m)begin
                    product = product >> 1 ;
                    counter = counter + 1 ;
                    if(counter == 8) 
                        k <= 1;  
                    
                    state <= 2'b01;
                    
                 end
                 end
              else if(k) begin
                    
                    //product = product >> 1;
                    state = 2'b11;
                    end
               
                
                
            end
        2'b10: begin                  
                product[16:8] = product[15:8] + mcd;
                counter = counter + 1;
                product = product >> 1;
                if(counter == 8) begin
                    k <= 1;
                    
                end
                state <= 2'b01;
            end
           
        2'b11 : begin
               
                // product <= 0;
               
                   if(~st)begin
                    k=0;
                    state <= 2'b00;
                    end 
                    else
                       
                        state <= 2'b11;
                
            end
           
        default: begin
            state <= 0;
            product <= 0;
            counter <= 0;
            k <= 0;
        end
         
           
        endcase
    end
    else begin
        state <= 2'b00;
        k <= 0;
        counter <= 0;
    end
    end
   
    assign prod = product[15:0];
    assign done = k;
   
endmodule
