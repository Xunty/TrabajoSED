----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:46 01/04/2014 
-- Design Name: 
-- Module Name:    decoder - Dataflow 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder is
		Port ( code : in  STD_LOGIC_VECTOR (3 downto 0);
				d_code : out  STD_LOGIC_VECTOR (6 downto 0));
end decoder;

architecture Dataflow of decoder is

begin
		with code select 
				d_code <= 	"0000001" when "0000",
								"1001111" when "0001",
								"0010010" when "0010",
								"0000110" when "0011",
								"1001100" when "0100",
								"0100100" when "0101",
								"0100000" when "0110",
								"0001111" when "0111",
								"0000000" when "1000",
								"0000100" when "1001",
								"0001000" when "1010",--A
								"1100000" when "1011",--b
								"0110001" when "1100",--C
								"1000010" when "1101",--d
								"0110000" when "1110",--E
								"0111000" when "1111",--F
								"1111110" when others;

end Dataflow;

