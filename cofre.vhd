queolibrary ieee;
use ieee.std_logic_1164.all;

entity cofre is
	port(
		teclas   : in bit_vector(7 downto 0);
		cs, reset, clk: in std_logic;
		modo, abre, bloqueado: out std_logic
		);
end cofre;

architecture estrutura of cofre is
	component registrador_8 is
		port(
		d8  : in std_logic_vector(7 downto 0); -- vetor de entrada de 8 bits;
		ld8, clr8, clk8 : in bit;                -- load, clear e clock do registrador de 8 bits;
		q8  : std_logic_vector(7 downto 0)     -- vetor de saída de 8 bits;
	);
	end component;
	
	/*
	component registrador_3 is
	port(
		d3  : in std_logic_vector(2 downto 0); -- vetor de entrada de 3 bits;
		ld3, clr3, clk3 : in bit;                -- load, clear e clock do registrador de 8 bits;
		q3  : std_logic_vector(2 downto 0)     -- vetor de saída de 3 bits;
	);
	end component;
	*/
	
	component comparador is
	port(
		entrada: in std_logic_vector(8 downto 0);      -- valor digitado pelo usuário que deve ser comparado ao da memória;
		memoria  : in std_logic_vector(8 downto 0);    -- senha guardada na memória do cofre;
		resultado : out bit;                           -- resultado da comparação (1: senha correta; 0: senha incorreta);
	);
	end component;
	
	signal estado: std_logic_vector(2 downto 0) = '000';
	signal estado_aux: std_logic_vector(2 downto 0);
	signal senha_memoria: std_logic_vector(7 downto 0) = '00000000';
	signal entrada: std_logic_vector(7 downto 0);
	signal resultado_compara: std_logic = 0;
	signal senha_salva: std_logic = 0;
	signal led_bloq, led_abre, led_modo: std_logic = 0;
	signal bloq: std_logic = 0;
	
	
	begin
		FSM: process(estado, clk)
		
		begin
			case estado is
				when 000 =>
					led_bloq = '0';
					led_modo = '0';
					led_abre = '0';
					
					if (cs = '0' and clk = '1' and senha_salva = '0') then
						estado_aux <= 001;
					if (cs = '1' and clk) = '1' and senha_salva = '1') then
						estado_aux <=010;
									
				when 001 =>
					senha_memoria <= entrada;
					senha_salva <= '1';
					estado_aux <= '000';
					
				when 010 =>
					led_modo = '1';
					led_abre = '0';
					led_bloq = '0';
					
					if (clk = '1' and cs = '0')
						estado_aux <= '000';
					if (clk = '1' and cs = '1')
						estado_aux <= '011';
					
				
				when 011 =>
					if (entrada == senha_memoria) then
						estado_aux <= '100';
					else then
						estado_aux <= '101';
					
				when 100 =>
					led_abre = '1'
					
					if (clk = '1') then
						estado_aux <= '010';
					
				when 101 =>
					led_abre = '0';
					led_bloq = '1';
					bloq = '1';
					
					if (reset = '1') then
						estado_aux <= '110';
											
				when 110 =>
					led_bloq = '0';
					bloq = '0';
					senha_memoria <= '00000000';
					
					estado_aux <= '000';
					
		
		
		
		
		
		
		
		
		
		
	