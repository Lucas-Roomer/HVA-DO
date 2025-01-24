-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "01/24/2025 10:55:35"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	input_handler IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	button : IN std_logic_vector(4 DOWNTO 0);
	man_clk : IN std_logic;
	ALU_res : IN std_logic_vector(3 DOWNTO 0);
	ALU_flags : IN std_logic_vector(2 DOWNTO 0);
	input_sign : OUT std_logic;
	input_A : OUT std_logic_vector(3 DOWNTO 0);
	input_B : OUT std_logic_vector(3 DOWNTO 0);
	input_OP : OUT std_logic_vector(3 DOWNTO 0);
	output_res : OUT std_logic
	);
END input_handler;

-- Design Ports Information
-- button[0]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[1]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[2]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[3]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- man_clk	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_res[0]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_res[1]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_res[2]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_res[3]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_flags[0]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_flags[1]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_flags[2]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_sign	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_A[0]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_A[1]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_A[2]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_A[3]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_B[0]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_B[1]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_B[2]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_B[3]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_OP[0]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_OP[1]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_OP[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input_OP[3]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output_res	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button[4]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF input_handler IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_button : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_man_clk : std_logic;
SIGNAL ww_ALU_res : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_ALU_flags : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_input_sign : std_logic;
SIGNAL ww_input_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_input_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_input_OP : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_output_res : std_logic;
SIGNAL \rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \button[0]~input_o\ : std_logic;
SIGNAL \button[1]~input_o\ : std_logic;
SIGNAL \button[2]~input_o\ : std_logic;
SIGNAL \button[3]~input_o\ : std_logic;
SIGNAL \man_clk~input_o\ : std_logic;
SIGNAL \ALU_res[0]~input_o\ : std_logic;
SIGNAL \ALU_res[1]~input_o\ : std_logic;
SIGNAL \ALU_res[2]~input_o\ : std_logic;
SIGNAL \ALU_res[3]~input_o\ : std_logic;
SIGNAL \ALU_flags[0]~input_o\ : std_logic;
SIGNAL \ALU_flags[1]~input_o\ : std_logic;
SIGNAL \ALU_flags[2]~input_o\ : std_logic;
SIGNAL \input_sign~output_o\ : std_logic;
SIGNAL \input_A[0]~output_o\ : std_logic;
SIGNAL \input_A[1]~output_o\ : std_logic;
SIGNAL \input_A[2]~output_o\ : std_logic;
SIGNAL \input_A[3]~output_o\ : std_logic;
SIGNAL \input_B[0]~output_o\ : std_logic;
SIGNAL \input_B[1]~output_o\ : std_logic;
SIGNAL \input_B[2]~output_o\ : std_logic;
SIGNAL \input_B[3]~output_o\ : std_logic;
SIGNAL \input_OP[0]~output_o\ : std_logic;
SIGNAL \input_OP[1]~output_o\ : std_logic;
SIGNAL \input_OP[2]~output_o\ : std_logic;
SIGNAL \input_OP[3]~output_o\ : std_logic;
SIGNAL \output_res~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \button[4]~input_o\ : std_logic;
SIGNAL \debouncer|samples_new[4]~feeder_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \debouncer|clk_div_counter[0]~54_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[1]~18_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[1]~19\ : std_logic;
SIGNAL \debouncer|clk_div_counter[2]~20_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[2]~21\ : std_logic;
SIGNAL \debouncer|clk_div_counter[3]~22_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[3]~23\ : std_logic;
SIGNAL \debouncer|clk_div_counter[4]~24_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[4]~25\ : std_logic;
SIGNAL \debouncer|clk_div_counter[5]~26_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[5]~27\ : std_logic;
SIGNAL \debouncer|clk_div_counter[6]~28_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[6]~29\ : std_logic;
SIGNAL \debouncer|clk_div_counter[7]~30_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[7]~31\ : std_logic;
SIGNAL \debouncer|clk_div_counter[8]~32_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[8]~33\ : std_logic;
SIGNAL \debouncer|clk_div_counter[9]~34_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[9]~35\ : std_logic;
SIGNAL \debouncer|clk_div_counter[10]~36_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[10]~37\ : std_logic;
SIGNAL \debouncer|clk_div_counter[11]~38_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[11]~39\ : std_logic;
SIGNAL \debouncer|clk_div_counter[12]~40_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[12]~41\ : std_logic;
SIGNAL \debouncer|clk_div_counter[13]~42_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[13]~43\ : std_logic;
SIGNAL \debouncer|clk_div_counter[14]~44_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[14]~45\ : std_logic;
SIGNAL \debouncer|clk_div_counter[15]~46_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[15]~47\ : std_logic;
SIGNAL \debouncer|clk_div_counter[16]~48_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[16]~49\ : std_logic;
SIGNAL \debouncer|clk_div_counter[17]~50_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter[17]~51\ : std_logic;
SIGNAL \debouncer|clk_div_counter[18]~52_combout\ : std_logic;
SIGNAL \debouncer|Equal0~2_combout\ : std_logic;
SIGNAL \debouncer|Equal0~3_combout\ : std_logic;
SIGNAL \debouncer|Equal0~0_combout\ : std_logic;
SIGNAL \debouncer|Equal0~1_combout\ : std_logic;
SIGNAL \debouncer|Equal0~4_combout\ : std_logic;
SIGNAL \debouncer|Equal0~5_combout\ : std_logic;
SIGNAL \debouncer|prs_event[4]~0_combout\ : std_logic;
SIGNAL \sw_sign|state~0_combout\ : std_logic;
SIGNAL \debouncer|clk_div_counter\ : std_logic_vector(18 DOWNTO 0);
SIGNAL \debouncer|samples_old\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \debouncer|samples_new\ : std_logic_vector(5 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_button <= button;
ww_man_clk <= man_clk;
ww_ALU_res <= ALU_res;
ww_ALU_flags <= ALU_flags;
input_sign <= ww_input_sign;
input_A <= ww_input_A;
input_B <= ww_input_B;
input_OP <= ww_input_OP;
output_res <= ww_output_res;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst_n~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y15_N2
\input_sign~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sw_sign|state~0_combout\,
	devoe => ww_devoe,
	o => \input_sign~output_o\);

-- Location: IOOBUF_X53_Y7_N9
\input_A[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_A[0]~output_o\);

-- Location: IOOBUF_X0_Y7_N9
\input_A[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_A[1]~output_o\);

-- Location: IOOBUF_X0_Y11_N9
\input_A[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_A[2]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\input_A[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_A[3]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\input_B[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_B[0]~output_o\);

-- Location: IOOBUF_X40_Y0_N23
\input_B[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_B[1]~output_o\);

-- Location: IOOBUF_X34_Y0_N16
\input_B[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_B[2]~output_o\);

-- Location: IOOBUF_X36_Y0_N16
\input_B[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_B[3]~output_o\);

-- Location: IOOBUF_X14_Y0_N16
\input_OP[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_OP[0]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\input_OP[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_OP[1]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\input_OP[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_OP[2]~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\input_OP[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \input_OP[3]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\output_res~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \output_res~output_o\);

-- Location: IOIBUF_X0_Y16_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y15_N8
\button[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(4),
	o => \button[4]~input_o\);

-- Location: LCCOMB_X2_Y15_N24
\debouncer|samples_new[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|samples_new[4]~feeder_combout\ = \button[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \button[4]~input_o\,
	combout => \debouncer|samples_new[4]~feeder_combout\);

-- Location: IOIBUF_X0_Y16_N15
\rst_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: CLKCTRL_G4
\rst_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst_n~inputclkctrl_outclk\);

-- Location: LCCOMB_X2_Y16_N4
\debouncer|clk_div_counter[0]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[0]~54_combout\ = !\debouncer|clk_div_counter\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \debouncer|clk_div_counter\(0),
	combout => \debouncer|clk_div_counter[0]~54_combout\);

-- Location: FF_X2_Y16_N5
\debouncer|clk_div_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[0]~54_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(0));

-- Location: LCCOMB_X2_Y16_N14
\debouncer|clk_div_counter[1]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[1]~18_combout\ = (\debouncer|clk_div_counter\(0) & (\debouncer|clk_div_counter\(1) $ (VCC))) # (!\debouncer|clk_div_counter\(0) & (\debouncer|clk_div_counter\(1) & VCC))
-- \debouncer|clk_div_counter[1]~19\ = CARRY((\debouncer|clk_div_counter\(0) & \debouncer|clk_div_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(0),
	datab => \debouncer|clk_div_counter\(1),
	datad => VCC,
	combout => \debouncer|clk_div_counter[1]~18_combout\,
	cout => \debouncer|clk_div_counter[1]~19\);

-- Location: FF_X2_Y16_N15
\debouncer|clk_div_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[1]~18_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(1));

-- Location: LCCOMB_X2_Y16_N16
\debouncer|clk_div_counter[2]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[2]~20_combout\ = (\debouncer|clk_div_counter\(2) & (!\debouncer|clk_div_counter[1]~19\)) # (!\debouncer|clk_div_counter\(2) & ((\debouncer|clk_div_counter[1]~19\) # (GND)))
-- \debouncer|clk_div_counter[2]~21\ = CARRY((!\debouncer|clk_div_counter[1]~19\) # (!\debouncer|clk_div_counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(2),
	datad => VCC,
	cin => \debouncer|clk_div_counter[1]~19\,
	combout => \debouncer|clk_div_counter[2]~20_combout\,
	cout => \debouncer|clk_div_counter[2]~21\);

-- Location: FF_X2_Y16_N17
\debouncer|clk_div_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[2]~20_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(2));

-- Location: LCCOMB_X2_Y16_N18
\debouncer|clk_div_counter[3]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[3]~22_combout\ = (\debouncer|clk_div_counter\(3) & (\debouncer|clk_div_counter[2]~21\ $ (GND))) # (!\debouncer|clk_div_counter\(3) & (!\debouncer|clk_div_counter[2]~21\ & VCC))
-- \debouncer|clk_div_counter[3]~23\ = CARRY((\debouncer|clk_div_counter\(3) & !\debouncer|clk_div_counter[2]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(3),
	datad => VCC,
	cin => \debouncer|clk_div_counter[2]~21\,
	combout => \debouncer|clk_div_counter[3]~22_combout\,
	cout => \debouncer|clk_div_counter[3]~23\);

-- Location: FF_X2_Y16_N19
\debouncer|clk_div_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[3]~22_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(3));

-- Location: LCCOMB_X2_Y16_N20
\debouncer|clk_div_counter[4]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[4]~24_combout\ = (\debouncer|clk_div_counter\(4) & (!\debouncer|clk_div_counter[3]~23\)) # (!\debouncer|clk_div_counter\(4) & ((\debouncer|clk_div_counter[3]~23\) # (GND)))
-- \debouncer|clk_div_counter[4]~25\ = CARRY((!\debouncer|clk_div_counter[3]~23\) # (!\debouncer|clk_div_counter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(4),
	datad => VCC,
	cin => \debouncer|clk_div_counter[3]~23\,
	combout => \debouncer|clk_div_counter[4]~24_combout\,
	cout => \debouncer|clk_div_counter[4]~25\);

-- Location: FF_X2_Y16_N21
\debouncer|clk_div_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[4]~24_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(4));

-- Location: LCCOMB_X2_Y16_N22
\debouncer|clk_div_counter[5]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[5]~26_combout\ = (\debouncer|clk_div_counter\(5) & (\debouncer|clk_div_counter[4]~25\ $ (GND))) # (!\debouncer|clk_div_counter\(5) & (!\debouncer|clk_div_counter[4]~25\ & VCC))
-- \debouncer|clk_div_counter[5]~27\ = CARRY((\debouncer|clk_div_counter\(5) & !\debouncer|clk_div_counter[4]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(5),
	datad => VCC,
	cin => \debouncer|clk_div_counter[4]~25\,
	combout => \debouncer|clk_div_counter[5]~26_combout\,
	cout => \debouncer|clk_div_counter[5]~27\);

-- Location: FF_X2_Y16_N23
\debouncer|clk_div_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[5]~26_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(5));

-- Location: LCCOMB_X2_Y16_N24
\debouncer|clk_div_counter[6]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[6]~28_combout\ = (\debouncer|clk_div_counter\(6) & (!\debouncer|clk_div_counter[5]~27\)) # (!\debouncer|clk_div_counter\(6) & ((\debouncer|clk_div_counter[5]~27\) # (GND)))
-- \debouncer|clk_div_counter[6]~29\ = CARRY((!\debouncer|clk_div_counter[5]~27\) # (!\debouncer|clk_div_counter\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(6),
	datad => VCC,
	cin => \debouncer|clk_div_counter[5]~27\,
	combout => \debouncer|clk_div_counter[6]~28_combout\,
	cout => \debouncer|clk_div_counter[6]~29\);

-- Location: FF_X2_Y16_N25
\debouncer|clk_div_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[6]~28_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(6));

-- Location: LCCOMB_X2_Y16_N26
\debouncer|clk_div_counter[7]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[7]~30_combout\ = (\debouncer|clk_div_counter\(7) & (\debouncer|clk_div_counter[6]~29\ $ (GND))) # (!\debouncer|clk_div_counter\(7) & (!\debouncer|clk_div_counter[6]~29\ & VCC))
-- \debouncer|clk_div_counter[7]~31\ = CARRY((\debouncer|clk_div_counter\(7) & !\debouncer|clk_div_counter[6]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(7),
	datad => VCC,
	cin => \debouncer|clk_div_counter[6]~29\,
	combout => \debouncer|clk_div_counter[7]~30_combout\,
	cout => \debouncer|clk_div_counter[7]~31\);

-- Location: FF_X2_Y16_N27
\debouncer|clk_div_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[7]~30_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(7));

-- Location: LCCOMB_X2_Y16_N28
\debouncer|clk_div_counter[8]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[8]~32_combout\ = (\debouncer|clk_div_counter\(8) & (!\debouncer|clk_div_counter[7]~31\)) # (!\debouncer|clk_div_counter\(8) & ((\debouncer|clk_div_counter[7]~31\) # (GND)))
-- \debouncer|clk_div_counter[8]~33\ = CARRY((!\debouncer|clk_div_counter[7]~31\) # (!\debouncer|clk_div_counter\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(8),
	datad => VCC,
	cin => \debouncer|clk_div_counter[7]~31\,
	combout => \debouncer|clk_div_counter[8]~32_combout\,
	cout => \debouncer|clk_div_counter[8]~33\);

-- Location: FF_X2_Y16_N29
\debouncer|clk_div_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[8]~32_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(8));

-- Location: LCCOMB_X2_Y16_N30
\debouncer|clk_div_counter[9]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[9]~34_combout\ = (\debouncer|clk_div_counter\(9) & (\debouncer|clk_div_counter[8]~33\ $ (GND))) # (!\debouncer|clk_div_counter\(9) & (!\debouncer|clk_div_counter[8]~33\ & VCC))
-- \debouncer|clk_div_counter[9]~35\ = CARRY((\debouncer|clk_div_counter\(9) & !\debouncer|clk_div_counter[8]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(9),
	datad => VCC,
	cin => \debouncer|clk_div_counter[8]~33\,
	combout => \debouncer|clk_div_counter[9]~34_combout\,
	cout => \debouncer|clk_div_counter[9]~35\);

-- Location: FF_X2_Y16_N31
\debouncer|clk_div_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[9]~34_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(9));

-- Location: LCCOMB_X2_Y15_N0
\debouncer|clk_div_counter[10]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[10]~36_combout\ = (\debouncer|clk_div_counter\(10) & (!\debouncer|clk_div_counter[9]~35\)) # (!\debouncer|clk_div_counter\(10) & ((\debouncer|clk_div_counter[9]~35\) # (GND)))
-- \debouncer|clk_div_counter[10]~37\ = CARRY((!\debouncer|clk_div_counter[9]~35\) # (!\debouncer|clk_div_counter\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(10),
	datad => VCC,
	cin => \debouncer|clk_div_counter[9]~35\,
	combout => \debouncer|clk_div_counter[10]~36_combout\,
	cout => \debouncer|clk_div_counter[10]~37\);

-- Location: FF_X2_Y15_N1
\debouncer|clk_div_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[10]~36_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(10));

-- Location: LCCOMB_X2_Y15_N2
\debouncer|clk_div_counter[11]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[11]~38_combout\ = (\debouncer|clk_div_counter\(11) & (\debouncer|clk_div_counter[10]~37\ $ (GND))) # (!\debouncer|clk_div_counter\(11) & (!\debouncer|clk_div_counter[10]~37\ & VCC))
-- \debouncer|clk_div_counter[11]~39\ = CARRY((\debouncer|clk_div_counter\(11) & !\debouncer|clk_div_counter[10]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(11),
	datad => VCC,
	cin => \debouncer|clk_div_counter[10]~37\,
	combout => \debouncer|clk_div_counter[11]~38_combout\,
	cout => \debouncer|clk_div_counter[11]~39\);

-- Location: FF_X2_Y15_N3
\debouncer|clk_div_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[11]~38_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(11));

-- Location: LCCOMB_X2_Y15_N4
\debouncer|clk_div_counter[12]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[12]~40_combout\ = (\debouncer|clk_div_counter\(12) & (!\debouncer|clk_div_counter[11]~39\)) # (!\debouncer|clk_div_counter\(12) & ((\debouncer|clk_div_counter[11]~39\) # (GND)))
-- \debouncer|clk_div_counter[12]~41\ = CARRY((!\debouncer|clk_div_counter[11]~39\) # (!\debouncer|clk_div_counter\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(12),
	datad => VCC,
	cin => \debouncer|clk_div_counter[11]~39\,
	combout => \debouncer|clk_div_counter[12]~40_combout\,
	cout => \debouncer|clk_div_counter[12]~41\);

-- Location: FF_X2_Y15_N5
\debouncer|clk_div_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[12]~40_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(12));

-- Location: LCCOMB_X2_Y15_N6
\debouncer|clk_div_counter[13]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[13]~42_combout\ = (\debouncer|clk_div_counter\(13) & (\debouncer|clk_div_counter[12]~41\ $ (GND))) # (!\debouncer|clk_div_counter\(13) & (!\debouncer|clk_div_counter[12]~41\ & VCC))
-- \debouncer|clk_div_counter[13]~43\ = CARRY((\debouncer|clk_div_counter\(13) & !\debouncer|clk_div_counter[12]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(13),
	datad => VCC,
	cin => \debouncer|clk_div_counter[12]~41\,
	combout => \debouncer|clk_div_counter[13]~42_combout\,
	cout => \debouncer|clk_div_counter[13]~43\);

-- Location: FF_X2_Y15_N7
\debouncer|clk_div_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[13]~42_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(13));

-- Location: LCCOMB_X2_Y15_N8
\debouncer|clk_div_counter[14]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[14]~44_combout\ = (\debouncer|clk_div_counter\(14) & (!\debouncer|clk_div_counter[13]~43\)) # (!\debouncer|clk_div_counter\(14) & ((\debouncer|clk_div_counter[13]~43\) # (GND)))
-- \debouncer|clk_div_counter[14]~45\ = CARRY((!\debouncer|clk_div_counter[13]~43\) # (!\debouncer|clk_div_counter\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(14),
	datad => VCC,
	cin => \debouncer|clk_div_counter[13]~43\,
	combout => \debouncer|clk_div_counter[14]~44_combout\,
	cout => \debouncer|clk_div_counter[14]~45\);

-- Location: FF_X2_Y15_N9
\debouncer|clk_div_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[14]~44_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(14));

-- Location: LCCOMB_X2_Y15_N10
\debouncer|clk_div_counter[15]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[15]~46_combout\ = (\debouncer|clk_div_counter\(15) & (\debouncer|clk_div_counter[14]~45\ $ (GND))) # (!\debouncer|clk_div_counter\(15) & (!\debouncer|clk_div_counter[14]~45\ & VCC))
-- \debouncer|clk_div_counter[15]~47\ = CARRY((\debouncer|clk_div_counter\(15) & !\debouncer|clk_div_counter[14]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(15),
	datad => VCC,
	cin => \debouncer|clk_div_counter[14]~45\,
	combout => \debouncer|clk_div_counter[15]~46_combout\,
	cout => \debouncer|clk_div_counter[15]~47\);

-- Location: FF_X2_Y15_N11
\debouncer|clk_div_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[15]~46_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(15));

-- Location: LCCOMB_X2_Y15_N12
\debouncer|clk_div_counter[16]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[16]~48_combout\ = (\debouncer|clk_div_counter\(16) & (!\debouncer|clk_div_counter[15]~47\)) # (!\debouncer|clk_div_counter\(16) & ((\debouncer|clk_div_counter[15]~47\) # (GND)))
-- \debouncer|clk_div_counter[16]~49\ = CARRY((!\debouncer|clk_div_counter[15]~47\) # (!\debouncer|clk_div_counter\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(16),
	datad => VCC,
	cin => \debouncer|clk_div_counter[15]~47\,
	combout => \debouncer|clk_div_counter[16]~48_combout\,
	cout => \debouncer|clk_div_counter[16]~49\);

-- Location: FF_X2_Y15_N13
\debouncer|clk_div_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[16]~48_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(16));

-- Location: LCCOMB_X2_Y15_N14
\debouncer|clk_div_counter[17]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[17]~50_combout\ = (\debouncer|clk_div_counter\(17) & (\debouncer|clk_div_counter[16]~49\ $ (GND))) # (!\debouncer|clk_div_counter\(17) & (!\debouncer|clk_div_counter[16]~49\ & VCC))
-- \debouncer|clk_div_counter[17]~51\ = CARRY((\debouncer|clk_div_counter\(17) & !\debouncer|clk_div_counter[16]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \debouncer|clk_div_counter\(17),
	datad => VCC,
	cin => \debouncer|clk_div_counter[16]~49\,
	combout => \debouncer|clk_div_counter[17]~50_combout\,
	cout => \debouncer|clk_div_counter[17]~51\);

-- Location: FF_X2_Y15_N15
\debouncer|clk_div_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[17]~50_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(17));

-- Location: LCCOMB_X2_Y15_N16
\debouncer|clk_div_counter[18]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|clk_div_counter[18]~52_combout\ = \debouncer|clk_div_counter[17]~51\ $ (\debouncer|clk_div_counter\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \debouncer|clk_div_counter\(18),
	cin => \debouncer|clk_div_counter[17]~51\,
	combout => \debouncer|clk_div_counter[18]~52_combout\);

-- Location: FF_X2_Y15_N17
\debouncer|clk_div_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|clk_div_counter[18]~52_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|clk_div_counter\(18));

-- Location: LCCOMB_X2_Y15_N26
\debouncer|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Equal0~2_combout\ = (!\debouncer|clk_div_counter\(9) & (!\debouncer|clk_div_counter\(10) & (!\debouncer|clk_div_counter\(8) & !\debouncer|clk_div_counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(9),
	datab => \debouncer|clk_div_counter\(10),
	datac => \debouncer|clk_div_counter\(8),
	datad => \debouncer|clk_div_counter\(11),
	combout => \debouncer|Equal0~2_combout\);

-- Location: LCCOMB_X2_Y15_N28
\debouncer|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Equal0~3_combout\ = (!\debouncer|clk_div_counter\(13) & (!\debouncer|clk_div_counter\(12) & (!\debouncer|clk_div_counter\(14) & !\debouncer|clk_div_counter\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(13),
	datab => \debouncer|clk_div_counter\(12),
	datac => \debouncer|clk_div_counter\(14),
	datad => \debouncer|clk_div_counter\(15),
	combout => \debouncer|Equal0~3_combout\);

-- Location: LCCOMB_X2_Y16_N10
\debouncer|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Equal0~0_combout\ = (!\debouncer|clk_div_counter\(3) & (!\debouncer|clk_div_counter\(1) & (!\debouncer|clk_div_counter\(0) & !\debouncer|clk_div_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(3),
	datab => \debouncer|clk_div_counter\(1),
	datac => \debouncer|clk_div_counter\(0),
	datad => \debouncer|clk_div_counter\(2),
	combout => \debouncer|Equal0~0_combout\);

-- Location: LCCOMB_X2_Y16_N12
\debouncer|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Equal0~1_combout\ = (!\debouncer|clk_div_counter\(7) & (!\debouncer|clk_div_counter\(6) & (!\debouncer|clk_div_counter\(5) & !\debouncer|clk_div_counter\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(7),
	datab => \debouncer|clk_div_counter\(6),
	datac => \debouncer|clk_div_counter\(5),
	datad => \debouncer|clk_div_counter\(4),
	combout => \debouncer|Equal0~1_combout\);

-- Location: LCCOMB_X2_Y15_N18
\debouncer|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Equal0~4_combout\ = (\debouncer|Equal0~2_combout\ & (\debouncer|Equal0~3_combout\ & (\debouncer|Equal0~0_combout\ & \debouncer|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|Equal0~2_combout\,
	datab => \debouncer|Equal0~3_combout\,
	datac => \debouncer|Equal0~0_combout\,
	datad => \debouncer|Equal0~1_combout\,
	combout => \debouncer|Equal0~4_combout\);

-- Location: LCCOMB_X2_Y15_N20
\debouncer|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|Equal0~5_combout\ = (!\debouncer|clk_div_counter\(16) & (!\debouncer|clk_div_counter\(18) & (!\debouncer|clk_div_counter\(17) & \debouncer|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|clk_div_counter\(16),
	datab => \debouncer|clk_div_counter\(18),
	datac => \debouncer|clk_div_counter\(17),
	datad => \debouncer|Equal0~4_combout\,
	combout => \debouncer|Equal0~5_combout\);

-- Location: FF_X2_Y15_N25
\debouncer|samples_new[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \debouncer|samples_new[4]~feeder_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \debouncer|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|samples_new\(4));

-- Location: FF_X2_Y15_N31
\debouncer|samples_old[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \debouncer|samples_new\(4),
	clrn => \rst_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \debouncer|Equal0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \debouncer|samples_old\(4));

-- Location: LCCOMB_X2_Y15_N30
\debouncer|prs_event[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \debouncer|prs_event[4]~0_combout\ = (!\debouncer|samples_new\(4) & \debouncer|samples_old\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|samples_new\(4),
	datac => \debouncer|samples_old\(4),
	combout => \debouncer|prs_event[4]~0_combout\);

-- Location: LCCOMB_X1_Y15_N16
\sw_sign|state~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sw_sign|state~0_combout\ = (\rst_n~input_o\ & (\sw_sign|state~0_combout\ $ (((\debouncer|prs_event[4]~0_combout\ & \debouncer|Equal0~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \debouncer|prs_event[4]~0_combout\,
	datab => \rst_n~input_o\,
	datac => \debouncer|Equal0~5_combout\,
	datad => \sw_sign|state~0_combout\,
	combout => \sw_sign|state~0_combout\);

-- Location: IOIBUF_X16_Y34_N1
\button[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(0),
	o => \button[0]~input_o\);

-- Location: IOIBUF_X7_Y34_N1
\button[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(1),
	o => \button[1]~input_o\);

-- Location: IOIBUF_X53_Y30_N1
\button[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(2),
	o => \button[2]~input_o\);

-- Location: IOIBUF_X5_Y34_N15
\button[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button(3),
	o => \button[3]~input_o\);

-- Location: IOIBUF_X47_Y0_N22
\man_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_man_clk,
	o => \man_clk~input_o\);

-- Location: IOIBUF_X0_Y23_N15
\ALU_res[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_res(0),
	o => \ALU_res[0]~input_o\);

-- Location: IOIBUF_X53_Y24_N22
\ALU_res[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_res(1),
	o => \ALU_res[1]~input_o\);

-- Location: IOIBUF_X5_Y0_N22
\ALU_res[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_res(2),
	o => \ALU_res[2]~input_o\);

-- Location: IOIBUF_X45_Y0_N15
\ALU_res[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_res(3),
	o => \ALU_res[3]~input_o\);

-- Location: IOIBUF_X20_Y34_N22
\ALU_flags[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_flags(0),
	o => \ALU_flags[0]~input_o\);

-- Location: IOIBUF_X16_Y34_N15
\ALU_flags[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_flags(1),
	o => \ALU_flags[1]~input_o\);

-- Location: IOIBUF_X40_Y34_N1
\ALU_flags[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALU_flags(2),
	o => \ALU_flags[2]~input_o\);

ww_input_sign <= \input_sign~output_o\;

ww_input_A(0) <= \input_A[0]~output_o\;

ww_input_A(1) <= \input_A[1]~output_o\;

ww_input_A(2) <= \input_A[2]~output_o\;

ww_input_A(3) <= \input_A[3]~output_o\;

ww_input_B(0) <= \input_B[0]~output_o\;

ww_input_B(1) <= \input_B[1]~output_o\;

ww_input_B(2) <= \input_B[2]~output_o\;

ww_input_B(3) <= \input_B[3]~output_o\;

ww_input_OP(0) <= \input_OP[0]~output_o\;

ww_input_OP(1) <= \input_OP[1]~output_o\;

ww_input_OP(2) <= \input_OP[2]~output_o\;

ww_input_OP(3) <= \input_OP[3]~output_o\;

ww_output_res <= \output_res~output_o\;
END structure;


