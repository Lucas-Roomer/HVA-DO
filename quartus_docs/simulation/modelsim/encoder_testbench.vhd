library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encoder_testbench is
end entity encoder_testbench;

architecture testbench of encoder_testbench is
  component encoder is
	port(
		din : in std_logic_vector(3 downto 0);
		sign : in std_logic;
		dout : out std_logic_vector(15 downto 0));
  end component;

  for dut : encoder use entity work.encoder(behaviour);

  signal din  : std_logic_vector(3 downto 0);
  signal sign  : std_logic;
  signal dout  : std_logic_vector(15 downto 0);


  constant CLOCK_PERIOD : time := 20 ns;

begin
  dut : encoder
    port map(din           => din,
             sign          => sign,
             dout          => dout);


  stimuli: process
  begin
	sign <= '0';
	din <= "1011";
	wait for CLOCK_PERIOD;
	sign <= '1';
	din <= "1111";
	wait;
	end process stimuli;

end architecture testbench;