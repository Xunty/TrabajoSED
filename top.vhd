----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:15 01/04/2014 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
		Port ( din : in  STD_LOGIC;
				clock : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				digit : out  STD_LOGIC_VECTOR (3 downto 0);
				segment : out  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Structural of top is

		component registro_sp
		port(
				ent : in std_logic;
				clk : in std_logic;
				rst : in std_logic;          
				sal : out std_logic_vector(7 downto 0)
				);
		end component;
		component prescaler
		port(
				in_50mhz : in std_logic;
				rst : in std_logic;          
				out_2hz : out std_logic
				);
		end component;
		component mux
		port(
				a : in std_logic_vector(3 downto 0);
				b : in std_logic_vector(3 downto 0);
				sel : in std_logic;          
				salida : out std_logic_vector(3 downto 0)
				);
		end component;
		component decoder
		port(
				code : in std_logic_vector(3 downto 0);          
				d_code : out std_logic_vector(6 downto 0)
				);
		end component;
		component debounce
		port(
				ent : in std_logic;
				clk : in std_logic;
				rst : in std_logic;          
				sal : out std_logic
				);
		end component;
		
		signal n_clk : std_logic;
		signal d_din : std_logic;
		signal registro : std_logic_vector(7 downto 0);
		signal segment_i0 : std_logic_vector(7 downto 0);
		signal segment_i1 : std_logic_vector(7 downto 0);

begin
		Inst_registro_sp: registro_sp PORT MAP(
				ent => d_din,
				clk => n_clk,
				rst => reset,
				sal => registro
		);
		Inst_prescaler: prescaler PORT MAP(
				in_50mhz => clock,
				rst => reset,
				out_2hz => n_clk
		);
		Inst_mux: mux PORT MAP(
				a => segment_i0,
				b => segment_i1,
				sel => clock,
				salida => segment
		);
		Decoder0: decoder PORT MAP(
				code => registro(3 downto 0),
				d_code => segment_i0(7 downto 1)
		);
		Decoder1: decoder PORT MAP(
				code => registro(7 downto 4),
				d_code => segment_i1(7 downto 1)
		);
		Inst_debounce: debounce PORT MAP(
				ent => din,
				clk => clock,
				rst => reset,
				sal => d_din
		);


end Structural;

