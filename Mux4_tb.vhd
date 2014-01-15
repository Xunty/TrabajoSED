--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:58:47 01/15/2014
-- Design Name:   
-- Module Name:   Z:/Documents/EUITI/DIGITAL/TrabajoSed/Mux4_tb.vhd
-- Project Name:  TrabajoSed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux4
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
 
ENTITY Mux4_tb IS
END Mux4_tb;
 
ARCHITECTURE behavior OF Mux4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         c : IN  std_logic_vector(7 downto 0);
         d : IN  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal c : std_logic_vector(7 downto 0) := (others => '0');
   signal d : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4 PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          sel => sel,
          salida => salida
        );

   -- Clock process definitions
   
 a<="11111111";
 b<="11110000";
 c<="00001111";
 d<="00000000";

   -- Stimulus process
   stim_proc: process
   begin		
   sel<="00";
	wait for 10 ns;
	
	assert salida=a
	report " Fallo de Seleccion 0"
	severity error;
	wait for 10 ns;
	
	
	sel<="01";
	wait for 10 ns;
	
	
	assert salida=b
	report " Fallo de  Seleccion 1"
	severity error;
	wait for 10ns;
	
	
	sel<="10";
	wait for 10 ns;
	
	
	
	assert salida=c
	report " Fallo de Seleccion 2"
	severity error;
	
	
	wait for 10 ns;
	sel<="11";
	wait for 10 ns;
	
	assert salida=d
	report " Fallo de  Seleccion 3"
	severity error;
	wait for 10ns;
	
	assert false
	report "Fin de la simulacion"
	severity failure;
	
	
	

   end process;

END;
