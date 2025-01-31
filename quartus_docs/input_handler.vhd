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
	signal clk_div_delayed : std_logic;
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
	
	clk_div_proc : process(clk, clk_div_counter) is
	begin	
		
		if clk_div_counter=0 then
			clk_div <='1';
		else
			clk_div <='0';
		end if;
		
		if rising_edge(clk) then
			clk_div_delayed <= clk_div;
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
		prs_event(J) <= (not samples_new(J)) and samples_old(J) and clk_div_delayed;
	end generate looper;
	
end architecture behaviour;





library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_clk_decoder is
	port(
		man_clk : in std_logic;
		clk : in std_logic;
		rst_n : in std_logic;
		output : out std_logic_vector(3 downto 0));
end entity input_clk_decoder;


architecture behaviour of input_clk_decoder is
	signal decoder_mem : std_logic_vector(3 downto 0);
begin

	man_clk_decoder : process(clk, rst_n) is
	begin
		if rst_n='0' then
			output <= "0000";
			decoder_mem <= "0001";
		elsif rising_edge(clk) then
			if man_clk='1' then
				output <= decoder_mem;
				case decoder_mem is
					when "0001" => decoder_mem <= "0010";
					when "0010" => decoder_mem <= "0100";
					when "0100" => decoder_mem <= "1000";
					when others => decoder_mem <= "0001";
				end case;
			else
				output <= "0000";
			end if;
		end if;
	end process man_clk_decoder;
end architecture behaviour;




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity switcher is
	port(
		x : in std_logic;
		clk : in std_logic;
		rst_n : in std_logic;
		y : out std_logic);
end entity switcher;


architecture behaviour of switcher is
	signal state : std_logic;
begin
	update_proc : process(clk, rst_n) is
	begin
		if rst_n='0' then
			state <= '0';
		elsif rising_edge(clk) then
			if x = '1' then
				state <= not state;
			end if;
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
		ALU_flags : in std_logic_vector(1 downto 0);
		input_sign : out std_logic;
		input_A : out std_logic_vector(3 downto 0);
		input_B : out std_logic_vector(3 downto 0);
		input_OP : out std_logic_vector(3 downto 0);
		output_res : out std_logic_vector(3 downto 0);
		output_flags : out std_logic_vector(3 downto 0));
		
end entity input_handler;


architecture behaviour of input_handler is
	signal flags : std_logic_vector(3 downto 0);
	signal buttons : std_logic_vector(5 downto 0);
	signal debounced_input : std_logic_vector(5 downto 0);
	signal current_input : std_logic_vector(3 downto 0);
	signal decoded_reg_enables : std_logic_vector(3 downto 0);
	signal sign : std_logic;
	
	
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
			clk : in std_logic;
			y : out std_logic);
	end component switcher;
	
	component NBitReg is
	generic (N : integer := 8);
	port(	D: in std_logic_vector(N-1 downto 0);
			clk: in std_logic;
			enable : in std_logic;
			Q : out std_logic_vector(N-1 downto 0));
	end component NBitReg;
	
	component input_clk_decoder is
	port(
		man_clk : in std_logic;
		clk : in std_logic;
		rst_n : in std_logic;
		output : out std_logic_vector(3 downto 0));
	end component input_clk_decoder;
	
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
		clk => clk,
		y => current_input(0));
		
	sw1 : switcher port map(
		x => debounced_input(1),
		rst_n => rst_n,
		clk => clk,
		y => current_input(1));
		
	sw2 : switcher port map(
		x => debounced_input(2),
		rst_n => rst_n,
		clk => clk,
		y => current_input(2));
		
	sw3 : switcher port map(
		x => debounced_input(3),
		rst_n => rst_n,
		clk => clk,
		y => current_input(3));
	
	sw_sign : switcher port map(
		x => debounced_input(4),
		rst_n => rst_n,
		clk => clk,
		y => sign);
		
		
	input_A_reg : NBitReg 
	generic map(N => 4)
	port map(
		D => current_input,
		clk => clk,
		enable => decoded_reg_enables(0),
		Q => input_A);
	
	input_B_reg : NBitReg 
	generic map(N => 4)
	port map(
		D => current_input,
		clk => clk,
		enable => decoded_reg_enables(1),
		Q => input_B);
	
	input_OP_reg : NBitReg 
	generic map(N => 4)
	port map(
		D => current_input,
		clk => clk,
		enable => decoded_reg_enables(2),
		Q => input_OP);
	
	output_res_reg : NBitReg 
	generic map(N => 4)
	port map(
		D => ALU_res,
		clk => clk,
		enable => decoded_reg_enables(3),
		Q => output_res);
		
	output_flags_reg : NBitReg 
	generic map(N => 4)
	port map(
		D => flags,
		clk => clk,
		enable => decoded_reg_enables(3),
		Q => output_flags);
	
	
	decoder : input_clk_decoder port map(
		man_clk => debounced_input(5),
		clk => clk,
		rst_n => rst_n,
		output => decoded_reg_enables);
	
	
	
	
	flags <= ALU_flags & sign & (not (ALU_res(3) or ALU_res(2) or ALU_res(1) or ALU_res(0)));
	input_sign <= sign;
end architecture behaviour;
