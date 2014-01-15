--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:29:07 01/14/2014
-- Design Name:   
-- Module Name:   Z:/Documents/EUITI/DIGITAL/TrabajoSed/prescaler_tb.vhd
-- Project Name:  TrabajoSed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: prescaler
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
 
ENTITY prescaler_tb IS
END prescaler_tb;
 
ARCHITECTURE behavior OF prescaler_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT prescaler
	 
    PORT(
         in_50mhz : IN  std_logic;
         rst : IN  std_logic;
         out_2hz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_50mhz : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal out_2hz : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant in_50mhz_period : time := 20ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: prescaler PORT MAP (
          in_50mhz => in_50mhz,
          rst => rst,
          out_2hz => out_2hz
        );

   -- Clock process definitions
   in_50mhz_process :process
   begin
		in_50mhz<= '0';
		wait for in_50mhz_period/2;
		in_50mhz<= '1';
		wait for in_50mhz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	rst <= '1' after 0.25*in_50mhz ,'0' after in_50mhz_period/2;
	
     for i in 0 to 500 LOOP
				wait for 0.01*in_50mhz;
				assert out_2hz='1'
				report"Fallo clock bajo"
				severity error;
	  
				wait for 10 ns;
				assert out_2hz='0';
				report"Fallo clock alto"
				severity error;
	  end Loop;
	  
	  wait for 100100000 ns;
	  assert false
	  report"Fin de La simulacion"
	  severity failure;
	 

      
   end process;

END;
