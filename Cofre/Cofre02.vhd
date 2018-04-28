library ieee;
use ieee.std_logic_1164.all;

entity cofre is
	port(
		teclas: in std_logic_vector(7 downto 0);
		cs, reset, clk: in std_logic;
		modo, abre, bloqueado, salvou: out std_logic;
      estado : out std_logic_vector(1 downto 0)
		);
end cofre;

architecture estrutura of cofre is 
	
	signal s: in std_logic_vector(1 downto 0);
	signal n: out std_logic_vector(1 downto 0);
	signal result: in std_logic;
	signal senha_salva: out std_logic_vector(7 downto 0);
	
	component registrador_2 is
	port(
		d  : in std_logic_vector(1 downto 0);       -- vetor de entrada de 2 bits;
		ld, clr, clk : in std_logic;                -- load, clear e clock do registrador de 2 bits;
		q  : out std_logic_vector(1 downto 0)       -- vetor de saída de 2 bits;
	);
	end registrador_2;
	
	component registrador_8 is
	port(
		d  : in std_logic_vector(7 downto 0);       -- vetor de entrada de 8 bits;
		ld, clr, clk : in std_logic;                -- load, clear e clock do registrador de 8 bits;
		q  : out std_logic_vector(7 downto 0)       -- vetor de saída de 8 bits;
	);
	end component;
	
	component comparador is
	port(
		entrada: in std_logic_vector(8 downto 0);      -- valor digitado pelo usuário que deve ser comparado ao da memória;
		memoria  : in std_logic_vector(8 downto 0);    -- senha guardada na memória do cofre;
		resultado : out std_logic                      -- resultado da comparação (1: senha correta; 0: senha incorreta);
	);
	end component;
	
	
	s:="000";
	n(0) <= (cs and clk and not s(0) and s(1)) or (not reset and s(0) and (cs or s(1)));
	n(1) <= cs and not s(0) and ((not s(1)) or (clock and not compara and s(1))) or s(0) and ((cs and reset and not s(1)) or (not reset and s(1)))
	modo <= cs and not s(0) and not s(1) or s(0) and (cs and not s(1) or not reset and s(1));
	abre <= not (cs and (clk and compara and not s(0) and s(1) or not reset and s(0) and not s(1)));
	bloqueado <= s(1) and (cs and clk and not compara and not s(0) or not reset and s(0));
	compara: comparador port map (teclas, memoria, result); -- sinal que eh igual a 1 quando a sua entrada eh igual a senha salva
	R3: Registrador_2 port map (n, '1', reset, clk, s); -- registrador que ira mudar os estados da maquina
	R8: Registrador_8 port map (teclas, 1, reset, clock, memoria) --registrador que ira salvar a senha

end cofre;