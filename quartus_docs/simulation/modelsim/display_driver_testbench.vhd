library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_driver_testbench is
end entity  display_driver_testbench;

architecture testbench of  display_driver_testbench is
  component  display_driver is
    		port(
		d0 : in std_logic_vector(3 downto 0);
		d1 : in std_logic_vector(3 downto 0);
		d2 : in std_logic_vector(3 downto 0);
		sign : in std_logic;
		clk : in std_logic;
		rst_n : in std_logic;
		dclk : out std_logic;
		SDI : out std_logic;
		LE : out std_logic;
		OEn : out std_logic);
  end component;

  for dut :  display_driver use entity work. display_driver(behaviour);

  signal clk    : std_logic := '1';
  signal rst_n  : std_logic;
  signal d0 : std_logic_vector(3 downto 0);
  signal d1 : std_logic_vector(3 downto 0);
  signal d2 : std_logic_vector(3 downto 0);
  signal sign : std_logic;
  signal dclk : std_logic;
  signal SDI : std_logic;
  signal LE : std_logic;

  constant CLOCK_PERIOD : time := 20 ns;

begin
  dut : display_driver
    port map(	d0		=> d0,
		d1		=> d1,
		d2		=> d2,
		sign		=> sign,
		rst_n		=> rst_n,
		clk		=> clk,
		dclk		=> dclk,
		SDI		=> SDI,
		LE		=> LE);

  clk <= not clk after 0.5 * CLOCK_PERIOD;

  stimuli: process
  begin
	rst_n <= '0';
	wait for CLOCK_PERIOD;
	rst_n <= '1';
	wait for CLOCK_PERIOD;
	sign <= '1';
	d0 <= "0001";
	d1 <= "0001";
	d2 <= "0000";
	wait;
	end process stimuli;

end architecture testbench;