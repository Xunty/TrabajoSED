----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:27 01/04/2014 
-- Design Name: 
-- Module Name:    debounce - Behavioral 
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


entity debounce is
		Port ( ent : in  STD_LOGIC;
				clk : in  STD_LOGIC;
				rst : in  STD_LOGIC;
				sal : out  STD_LOGIC);
end debounce;

architecture Behavioral of debounce is

		signal Q1, Q2, Q3 : std_logic := '0';

begin

		process(clk)
		begin
				if (clk'event and clk = '1') then
						if (reset = '1') then
								Q1 <= '0';
								Q2 <= '0';
								Q3 <= '0'; 
						else
								Q1 <= q_in;
								Q2 <= Q1;
								Q3 <= Q2;
						end if;
				end if;
		end process;
	
		q_out <= Q1 and Q2 and (not Q3);

end Behavioral;

