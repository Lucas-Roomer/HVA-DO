library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity button_debounce is
	generic(N : integer := 6);
	port(
		clk : in std_logic;
		rst_n : in std_logic;
		button : in std_logic_vector(N-1 downto 0);
		prs_event : out std_logic_vector(N-1 downto 0));
end entity button_debounce;

architecture behaviour of button_debounce is
	signal clk_div_counter : unsigned(18 downto 0); --division by 2^19 =~500 000 which will be a pulse every ~10 ms when running at 50 MHz
	signal clk_div : std_logic;
	signal samples_new : std_logic_vector(N-1 downto 0);
	signal samples_old : std_logic_vector(N-1 downto 0);
begin
	clk_div_counter_proc : process(rst_n, clk) is
	begin
		if rst_n='0' then
			clk_div_counter <= (others =>'0');
		elsif (rising_edge(clk)) then
			clk_div_counter <= unsigned(clk_div_counter + 1);
		end if;
	end process clk_div_counter_proc;
	
	clk_div_proc : process(clk_div_counter) is
	begin
		if clk_div_counter=0 then
			clk_div <='1';
		else
			clk_div <='0';
		end if;
	end process clk_div_proc;
	
	
	sampler : process(clk, rst_n) is
	begin
		if rst_n='0' then
			samples_new <= (others =>'0');
			samples_old <= (others =>'0');
		elsif rising_edge(clk) then
			if clk_div='1' then
				looper : for I in 0 to button'length-1 loop
					samples_new(I) <= button(I);
					samples_old(I) <= samples_new(I);
				end loop looper;
			end if;
		end if;
	end process sampler;
	
	
	looper : for J in 0 to prs_event'length-1 generate
		prs_event(J) <= (not samples_new(J)) and samples_old(J) and clk_div;
	end generate looper;
	
end architecture behaviour;






library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity switcher is
	port(
		x : in std_logic;
		rst_n : in std_logic;
		y : out std_logic);
end entity switcher;


architecture behaviour of switcher is
	signal state : std_logic;
begin
	update_proc : process(x, rst_n) is
	begin
		if rst_n='0' then
			state <= '0';
		elsif x = '1' then
			state <= not state;
		end if;
	end process update_proc;
	y <= state;
end architecture behaviour;






library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_handler is
	port(
		clk : in std_logic;
		rst_n : in std_logic;
		button : in std_logic_vector(4 downto 0);
		man_clk : in std_logic;
		ALU_res : in std_logic_vector(3 downto 0);
		ALU_flags : in std_logic_vector(2 downto 0);
		input_sign : out std_logic;
		input_A : out std_logic_vector(3 downto 0);
		input_B : out std_logic_vector(3 downto 0);
		input_OP : out std_logic_vector(3 downto 0);
		output_res : out std_logic);
		
end entity input_handler;


architecture behaviour of input_handler is
	signal buttons : std_logic_vector(5 downto 0);
	signal debounced_input : std_logic_vector(5 downto 0);
	signal current_input : std_logic_vector(3 downto 0);
	
	
	component button_debounce
		generic(N : integer := 6);
		port(
			clk : in std_logic;
			rst_n : in std_logic;
			button : in std_logic_vector(N-1 downto 0);
			prs_event : out std_logic_vector(N-1 downto 0));
	end component button_debounce;
	
	component switcher is
		port(
			x : in std_logic;
			rst_n : in std_logic;
			y : out std_logic);
	end component switcher;
begin
	buttons <= man_clk & button;

	debouncer : button_debounce port map(
		clk => clk,
		rst_n => rst_n,
		button => buttons,
		prs_event => debounced_input);
		
	sw0 : switcher port map(
		x => debounced_input(0),
		rst_n => rst_n,
		y => current_input(0));
		
	sw1 : switcher port map(
		x => debounced_input(1),
		rst_n => rst_n,
		y => current_input(1));
		
	sw2 : switcher port map(
		x => debounced_input(2),
		rst_n => rst_n,
		y => current_input(2));
		
	sw3 : switcher port map(
		x => debounced_input(3),
		rst_n => rst_n,
		y => current_input(3));
	
	sw_sign : switcher port map(
		x => debounced_input(4),
		rst_n => rst_n,
		y => input_sign);
end architecture behaviour;
