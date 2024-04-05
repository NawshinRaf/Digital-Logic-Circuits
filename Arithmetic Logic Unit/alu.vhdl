library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
-----------------------------------------------
---------- ALU 8-bit VHDL ---------------------
-----------------------------------------------
entity alu_8bit is
  generic ( 
     constant N: natural := 1  -- number of shifted or rotated bits
    );
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 2 inputs 8-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(3 downto 0);  -- 1 input 4-bit for selecting function
    Operation_Out   : out  STD_LOGIC_VECTOR(15 downto 0); -- 1 output 8-bit 
    Cout : out std_logic        -- Carryout flag
    );
end alu_8bit; 



architecture Behavioral of alu_8bit is

signal ALU_Result : std_logic_vector (15 downto 0);
signal tmp: std_logic_vector (8 downto 0);


begin
   process(A,B,ALU_Sel)
 begin
  case(ALU_Sel) is
  when "0000" => -- Addition
   ALU_Result <= std_logic_vector(to_signed(to_integer((15 downto 8 => A(7)) & signed(A)) + to_integer((15 downto 8 => B(7)) & signed(B)),16)) ;
		
  when "0001" => -- Subtraction
	
	ALU_Result <=  std_logic_vector(to_signed(to_integer(((15 downto 8 => A(7)) & signed(A))) - to_integer(((15 downto 8 => B(7)) & signed(B))),16)) ;
	
	
  when "0010" => -- Multiplication
   ALU_Result <= std_logic_vector(to_signed((to_integer(signed(A)) * to_integer(signed(B))),16)) ; --signed integer
  when "0011" => -- Division
   ALU_Result <= (15 downto 8 => '0') & (std_logic_vector(to_signed(to_integer(signed(A)) / to_integer(signed(B)),8))) ;
  when "0100" => -- Logical shift left
   ALU_Result <= (15 downto 8 => '0') & (std_logic_vector(unsigned(A) sll N));
  when "0101" => -- Logical shift right
   ALU_Result <= (15 downto 8 => '0') & (std_logic_vector(unsigned(A) srl N));
  when "0110" => --  Rotate left
   ALU_Result <= (15 downto 8 => '0') & (std_logic_vector(unsigned(A) rol N));
  when "0111" => -- Rotate right
   ALU_Result <= (15 downto 8 =>'0') & (std_logic_vector(unsigned(A) ror N));
  when "1000" => -- Logical and 
   ALU_Result <= (15 downto 8 =>'0') & (A and B);
  when "1001" => -- Logical or
   ALU_Result <= (15 downto 8 => '0') & (A or B);
  when "1010" => -- Logical xor 
   ALU_Result <= (15 downto 8  => '0') & (A xor B);
  when "1011" => -- Logical nor
   ALU_Result <= (15 downto 8 => '0') & (A nor B);
  when "1100" => -- Logical nand 
   ALU_Result <= (15 downto 8 =>'0') & (A nand B);
  when "1101" => -- Logical xnor
   ALU_Result <= (15 downto 8 => '0') & (A xnor B);
  when "1110" => -- Greater comparison
   if(A>B) then
    ALU_Result <= (15 downto 8 => '0') & (x"01") ;
   else
    ALU_Result <= (15 downto 8 => '0') &(x"00") ;
   end if; 
  when "1111" => -- Equal comparison   
   if(A=B) then
    ALU_Result<= (15 downto 8 => '0') & (x"01") ;
   else
    ALU_Result <= (15 downto 8 => '0') & (x"00") ;
   end if;
  when others => ALU_Result <= (15 downto 8 => '0') & (std_logic_vector(to_signed(to_integer(signed(A)) + to_integer(signed(B)),8))); 
  end case;
 end process;
 Operation_Out <= ALU_Result; -- ALU out
 tmp <= ('0' & A) + ('0' & B);
 Cout <= tmp(8); -- Carryout flag
end Behavioral;
