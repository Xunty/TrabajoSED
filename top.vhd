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
				dir : in STD_LOGIC;
				clock : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				digit : out  STD_LOGIC_VECTOR (3 downto 0);
				segment : out  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Structural of top is

		component registro_sp
		port(
				ent : in std_logic;
				dir : in std_logic;
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
		generic(nbits : integer := 8);
		port(
				a : in std_logic_vector(nbits-1 downto 0);
				b : in std_logic_vector(nbits-1 downto 0);
				sel : in std_logic;          
				salida : out std_logic_vector(nbits-1 downto 0)
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
		COMPONENT mux4
		PORT(
				a : IN std_logic_vector(7 downto 0);
				b : IN std_logic_vector(7 downto 0);
				c : IN std_logic_vector(7 downto 0);
				d : IN std_logic_vector(7 downto 0);
				sel : IN std_logic_vector(1 downto 0);          
				salida : OUT std_logic_vector(7 downto 0)
				);
		END COMPONENT;
		
		constant digit_i0 : std_logic_vector(3 downto 0) := "1110";
		constant digit_i1 : std_logic_vector(3 downto 0) := "1101";
		
		signal n_clk : std_logic;
		signal d_din : std_logic;
		signal registro : std_logic_vector(7 downto 0);
		signal segment_i0 : std_logic_vector(7 downto 0);
		signal segment_i1 : std_logic_vector(7 downto 0);
		signal segment_i2 : std_logic_vector(7 downto 0);
		signal segment_i3 : std_logic_vector(7 downto 0);
		signal sel1 : std_logic_vector(1 downto 0);
		signal sel2 : std_logic;
		signal seg0 : std_logic_vector(7 downto 0):="11111111";
		signal seg1 : std_logic_vector(7 downto 0):="11111111";

begin
		Inst_registro_sp: registro_sp PORT MAP(
				ent => d_din,
				dir => dir,
				clk => n_clk,
				rst => reset,
				sal => registro
		);
		Inst_prescaler: prescaler PORT MAP(
				in_50mhz => clock,
				rst => reset,
				out_2hz => n_clk
		);
		--Mux1: mux PORT MAP(
		--		a => segment_i0,
		--		b => segment_i1,
		--		sel => sel1,
		--		salida => segment
		--);
		Inst_mux4: mux4 PORT MAP(
				a => segment_i0,
				b => segment_i1,
				c => segment_i2,
				d => segment_i3,
				sel => sel1,
				salida => segment
	);
		Mux2: mux GENERIC MAP(4)
				PORT MAP(
				a => digit_i0,
				b => digit_i1,
				sel => sel2,
				salida => digit
		);
		Decoder0: decoder PORT MAP(
				code => registro(3 downto 0),
				d_code => seg0(7 downto 1)
		);
		Decoder1: decoder PORT MAP(
				code => registro(7 downto 4),
				d_code => seg1(7 downto 1)
		);
		Inst_debounce: debounce PORT MAP(
				ent => din,
				clk => clock,
				rst => reset,
				sal => d_din
		);
		
		process(clock, reset)
		begin
				if reset = '1' then
						segment_i0 <= "10010001";
						segment_i1 <= "00000011";
						segment_i2 <= "11100011";
						segment_i3 <= "00010001";
						if rising_edge(clock) then
								case sel1 is
										when "00" =>
												sel1 <= "01";
										when "01" =>
												sel1 <= "10";
										when "10" =>
												sel1 <= "11";
										when "11" =>
												sel1 <= "00";
										when others =>
												sel1 <= "00";
								end case;
						end if;
				
						--segment_i0 <= (others => '1');
						--segment_i1 <= (others => '1');
				elsif rising_edge(clock) then
						case sel1 is
								when "00" =>
										sel1 <= "01";
								when "01" =>
										sel1 <= "10";
								when "10" =>
										sel1 <= "11";
								when "11" =>
										sel1 <= "00";
								when others =>
										sel1 <= "00";
						end case;
						sel2 <= not sel2;
						segment_i0<=seg0;
						segment_i1<=seg1;
				end if;
		end process;
		

end Structural;

