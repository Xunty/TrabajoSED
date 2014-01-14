--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:41:20 01/14/2014
-- Design Name:   
-- Module Name:   Z:/Documents/EUITI/DIGITAL/TrabajoSed/Decoder_tb.vhd
-- Project Name:  TrabajoSed
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder
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
 
ENTITY Decoder_tb IS
END Decoder_tb;
 
ARCHITECTURE behavior OF Decoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    PORT(
         code : IN  std_logic_vector(3 downto 0);
         d_code : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
	 	
		
    

   --Inputs
   signal code : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal d_code : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 

 
	-- Instantiate the Unit Under Test (UUT)
   

	TYPE vtest is record 
				code : std_logic_vector(3 DOWNTO 0); 
				d_code : std_logic_vector(6 DOWNTO 0); 
		END RECORD; 
		
		TYPE vtest_vector IS ARRAY (natural RANGE <>) OF vtest; 
		
		CONSTANT test: vtest_vector := ( 
				(code => "0000", d_code => "0000001"), 
				(code => "0001", d_code => "1001111"), 
				(code => "0010", d_code => "0010010"), 
				(code => "0011", d_code => "0000110"), 
				(code => "0100", d_code => "1001100"), 
				(code => "0101", d_code => "0100100"), 
				(code => "0110", d_code => "0100000"), 
				(code => "0111", d_code => "0001111"), 
				(code => "1000", d_code => "0000000"), 
				(code => "1001", d_code=> "0000100"),  
				(code => "1010", d_code => "0001000"), --A
				(code => "1011", d_code => "1100000"),--B 
				(code => "1100", d_code => "0110001"), --C
				(code => "1101", d_code => "1000010"), --d
				(code => "1110", d_code => "0110000"), --F
				(code => "1111", d_code => "0111000") 
				);
		
BEGIN
   uut: decoder PORT MAP (
          code => code,
          d_code => d_code
        );
		  
		  
   -- Stimulus process
   stim_proc: process
   begin	
	
		FOR i IN 0 TO test'HIGH LOOP 
			code <= test(i).code; 
			WAIT FOR 20 ns; 		
			ASSERT d_code = test(i).d_code
			REPORT "Salida incorrecta." 
			SEVERITY Error; 
			
		END LOOP; 
		
		Assert False
		report " Simulación correcta."
		severity failure;
   end process;
	

END;
