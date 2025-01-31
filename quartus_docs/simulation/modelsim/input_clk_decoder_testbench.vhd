library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_clk_decoder_testbench is
end entity  input_clk_decoder_testbench;

architecture testbench of  input_clk_decoder_testbench is
component input_clk_decoder is
	port(
		man_clk : in std_logic;
		clk : in std_logic;
		rst_n : in std_logic;
		output : out std_logic_vector(3 downto 0));
	end component input_clk_decoder;

	for dut : input_clk_decoder use entity work. input_clk_decoder(behaviour);

	signal clk    : std_logic := '1';
	signal rst_n  : std_logic;
	signal output : std_logic_vector(3 downto 0);
	signal man_clk : std_logic;

	constant CLOCK_PERIOD : time := 20 ns;

begin
	dut : input_clk_decoder
	port map(	man_clk		=> man_clk,
			rst_n		=> rst_n,
			clk		=> clk,
			output		=> output);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process
	begin
		rst_n <= '0';
		wait for CLOCK_PERIOD;
		rst_n <= '1';
		wait for CLOCK_PERIOD;
		man_clk <= '1';
		wait for CLOCK_PERIOD;
		man_clk <= '0';
		wait for CLOCK_PERIOD*2;
		man_clk <= '1';
		wait for CLOCK_PERIOD;
		man_clk <= '0';
		wait for CLOCK_PERIOD*2;
		man_clk <= '1';
		wait for CLOCK_PERIOD;
		man_clk <= '0';
		wait for CLOCK_PERIOD*2;
		man_clk <= '1';
		wait for CLOCK_PERIOD;
		man_clk <= '0';
		wait for CLOCK_PERIOD*2;
		man_clk <= '1';
		wait for CLOCK_PERIOD;
		man_clk <= '0';
		wait for CLOCK_PERIOD*2;
		wait;
	end process stimuli;

end architecture testbench;