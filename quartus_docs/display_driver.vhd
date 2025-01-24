library ieee;
use ieee.std_logic_1164.all;

entity encoder is
	port(
		din : in std_logic_vector(3 downto 0);
		sign : in std_logic;
		dout : out std_logic_vector(15 downto 0));
		
		constant ADDR_0_HM  : integer := 1; --disambiguation : display 0 horizontal middle
		constant ADDR_0_VTR : integer := 2;
		constant ADDR_0_VBR : integer := 3;
		constant ADDR_1_VTL : integer := 4; --display 1 vertical top left
		constant ADDR_1_VTR : integer := 5;
		constant ADDR_1_VBL : integer := 6;
		constant ADDR_1_VBR : integer := 7;
		constant ADDR_1_HT  : integer := 8;
		constant ADDR_1_HM  : integer := 9;
		constant ADDR_1_HB  : integer := 10;
end entity encoder;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_driver is
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
		
	constant dclk_div : integer :=0; --the total division will be two to the power of this generic
												--
end entity display_driver;




architecture behaviour of encoder is
	signal inputs : std_logic_vector(4 downto 0);
	signal leds : std_logic_vector(9 downto 0); --order is as listed in the constant list
begin

	inputs <= sign & din;
	
	with inputs select
				  --0001111111
				  --HVVVVVVHHH
				  --MTBTTBBTMB
				  -- RRLRLR
		leds <= 	"0001111101" when "00000",
					"0000101000" when "00001",
					"0000110111" when "00010",
					"0000101111" when "00011",
					"0001101010" when "00100",
					"0001001111" when "00101",
					"0001011111" when "00110",
					"0000101100" when "00111",
					"0001111111" when "01000",
					"0001101111" when "01001",
					"0111111101" when "01010",
					"0110101000" when "01011",
					"0110110111" when "01100",
					"0110101111" when "01101",
					"0111101010" when "01110",
					"0111001111" when "01111",
					"0001111101" when "10000",
					"0000101000" when "10001",
					"0000110111" when "10010",
					"0000101111" when "10011",
					"0001101010" when "10100",
					"0001001111" when "10101",
					"0001011111" when "10110",
					"0000101100" when "10111",
					"1001111111" when "11000",
					"1000101100" when "11001",
					"1001011111" when "11010",
					"1001001111" when "11011",
					"1001101010" when "11100",
					"1000101111" when "11101",
					"1000110111" when "11110",
					"1000101000" when others;

	dout <= (ADDR_0_HM  => leds(9),
				ADDR_0_VTR => leds(8),
				ADDR_0_VBR => leds(7),
				ADDR_1_VTL => leds(6),
				ADDR_1_VTR => leds(5),
				ADDR_1_VBL => leds(4),
				ADDR_1_VBR => leds(3),
				ADDR_1_HT  => leds(2),
				ADDR_1_HM  => leds(1),
				ADDR_1_HB  => leds(0),
				others=>'0');
					
end architecture behaviour;



architecture behaviour of display_driver is
	signal clk_div_counter : unsigned(dclk_div downto 0);
	signal clk_div : std_logic;
	signal dclk_sig : std_logic;
	
	signal addr_counter : unsigned(5 downto 0);
	signal enc0_out : std_logic_vector(15 downto 0);
	signal enc1_out : std_logic_vector(15 downto 0);
	signal enc2_out : std_logic_vector(15 downto 0);
	signal enc_all_out : std_logic_vector(63 downto 0);

	
	component encoder 
		port(
			din : in std_logic_vector(3 downto 0);
			sign : in std_logic;
			dout : out std_logic_vector(15 downto 0));
	end component encoder;
	
begin

	enc0 : encoder port map
		(din => d0,
		sign => sign,
		dout => enc0_out);
	
	enc1 : encoder port map
		(din => d1,
		sign => sign,
		dout => enc1_out);
	
	enc2 : encoder port map
		(din => d2,
		sign => sign,
		dout => enc2_out);
	
	enc_all_out <= "0000000000000000" & enc2_out & enc1_out &enc0_out;
		
	
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
		if clk_div_counter = 0 then
			clk_div <='1';
		else
			clk_div <='0';
		end if;
	end process clk_div_proc;
	
	shifter_proc : process(rst_n, clk) is
	begin
		if rst_n='0' then
			dclk_sig <= '0';
			addr_counter <= (others =>'0');
		elsif (rising_edge(clk)) then
			if clk_div='1' then
				if dclk_sig='1' then
					dclk_sig <= '0';
					addr_counter <= unsigned(addr_counter + 1);
				else
					dclk_sig <= '1';
				end if;
			end if;
		end if;
	end process shifter_proc;
	
	LE_proc : process(addr_counter, dclk_sig) is
	begin
		if ((addr_counter = 0) and (dclk_sig = '0')) then
			LE <= '1';
		else
			LE <= '0';
		end if;
	end process LE_proc;
			
	dclk <= dclk_sig;
	SDI <= enc_all_out(to_integer(unsigned(addr_counter)));
	OEn <= '0';
end architecture behaviour;