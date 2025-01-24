library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_extender is
	generic(my_delay : integer := 2);--the total division will be two to the power of this generic

	port(
		x : in std_logic;
		rst_n : in std_logic;
		clk : in std_logic;
		y : out std_logic);
end entity pulse_extender;



architecture behaviour of pulse_extender is
	signal counter : unsigned(my_delay-1 downto 0);
begin
	timing_proc : process(rst_n, clk) is
	begin
		if rst_n='0' then
			counter <= (others =>'0');
		elsif (rising_edge(clk)) then
			if x='1' then
				looper : for i in 0 to counter'length-1 loop
					counter(i) <= '1';
				end loop looper;
			elsif (not (counter=0)) then
				counter <= unsigned(counter- 1);
			end if;
		end if;
	end process timing_proc;
	
	output_proc : process(counter) is
	begin
		if (not (counter=0)) then
			y <= '1';
		else
			y <= '0';
		end if;
	end process output_proc;
end architecture behaviour;