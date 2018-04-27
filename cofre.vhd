library ieee;
use ieee.std_logic_1164.all;

entity cofre is
	port(
		teclas   : in bit_vector(7 downto 0);
		cs       : in bit;
		reset    : in bit;
		clk      : in bit;
		modo     : out bit;
		abre     : out bit;
		bloqueado: out bit
	);
end cofre;

architecture estrutura of cofre is
	component registrador_8 is
		port(
			d  : std_logic_vector(7 downto 0); -- vetor de entrada de 8 bits;
			ld : std_logic;                    -- load do registrador;
		 --clr: std_logic;                    -- clear do registrador;
			clk: std_logic;                    -- clock do registrador;
			q  : std_logic_vector(7 downto 0)  -- vetor de saída de 8 bits;
		);
	end component;
		