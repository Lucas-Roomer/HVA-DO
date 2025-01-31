library ieee;
use ieee.std_logic_1164.all;

entity NBitReg_testbench is
end entity NBitReg_testbench;

architecture testbench of NBitReg_testbench is
	component NBitReg is
		generic (N : integer := 4);
		port(	clk, enable : in std_logic;
			d : in std_logic_vector(N-1 downto 0);
			q : out std_logic_vector(N-1 downto 0));
	end component;
	
	for DUT : NBitReg use entity work.NBitReg(behaviour);

	signal clk, enable : std_logic := '1';
	signal d, q : std_logic_vector(3 downto 0);
	constant CLOCK_PERIOD : time := 20 ns;
begin

	DUT : NBitReg 
	generic map(N => 4)	
	port map(	clk => clk,	
			d => d, 
			q => q, 
			enable => enable);
	
	clk <= not clk after 0.5 * CLOCK_PERIOD;
	
	stimuli: process
	begin
		-- Initiële waarden van de inputs
		d <= "0000";
		wait for 1.0 * CLOCK_PERIOD;

		-- Vul zelf de stimuli aan voor een periode van 100 ns
		-- Als laatste heb je een wait statement
		wait;
	end process stimuli;
end architecture testbench;