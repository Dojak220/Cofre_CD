library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_arith.all
-- use ieee.std_logic_unsigned.all

entity registrador_8 is
	port(
		d  : std_logic_vector(7 downto 0); -- vetor de entrada de 8 bits;
		ld : std_logic;                    -- load do registrador;
	 --clr: std_logic;                    -- clear do registrador;
		clk: std_logic;                    -- clock do registrador;
		q  : std_logic_vector(7 downto 0)  -- vetor de saída de 8 bits;
	);
end registrador_8;

architecture estrutura of registrador_8 is
begin
	process(ld, /*clr*/, clk)
	begin
		if clk = '1' and ld = '1' then
			q <= d;
		end if;
	end process;
end estrutura;