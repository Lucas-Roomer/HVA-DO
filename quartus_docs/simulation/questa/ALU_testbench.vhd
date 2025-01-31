library ieee;
use ieee.std_logic_1164.all;

entity ALU_testbench is
end entity ALU_testbench;

architecture testbench of ALU_testbench is
	component ALU is
		port(A,B,OPC	: 	in std_logic_vector(3 downto 0);
		Z   		:	out std_logic_vector(3 downto 0);
		Ci, sign	:	in std_logic;
		Co, ovfl	: 	out std_logic);
	end component;
	
	for DUT : ALU use entity work.ALU(behaviour);
	
		signal A,B,OPC		:  std_logic_vector(3 downto 0);
		signal Z   			:	std_logic_vector(3 downto 0);
		signal Ci, sign	:	std_logic;
		signal Co, ovfl	: 	std_logic;
		constant xtime : time := 20 ns;
begin

	DUT : ALU 	
	port map(A => A, B => B, OPC => OPC, Z => Z, Ci => ci, sign => sign, Co => Co, ovfl => ovfl);
	
	stimuli: process
	begin
		-- Initiële waarden van de inputs
		A <= "0110";
		B <= "1011";
		Ci <= '0';
		sign <= '0';
		OPC <= "0000";
		
		wait for 0.5* xtime;
		OPC <= "0001";
		wait for 0.5* xtime;
		OPC <= "0010";
		wait for 0.5* xtime;
		OPC <= "0011";
		wait for 0.5* xtime;
		OPC <= "0100";
		wait for 0.5* xtime;
		OPC <= "0101";
		wait for 0.5* xtime;
		OPC <= "0110";
		wait for 0.5* xtime;
		OPC <= "0111";
		wait for 0.5* xtime;
		OPC <= "1001";
		wait for 0.5* xtime;
		OPC <= "1010";
		wait for 0.5* xtime;
		OPC <= "1011";
		wait for 0.5* xtime;
		OPC <= "1100";
		wait for 0.5* xtime;
		OPC <= "1101";
		wait for 0.5* xtime;
		OPC <= "1110";
		wait for 0.5* xtime;
		OPC <= "1111";
		wait;
	end process stimuli;
end architecture testbench;