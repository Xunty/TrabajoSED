--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:43:01 01/15/2014
-- Design Name:   
-- Module Name:   Z:/Documents/EUITI/DIGITAL/TrabajoSed/top_tb.vhd
-- Project Name:  TrabajoSed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         din : IN  std_logic;
         dir : IN  std_logic;
         clock : IN  std_logic;
         reset : IN  std_logic;
         digit : OUT  std_logic_vector(3 downto 0);
         segment : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic := '0';
   signal dir : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal digit : std_logic_vector(3 downto 0);
   signal segment : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 2 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          din => din,
          dir => dir,
          clock => clock,
          reset => reset,
          digit => digit,
          segment => segment
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1','0' after 330 ns;
		din <= '1' after 360 ns,
					'0' after 400 ns,
					'1' after 440 ns,
					'0' after 500 ns,
					'1' after 520 ns,
					'0' after 600 ns,
					'1' after 640 ns;
		
		wait for 1000000000 ns;
		
		assert false
		report"fin de la simulacion"
		severity failure;
		
	
		
		
		

   end process;

END;
