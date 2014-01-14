--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:48:08 01/14/2014
-- Design Name:   
-- Module Name:   Z:/Documents/EUITI/DIGITAL/TrabajoSed/debounce_tb.vhd
-- Project Name:  TrabajoSed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: debounce
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
 
ENTITY debounce_tb IS
END debounce_tb;
 
ARCHITECTURE behavior OF debounce_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT debounce
    PORT(
         ent : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         sal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ent : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal sal : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: debounce PORT MAP (
          ent => ent,
          clk => clk,
          rst => rst,
          sal => sal
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1','0' after 20 ns;
			ent <= '1' after 45 ns;
			wait for 15 ns;
			assert sal='0'
			report "Fallo de Reset"
			severity error;
			
			wait for 35 ns;
			assert sal='0'
			report "fallo de bloqueo 1"
			severity error;
			
			wait for 35 ns;
			assert sal='1'
			report"Fallo de bloqueo 2"
			severity error;
			
		

			wait for clk_period*15;
			
			assert false 
					report "Fin de la simulación..." 
					severity failure;

		end process;

END;
