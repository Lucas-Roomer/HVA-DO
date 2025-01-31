-- ------------------------------------------ --
-- Testbench for simulation of a push button  --
-- The button is assumed to be active low     --
--                                            --
--   Caspar Treijtel, 2024-11-27              --
-- ------------------------------------------ --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity button_debounce_testbench is
end entity button_debounce_testbench;

architecture testbench of button_debounce_testbench is
  component button_debounce is
	generic(N : integer := 6);
	port(
		clk : in std_logic;
		rst_n : in std_logic;
		button : in std_logic_vector(N-1 downto 0);
		prs_event : out std_logic_vector(N-1 downto 0));
  end component;

  for dut : button_debounce use entity work.button_debounce(behaviour);

  signal clk    : std_logic := '0';
  signal rst_n  : std_logic;
  signal button : std_logic_vector(5 downto 0);
  signal prs_event : std_logic_vector(5 downto 0);

  constant CLOCK_PERIOD : time := 20 ns;

begin
  dut : button_debounce
    port map(clk           => clk,
             rst_n         => rst_n,
             button        => button,
             prs_event   => prs_event);

  clk <= not clk after 0.5 * CLOCK_PERIOD;

  stimuli: process
    -- variable for random number generation
    variable seed1, seed2 : integer := 1;
    -- random real number 0-1
    variable rand_real  : real;
    variable rand_int   : integer;
    -- range of random values created
    variable rand_range : real := 100.0;

    constant bounce_num : positive := 20;
  begin
    -- Intitialize button
    button(0) <= '1';
    -- Initiate reset signal
    rst_n <= '1';
    wait for 2*CLOCK_PERIOD;
    rst_n <= '0';
    wait for 2*CLOCK_PERIOD;
    rst_n <= '1';
    wait for 50 ms;

    -- Button bounce behaviour
    button(0) <= '1';

    create_press_bounces: for i in 0 to (bounce_num-1) loop
      uniform(seed1, seed2, rand_real);
      rand_int := integer(rand_real * rand_range);

      button(0) <= '0';
      wait for rand_int * 1 us;
      button(0) <= '1';
      wait for rand_int * 1 us;
    end loop create_press_bounces;

    -- Now stable button for longer time
    button(0) <= '0';
    wait for 25 ms;

    create_release_bounces: for i in 0 to (bounce_num-1) loop
      uniform(seed1, seed2, rand_real);
      rand_int := integer(rand_real * rand_range);

      button(0) <= '1';
      wait for rand_int * 1 us;
      button(0) <= '0';
      wait for rand_int * 1 us;
    end loop create_release_bounces;

    -- And back to button not pressed
    button(0) <= '1';

    -- Done
    wait;
  end process stimuli;

end architecture testbench;
