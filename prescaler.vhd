----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:19:44 01/04/2014 
-- Design Name: 
-- Module Name:    prescaler - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



--Usaremos el prescaler para convertir nuestra señal de reloj de 50 Mhz
--en una señal de reloj de 2 hz

entity prescaler is
		Port ( in_50mhz : in  STD_LOGIC;
				rst : in  STD_LOGIC;
				out_2hz : out  STD_LOGIC);
end prescaler;

architecture Behavioral of prescaler is
		signal prescaler : unsigned(23 downto 0);
		signal out_2hz_i : std_logic;
		
begin
		generador : process (in_50mhz, rst)
		begin
				if rst = '1' then
						out_2hz_i   <= '0';
						prescaler   <= (others => '0');
				elsif rising_edge(in_50mhz) then
						if prescaler = 50000000/4 then
								prescaler   <= (others => '0');
								out_2hz_i   <= not out_2hz_i;
						else
								prescaler <= prescaler + 1;
						end if;
				end if;
		end process;

		out_2hz <= out_2hz_i;

end Behavioral;

