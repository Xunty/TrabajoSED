----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:59 01/04/2014 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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


entity mux is
		generic (
				nbits : integer := 8
		);
		port ( a : in  std_logic_vector (nbits-1 downto 0);
				b : in  std_logic_vector (nbits-1 downto 0);
				sel : in  std_logic;
				salida : out  std_logic_vector (nbits-1 downto 0));
end mux;

architecture Behavioral of mux is

		signal salida_i: std_logic_vector(nbits - 1 DOWNTO 0);

begin

		mux:
		process(a,b,sel)
		begin
				case sel is
						when '0' =>
							salida_i <= a;
						when '1' =>
							salida_i <= b;
						when others =>
							salida_i <= a;
				end case;
		end process mux;
		
		salida <= salida_i;

end Behavioral;

