library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_handler_no_debounce_testbench is
end entity  input_handler_no_debounce_testbench;

architecture testbench of  input_handler_no_debounce_testbench is
component input_handler_no_debounce is
	port(
		clk : in std_logic;
		rst_n : in std_logic;
		button : in std_logic_vector(4 downto 0);
		man_clk : in std_logic;
		ALU_res : in std_logic_vector(3 downto 0);
		ALU_flags : in std_logic_vector(1 downto 0);
		current_inputs : out std_logic_vector(3 downto 0);
		input_sign : out std_logic;
		input_A : out std_logic_vector(3 downto 0);
		input_B : out std_logic_vector(3 downto 0);
		input_OP : out std_logic_vector(3 downto 0);
		output_res : out std_logic_vector(3 downto 0);
		output_flags : out std_logic_vector(3 downto 0));
end component input_handler_no_debounce;

	for dut : input_handler_no_debounce use entity work.input_handler_no_debounce(behaviour);

	signal clk    : std_logic := '1';
	signal rst_n  : std_logic;
	signal button : std_logic_vector(4 downto 0);
	signal man_clk : std_logic;
	signal ALU_res : std_logic_vector(3 downto 0);
	signal ALU_flags : std_logic_vector(1 downto 0);
	signal current_inputs : std_logic_vector(3 downto 0);
	signal input_sign : std_logic;
	signal input_A : std_logic_vector(3 downto 0);
	signal input_B : std_logic_vector(3 downto 0);
	signal input_OP : std_logic_vector(3 downto 0);
	signal output_res : std_logic_vector(3 downto 0);
	signal output_flags : std_logic_vector(3 downto 0);

	constant CLOCK_PERIOD : time := 20 ns;

begin
	dut : input_handler_no_debounce
	port map(	clk => clk,
			rst_n => rst_n,
			button => button,
			man_clk => man_clk,
			ALU_res => ALU_res,
			ALU_flags => ALU_flags,
			current_inputs => current_inputs,
			input_sign => input_sign,
			input_A => input_A,
			input_B => input_B,
			input_OP => input_OP,
			output_res => output_res,
			output_flags => output_flags);

	clk <= not clk after 0.5 * CLOCK_PERIOD;

	stimuli: process
	begin
		ALU_res <= "1111"; -- presume previous output was -1
		ALU_flags <= "00";
		button <= "00000";
		man_clk <= '0';
		rst_n <= '0';
		wait for CLOCK_PERIOD;
		
		rst_n <= '1';
		wait for CLOCK_PERIOD;
		
		button <= "10101"; --switch to sing mode and enter 5
		wait for CLOCK_PERIOD;
		button <= "00000";

		man_clk <= '1'; --latch into A
		wait for CLOCK_PERIOD;
		man_clk <= '0';

		button <= "01011"; --enter -2 (old switch positions where 10101)
		wait for CLOCK_PERIOD;
		button <= "00000";

		man_clk <= '1'; --latch into B
		wait for CLOCK_PERIOD;
		man_clk <= '0';

		button <= "01100"; --enter A+B old switch positions where 11110)
		wait for CLOCK_PERIOD;
		button <= "00000";

		man_clk <= '1'; --latch into OP
		wait for CLOCK_PERIOD;
		man_clk <= '0';

		
		ALU_res <= "0000"; --presume output is 0 and an overflow happened
		ALU_flags <= "01";
		wait for CLOCK_PERIOD;


		man_clk <= '1'; --latch output
		wait for CLOCK_PERIOD;
		man_clk <= '0';
		
		
		wait;
	end process stimuli;

end architecture testbench;