library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_extender_testbench is
end entity  pulse_extender_testbench;

architecture testbench of  pulse_extender_testbench is
  component  pulse_extender is
    	generic(my_delay : integer := 2);
	port(
		x : in std_logic;
		rst_n : in std_logic;
		clk : in std_logic;
		y : out std_logic);
  end component;

  for dut :  pulse_extender use entity work. pulse_extender(behaviour);

  signal clk    : std_logic := '1';
  signal rst_n  : std_logic;
  signal x  : std_logic;
  signal y  : std_logic;

  constant CLOCK_PERIOD : time := 20 ns;

begin
  dut : pulse_extender
    port map(clk           => clk,
             rst_n         => rst_n,
             x             => x,
             y             => y);

  clk <= not clk after 0.5 * CLOCK_PERIOD;

  stimuli: process
  begin
	rst_n <= '0';
	wait for CLOCK_PERIOD;
	rst_n <= '1';
	x <= '1';
	wait for CLOCK_PERIOD;
	x <= '0';
	wait for 6*CLOCK_PERIOD;
	x <= '1';
	wait for CLOCK_PERIOD;
	x <= '0';
	wait for 2*CLOCK_PERIOD;
	x <= '1';
	wait for CLOCK_PERIOD;
	x <= '0';
	wait;
	end process stimuli;

end architecture testbench;