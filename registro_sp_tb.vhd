--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:43:49 01/14/2014
-- Design Name:   
-- Module Name:   Z:/Documents/EUITI/DIGITAL/TrabajoSed/registro_sp_tb.vhd
-- Project Name:  TrabajoSed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registro_sp
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
 
ENTITY registro_sp_tb IS
END registro_sp_tb;
 
ARCHITECTURE behavior OF registro_sp_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro_sp
    PORT(
         ent : IN  std_logic;
         clk : IN  std_logic;
			dir : in STD_LOGIC:='0';
         rst : IN  std_logic;
         sal : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ent : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
	signal dir :  STD_LOGIC:='0';

 	--Outputs
   signal sal : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro_sp PORT MAP (
          ent => ent,
			 dir=> dir,
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
		wait for 10ns;
		
		assert sal="00000000"
		report "Fallo de Reset"
		severity failure;
		
		ent<='1';
		dir<='1';
		wait for 30ns;
		
		assert sal="10000000"
		report"Fallo desplazamiento 1"--PRimera Carga
		severity error;
		
		wait for 20 ns;
		
		assert sal="11000000"
		report"Fallo desplazamiento 2"--Segunda Carga
		severity error;
		
		ent<='0';
		wait for 20 ns;
		assert sal="11100000"
		report" Fallo desplazamiento 3"-- Tercera carga
		severity error;
		
		wait for 20 ns;
		assert sal="01110000"
		report" Fallo desplazamiento 4"--Cambio de sentido del desplazamiento y cuarta carga
		severity error;
		
		dir<='0';
		ent<='1';
		wait for 20 ns;
		
		assert sal="11100001"
		report " Fallo de dir y desplazamiento 5"-- Quinta carga
		severity error;
		
		wait for 5 ns;
		ent<='0';
		wait for 40 ns;
		assert sal="10000110"
		report"Fallo de desplazamiento 6"-- Sexto desplazamiento
		severity error;
		
		wait for 100 ns;
		assert false
		report"Fin de la Simulación"
		severity failure;
     
	end process;
END;
