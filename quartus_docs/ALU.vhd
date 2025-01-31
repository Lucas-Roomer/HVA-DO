library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port( 
		A,B,OPC	: 	in std_logic_vector(3 downto 0);
		Z   		:	out std_logic_vector(3 downto 0);
		Ci, sign	:	in std_logic;
		Co, ovfl	: 	out std_logic
	);
end entity ALU;
	
architecture behaviour of ALU is
	signal AExtrBit, BExtrBit, ARes 	: 	std_logic_vector(4 downto 0);
	signal Zout								: 	std_logic_vector(3 downto 0);	
	signal ACal 							: 	unsigned (4 downto 0);
	signal Carry, MSBAND, MSBNAND		: 	std_logic;

	begin	
	ALUProc : process (A, B, Ci, OPC, AExtrBit, BExtrBit, ARes, Zout, ACal ,Carry ) is
		
		begin
			ARes 		<= "00000";
			Zout 		<= "0000"; 
			ACal 		<= "00000";
			Carry 	<= '0';
			AExtrBit <= '0' & A;
			BExtrBit	<= '0' & B;
			
			case OPC is
				when "0000" =>
				-- inc A
					ACal <= unsigned(AExtrBit) + 1;
					Zout <= std_logic_vector(ACal(3 downto 0));
               Carry <= ACal(4);
					
				when "0001" =>
				-- dec A
					ACal <= unsigned(AExtrBit) - 1;
					Zout <= std_logic_vector(ACal(3 downto 0));
               Carry <= ACal(4);
					
				when "0010" =>
					-- add
					ACal <= unsigned(AExtrBit) + unsigned(BExtrBit);
					Zout <= std_logic_vector(ACal(3 downto 0));
               Carry <= ACal(4);


				when "0011" =>
				-- add + carry
				if Ci = '1' then
					ACal <= unsigned(AExtrBit) + unsigned(BExtrBit) + "1";
				else
					ACal <= unsigned(AExtrBit) + unsigned(BExtrBit);
				end if;
					Zout <= std_logic_vector(ACal(3 downto 0));
               Carry <= ACal(4);
					
				when "0100" =>
				-- sub
					ACal <= unsigned(AExtrBit) - (unsigned(not BExtrBit) + "1");
					Zout <= std_logic_vector(ACal(3 downto 0));
               Carry <= ACal(4);
					
				when "0101" =>
				--sub + carry
				
					if Ci = '1' then
						ACal <= unsigned(AExtrBit) - (unsigned(not BExtrBit) + "1") + "1";
					else
						ACal <= unsigned(AExtrBit) - (unsigned(not BExtrBit) + "1");
					end if;
					
					Zout <= std_logic_vector(ACal(3 downto 0));
					Carry <= ACal(4);
					
				when "0110" =>
				-- pass A
					Zout <= A;
					Carry <= '0';
					
				when "0111" =>
				-- pass B
					Zout <= B;
					Carry <= '0';
					
				when "1000" =>
				-- AND
					Zout <= A AND B;
					Carry <= '0';
					
				when "1001" =>
				-- OR
					Zout <= A OR B;
					Carry <= '0';
					
				when "1010" =>
				-- XOR
					Zout <= A XOR B;
					Carry <= '0';
					
				when "1011" =>
				-- NOT A
					Zout <= not A;
					Carry <= '0';
					
				when "1100" =>
				-- SHL A
					ARes <= std_logic_vector(shift_left(unsigned(AExtrBit),1));
					Zout <= ARes(3 downto 0);
					Carry <= ARes(4);
						
				when "1101" =>
				-- ROL A
					Zout <= std_logic_vector(rotate_left(unsigned(A),1));
					Carry <= '0';
					
				when "1110" =>
				-- SHR A	
					ARes <= std_logic_vector(shift_right(unsigned(AExtrBit),1));
					Zout <= ARes(3 downto 0);
					Carry <= ARes(4);
						
				when others =>
				-- ROR A
					Zout <= std_logic_vector(rotate_right(unsigned(A),1));
					Carry <= '0';
					
			end case;
		end process ALUProc;
		
		Overflow : process (A, B, Ci, OPC, AExtrBit, BExtrBit, ARes, Zout, ACal ,Carry, sign, MSBNAND, MSBAND) is
			
			begin
				MSBAND 	<=  A(3) AND B(3);
				MSBNAND 	<=  A(3) NAND B(3);
				
				if sign = '0' then
					Z <= Zout;
					Co <= Carry;
					ovfl <= '0';
				else
					if (MSBAND = '1' and Zout(4) = '0') then
						ovfl <= '1';
						
					elsif (MSBNAND = '1' and Zout(4) = '1') then
						ovfl <= '1';
						
					else
						ovfl <= '0';
					end if;
					
					Z <= Zout;
						Co <= Carry;
				end if;
		end process Overflow;
end architecture;