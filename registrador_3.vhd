library ieee;
use ieee.std_logic_1164.all;

entity registrador_3 is
	port(
		d  : in std_logic_vector(2 downto 0); -- vetor de entrada de 3 bits;
		ld, clr, clk : in bit;                -- load, clear e clock do registrador de 8 bits;
		q  : std_logic_vector(2 downto 0)     -- vetor de saída de 3 bits;
	);
end registrador_3;

architecture estrutura of registrador_3 is
begin
	process(ld, clr, clk)
	begin
		if clr = '1' then
			q <= '000';
		elsif clk = '1' and ld = '1' then
			q <= d;
		end if;
	end process;
end estrutura;