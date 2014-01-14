--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:34:23 01/14/2014
-- Design Name:   
-- Module Name:   Z:/Documents/EUITI/DIGITAL/TrabajoSed/Mux_tb.vhd
-- Project Name:  TrabajoSed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mux_tb IS
END Mux_tb;
 
ARCHITECTURE behavior OF Mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          a => a,
          b => b,
          sel => sel,
          salida => salida
        );

  
   -- Stimulus process
   stim_proc: process
   begin		
			a <= "11111111";
			b<="10101010";
			wait for 20 ns;
			sel <= '1';
			wait for 10 ns;
			assert salida=b
			report"Fallo de Seleccion"
			severity error;
			
			b <= "11111111";
			a <= "00000000";
			wait for 20 ns;
			sel <= '0';
			wait for 10 ns;
			assert salida=a
			report "Fallo de seleccion"
			severity error;
			
			a <= "11111111";

			assert false 
			report "Fin de la simulación..." 
			severity failure;
   end process;

END;
