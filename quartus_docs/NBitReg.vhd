library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NBitReg is
	generic (N : integer := 4);
	port(	D: in std_logic_vector(N-1 downto 0);
			clk: in std_logic;
			enable : in std_logic;
			Q : out std_logic_vector(N-1 downto 0));
end entity NBitReg;

architecture behaviour of NBitReg is
begin
	dflipflop : process(D,clk) is
	begin
		if rising_edge(clk) then
			if enable = '1' then
				Q <= D;
			end if;
		end if;
	end process dflipflop;
end architecture behaviour;