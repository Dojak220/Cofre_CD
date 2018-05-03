library ieee;
use ieee.std_logic_1164.all;

entity comparador is
	port(
		entrada: in std_logic_vector(8 downto 0);      -- valor digitado pelo usuário que deve ser comparado ao da memória;
		memoria  : in std_logic_vector(8 downto 0);    -- senha guardada na memória do cofre;
		resultado : out bit;                           -- resultado da comparação (1: senha correta; 0: senha incorreta);
	);
end comparador;

architecture estrutura of comparador is
begin
	process(memoria, entrada)
	begin
		if memoria = entrada then
			resultado <= '1';
		else then
			resultado <= '0';
		end if;
	end process;
end estrutura;