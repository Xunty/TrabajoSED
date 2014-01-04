----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:33:14 01/03/2014 
-- Design Name: 
-- Module Name:    registro_sp - Behavioral 
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


entity registro_sp is
		Port ( ent : in  STD_LOGIC;
				clk : in  STD_LOGIC;
				rst : in  STD_LOGIC;
				sal : out  STD_LOGIC_VECTOR (7 downto 0));
end registro_sp;

architecture Behavioral of registro_sp is

		signal ent_i : std_logic;
		signal sal_i : std_logic_vector (7 downto 0);
		
begin

		process(ent)
		begin
				if ent = '1' then
						ent_i <= '1';
				end if;						
		end process;
		
		process(clk)
		begin
				if rst = '1' then
						ent_i <= '0';
						sal_i <= (others => '0');						
				elsif rising_edge(clk) then
						sal_i(0) <= ent_i;
						sal_i(1) <= sal_i(0);
						sal_i(2) <= sal_i(1);
						sal_i(3) <= sal_i(2);
						sal_i(4) <= sal_i(3);
						sal_i(5) <= sal_i(4);
						sal_i(6) <= sal_i(5);
						sal_i(7) <= sal_i(6);
						ent_i <= '0';
				end if;
		end process;
		
		sal <= sal_i;
				

end Behavioral;

