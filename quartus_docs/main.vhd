library ieee;
use ieee.std_logic_1164.all;

entity eindopdracht is
	port(
		--system inputs
		clk : in std_logic;
		rst_n : in std_logic
		
		--user_inputs
		SW : in std_logic_vector(4 downto 0);
		KEY : in std_logic_vector(1 downto 0);
		
		--outputs
		SW_LED : out std_logic_vector(4 downto 0);
		LED : out std_logic_vector(7 downto 0);
		
		--display interface outputs
		dclk : out std_logic;
		SDI : out std_logic;
		LE : out std_logic;
		OEn : out std_logic);
end entity opdracht_231;

architecture behaviour of eindopdracht is
	signal ALU_res : std_logic_vector(3 downto 0);
	signal ALU_flags : std_logic_vector(1 downto 0);
	signal current_inputs : std_logic_vector(3 downto 0);
	signal input_sign : std_logic;
	signal input_A : std_logic_vector(3 downto 0);
	signal input_B : std_logic_vector(3 downto 0);
	signal input_OP : std_logic_vector(3 downto 0);
	signal output_res : std_logic_vector(3 downto 0);
	signal output_flags : std_logic_vector(3 downto 0);



	component input_handler
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
	end component input_handler;
	

	component display_driver 
		port(
			clk : in std_logic;
			rst_n : in std_logic;
			d0 : in std_logic_vector(3 downto 0);
			d1 : in std_logic_vector(3 downto 0);
			d2 : in std_logic_vector(3 downto 0);
			sign : in std_logic;
			dclk : out std_logic;
			SDI : out std_logic;
			LE : out std_logic;
			OEn : out std_logic);
	end component encoder;
begin

	main_input_handler : input_handler port map(
		clk => clk,
		rst
	
	
	main_display_driver : display_driver port map(
		clk => clk,
		rst_n => rst_n,
		d0 => input_A,
		d1 => input_B,
		d2 => output_res,
		sign => input_sign,
		dclk => dclk,
		SDI => SDI,
		LE => LE,
		OEn => OEn);
		
		
	SW_led <= input_sign & current_inputs
	LED <= output_flags & input_OP
end architecture behaviour;