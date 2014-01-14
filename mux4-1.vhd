----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:04 01/14/2014 
-- Design Name: 
-- Module Name:    mux4-1 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux4 is
		generic (
				nbits : integer := 8
				);
		port ( a : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
				b : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
				c : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
				d : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
				sel : in  STD_LOGIC_VECTOR (1 downto 0);
				salida : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end mux4;

architecture Behavioral of mux4 is

signal salida_i: std_logic_vector(nbits - 1 DOWNTO 0);

begin

		mux4:
		process(sel,a,b,c,d)
		begin
				case sel is
						when "00" =>
							salida_i <= a;
						when "01" =>
							salida_i <= b;
						when "10" =>
							salida_i <= c;
						when "11" =>
							salida_i <= d;
						when others =>
							salida_i <= a;
				end case;
		end process mux4;
		
		salida <= salida_i;


end Behavioral;

