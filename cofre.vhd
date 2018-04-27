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
	
	signal estado: std_logic_vector(2 downto 0) = "000";
	signal senha_memoria std_logic_vector(7 downto 0) = "00000000";
	signal entrada std_logic_vector(7 downto 0);
	signal resultado_compara std_logic = 0;
	signal senha_salva std_logic = 0;
	signal led_bloq, led_abre, led_modo std_logic = 0;
	signal bloq std_logic = 0;
	
	
	begin
		process()
	