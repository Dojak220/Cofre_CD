library ieee;
use ieee.std_logic_1164.all;

entity registrador_8 is
	port(
		d  : in std_logic_vector(7 downto 0);       -- vetor de entrada de 8 bits;
		ld, clr, clk : in std_logic;                -- load, clear e clock do registrador de 8 bits;
		q  : out std_logic_vector(7 downto 0)       -- vetor de saída de 8 bits;
	);
end registrador_8;

architecture estrutura of registrador_8 is
begin
	process(ld, clr, clk)
	begin
		if clr'EVENT and clr = '1' then
			q <= "00000000";
		elsif clk = '1' and ld = '1' then
			q <= d;
		end if;
	end process;
end estrutura;