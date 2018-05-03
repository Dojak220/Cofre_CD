-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "05/03/2018 17:30:56"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	cofre IS
    PORT (
	teclas : IN std_logic_vector(7 DOWNTO 0);
	cs : IN std_logic;
	reset : IN std_logic;
	clk : IN std_logic;
	clk_FPGA : IN std_logic;
	modo : OUT std_logic;
	abre : OUT std_logic;
	bloqueado : OUT std_logic;
	salvou : OUT std_logic;
	estado : OUT std_logic_vector(2 DOWNTO 0)
	);
END cofre;

-- Design Ports Information
-- teclas[0]	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- teclas[1]	=>  Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- teclas[2]	=>  Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- teclas[3]	=>  Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- teclas[4]	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- teclas[5]	=>  Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- teclas[6]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- teclas[7]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- modo	=>  Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- abre	=>  Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- bloqueado	=>  Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- salvou	=>  Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- estado[0]	=>  Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- estado[1]	=>  Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- estado[2]	=>  Location: PIN_Y13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk_FPGA	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_W26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- cs	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF cofre IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_teclas : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_cs : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_clk_FPGA : std_logic;
SIGNAL ww_modo : std_logic;
SIGNAL ww_abre : std_logic;
SIGNAL ww_bloqueado : std_logic;
SIGNAL ww_salvou : std_logic;
SIGNAL ww_estado : std_logic_vector(2 DOWNTO 0);
SIGNAL \clk_FPGA~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \estado_aux[0]~3_combout\ : std_logic;
SIGNAL \estado_aux[0]~4_combout\ : std_logic;
SIGNAL \estado_aux[1]~6_combout\ : std_logic;
SIGNAL \estado_aux[1]~7_combout\ : std_logic;
SIGNAL \clk_FPGA~combout\ : std_logic;
SIGNAL \clk_FPGA~clkctrl_outclk\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \cs~combout\ : std_logic;
SIGNAL \estado_aux[0]~5_combout\ : std_logic;
SIGNAL \senha_salva~0_combout\ : std_logic;
SIGNAL \senha_salva~regout\ : std_logic;
SIGNAL \estado_aux[0]~0_combout\ : std_logic;
SIGNAL \estado_aux[0]~1_combout\ : std_logic;
SIGNAL \estado_aux[0]~2_combout\ : std_logic;
SIGNAL \estado_aux[1]~8_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \led_abre~0_combout\ : std_logic;
SIGNAL \led_abre~regout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \led_bloq~regout\ : std_logic;
SIGNAL estado_aux : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_teclas <= teclas;
ww_cs <= cs;
ww_reset <= reset;
ww_clk <= clk;
ww_clk_FPGA <= clk_FPGA;
modo <= ww_modo;
abre <= ww_abre;
bloqueado <= ww_bloqueado;
salvou <= ww_salvou;
estado <= ww_estado;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_FPGA~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk_FPGA~combout\);

-- Location: LCCOMB_X36_Y4_N6
\estado_aux[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[0]~3_combout\ = (\clk~combout\ & (!\cs~combout\)) # (!\clk~combout\ & (\cs~combout\ & \senha_salva~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clk~combout\,
	datac => \cs~combout\,
	datad => \senha_salva~regout\,
	combout => \estado_aux[0]~3_combout\);

-- Location: LCCOMB_X36_Y4_N24
\estado_aux[0]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[0]~4_combout\ = (estado_aux(0) & (((estado_aux(1))))) # (!estado_aux(0) & ((\cs~combout\ & (!estado_aux(1) & \estado_aux[0]~3_combout\)) # (!\cs~combout\ & (estado_aux(1) & !\estado_aux[0]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_aux(0),
	datab => \cs~combout\,
	datac => estado_aux(1),
	datad => \estado_aux[0]~3_combout\,
	combout => \estado_aux[0]~4_combout\);

-- Location: LCCOMB_X36_Y4_N14
\estado_aux[1]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[1]~6_combout\ = (\clk~combout\ & (((estado_aux(1))))) # (!\clk~combout\ & (\cs~combout\ & ((estado_aux(1)) # (\senha_salva~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cs~combout\,
	datab => \clk~combout\,
	datac => estado_aux(1),
	datad => \senha_salva~regout\,
	combout => \estado_aux[1]~6_combout\);

-- Location: LCCOMB_X36_Y4_N16
\estado_aux[1]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[1]~7_combout\ = (estado_aux(2) & ((estado_aux(0)))) # (!estado_aux(2) & (\estado_aux[1]~6_combout\ & !estado_aux(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => estado_aux(2),
	datac => \estado_aux[1]~6_combout\,
	datad => estado_aux(0),
	combout => \estado_aux[1]~7_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk_FPGA~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk_FPGA,
	combout => \clk_FPGA~combout\);

-- Location: CLKCTRL_G3
\clk_FPGA~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_FPGA~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_FPGA~clkctrl_outclk\);

-- Location: PIN_W26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\cs~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_cs,
	combout => \cs~combout\);

-- Location: LCCOMB_X36_Y4_N10
\estado_aux[0]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[0]~5_combout\ = (\estado_aux[0]~2_combout\ & (((estado_aux(0))))) # (!\estado_aux[0]~2_combout\ & (!estado_aux(2) & (\estado_aux[0]~4_combout\ $ (!estado_aux(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_aux[0]~4_combout\,
	datab => estado_aux(2),
	datac => estado_aux(0),
	datad => \estado_aux[0]~2_combout\,
	combout => \estado_aux[0]~5_combout\);

-- Location: LCFF_X36_Y4_N11
\estado_aux[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_FPGA~clkctrl_outclk\,
	datain => \estado_aux[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => estado_aux(0));

-- Location: LCCOMB_X36_Y4_N0
\senha_salva~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \senha_salva~0_combout\ = (estado_aux(1) & (\senha_salva~regout\ & ((estado_aux(0)) # (!estado_aux(2))))) # (!estado_aux(1) & ((\senha_salva~regout\) # ((!estado_aux(2) & estado_aux(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_aux(1),
	datab => estado_aux(2),
	datac => \senha_salva~regout\,
	datad => estado_aux(0),
	combout => \senha_salva~0_combout\);

-- Location: LCFF_X36_Y4_N1
senha_salva : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_FPGA~clkctrl_outclk\,
	datain => \senha_salva~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \senha_salva~regout\);

-- Location: LCCOMB_X36_Y4_N12
\estado_aux[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[0]~0_combout\ = \cs~combout\ $ (\senha_salva~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \cs~combout\,
	datad => \senha_salva~regout\,
	combout => \estado_aux[0]~0_combout\);

-- Location: LCCOMB_X36_Y4_N22
\estado_aux[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[0]~1_combout\ = (!estado_aux(0) & ((\clk~combout\) # ((!estado_aux(1) & \estado_aux[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_aux(0),
	datab => \clk~combout\,
	datac => estado_aux(1),
	datad => \estado_aux[0]~0_combout\,
	combout => \estado_aux[0]~1_combout\);

-- Location: LCCOMB_X36_Y4_N28
\estado_aux[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[0]~2_combout\ = (estado_aux(2) & (\reset~combout\ & (!estado_aux(1)))) # (!estado_aux(2) & (((\estado_aux[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~combout\,
	datab => estado_aux(2),
	datac => estado_aux(1),
	datad => \estado_aux[0]~1_combout\,
	combout => \estado_aux[0]~2_combout\);

-- Location: LCCOMB_X36_Y4_N20
\estado_aux[1]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado_aux[1]~8_combout\ = (\estado_aux[1]~7_combout\ & (((!estado_aux(2) & estado_aux(1))) # (!\estado_aux[0]~2_combout\))) # (!\estado_aux[1]~7_combout\ & (estado_aux(2) & (!estado_aux(1) & !\estado_aux[0]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado_aux[1]~7_combout\,
	datab => estado_aux(2),
	datac => estado_aux(1),
	datad => \estado_aux[0]~2_combout\,
	combout => \estado_aux[1]~8_combout\);

-- Location: LCFF_X36_Y4_N21
\estado_aux[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_FPGA~clkctrl_outclk\,
	datain => \estado_aux[1]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => estado_aux(1));

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LCCOMB_X36_Y4_N26
\Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (estado_aux(0) & (estado_aux(1) $ ((estado_aux(2))))) # (!estado_aux(0) & (!estado_aux(1) & (estado_aux(2) & \reset~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_aux(0),
	datab => estado_aux(1),
	datac => estado_aux(2),
	datad => \reset~combout\,
	combout => \Mux3~0_combout\);

-- Location: LCFF_X36_Y4_N27
\estado_aux[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_FPGA~clkctrl_outclk\,
	datain => \Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => estado_aux(2));

-- Location: LCCOMB_X36_Y4_N8
\led_abre~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \led_abre~0_combout\ = (estado_aux(2) & ((estado_aux(1) & (\led_abre~regout\)) # (!estado_aux(1) & ((estado_aux(0)))))) # (!estado_aux(2) & (((\led_abre~regout\) # (!estado_aux(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_aux(1),
	datab => estado_aux(2),
	datac => \led_abre~regout\,
	datad => estado_aux(0),
	combout => \led_abre~0_combout\);

-- Location: LCFF_X36_Y4_N9
led_abre : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_FPGA~clkctrl_outclk\,
	datain => \led_abre~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led_abre~regout\);

-- Location: LCCOMB_X36_Y4_N18
\Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (estado_aux(0) & ((\led_bloq~regout\) # ((!estado_aux(1) & estado_aux(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => estado_aux(1),
	datab => estado_aux(2),
	datac => \led_bloq~regout\,
	datad => estado_aux(0),
	combout => \Mux0~0_combout\);

-- Location: LCFF_X36_Y4_N19
led_bloq : cycloneii_lcell_ff
PORT MAP (
	clk => \clk_FPGA~clkctrl_outclk\,
	datain => \Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led_bloq~regout\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(0));

-- Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(1));

-- Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(2));

-- Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(3));

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(4));

-- Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(5));

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(6));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\teclas[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_teclas(7));

-- Location: PIN_AD12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\modo~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led_abre~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_modo);

-- Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\abre~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led_abre~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_abre);

-- Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\bloqueado~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led_bloq~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_bloqueado);

-- Location: PIN_AE12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\salvou~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \senha_salva~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_salvou);

-- Location: PIN_AC14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\estado[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => estado_aux(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_estado(0));

-- Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\estado[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => estado_aux(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_estado(1));

-- Location: PIN_Y13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\estado[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => estado_aux(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_estado(2));
END structure;


