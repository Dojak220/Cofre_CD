library ieee;
use ieee.std_logic_1164.all;

entity cofre is
	port(
		teclas: in std_logic_vector(7 downto 0);
		teclasSAIDA: out std_logic_vector(7 downto 0);
		cs, reset, clk, clk_FPGA: in std_logic;
		modo, abre, bloqueado, salvou: out std_logic;
		memoria: out std_logic_vector(7 downto 0);
      estado : out std_logic_vector(2 downto 0)
		);
end cofre;

architecture estrutura of cofre is
   signal estado_aux: std_logic_vector(2 downto 0) := "000";
	signal senha_memoria: std_logic_vector(7 downto 0) := "00000000";
	signal entrada: std_logic_vector(7 downto 0) := "00000000";
	signal resultado_compara: std_logic := '0';
	signal compare : std_logic_vector(7 downto 0) := "00000000";
	signal senha_salva: std_logic := '0';
	signal led_bloq, led_abre, led_modo: std_logic := '0';
	
	
	begin
		process(estado_aux, clk, clk_FPGA, cs, senha_salva, reset)
	
		begin
		if clk_FPGA='1' and clk_FPGA'event then
			case estado_aux is
				when "000" => --modo conf
					led_bloq <= '0';
					led_modo <= '1';
					led_abre <= '1';
					
					if (cs = '0' and clk = '1' and (senha_salva = '0')) then
						estado_aux <= "001";
					elsif (cs = '1' and (senha_salva = '1')) then
						estado_aux <= "010";
					else
						estado_aux <= "000";
					end if;
				when "001" => --modo salva
					senha_memoria <= entrada;
					 
					senha_salva <= '1';
					estado_aux <= "000";
					
					
				when "010" => --modo seg/op
					led_modo <= '1';
					led_abre <= '1';
					led_bloq <= '0';
					
					if (cs = '0') then
						estado_aux <= "000";
					elsif (clk = '1' and cs = '1') then
						estado_aux <= "011";
					else
						estado_aux <="010";
					end if;
				
				when "011" => --comparando
					
					
					if (senha_memoria = entrada) then
						estado_aux <= "100";
					else
						estado_aux <= "101";
					end if;
					
				when "100" => --aberto
					led_abre <= '0';
					led_bloq <= '0';
					
					if (cs = '0') then
						estado_aux <= "000";
					elsif (cs = '1' and reset = '1') then --volta seg/op
						estado_aux <= "010";
					else
						estado_aux <= "100";
					end if;
					
				when "101" => --bloqueado
					led_abre <= '1';
					led_bloq <= '1';

					if (reset = '1') then
						estado_aux <= "110";
					else
						estado_aux <= "101";
					end if;	
					
				when "110" => --espera
					led_bloq <= '0';
					senha_memoria <= "00000000";
					estado_aux <= "000";
					senha_salva <= '0';

				when others =>
				estado_aux <= "010"; --seg/op
				end case;
			end if;
					--estado <= estado_aux;
		end process;
	
		teclasSAIDA <= entrada;     -- saida auxiliar para teste na waveform (teclas ativadas).
		memoria <= senha_memoria;   -- saida auxiliar para teste na waveform (senha salva na memória).
		modo <= led_modo;           -- modo de operação (configuração(0) ou segurança(1)).
		abre <= led_abre;				 -- porta do cofre (aberta(0) ou fechada(1)).
		bloqueado <= led_bloq;		 -- estado do cofre (desbloqueado(0) ou bloqueado(1)).
		salvou <= senha_salva;		 -- indica se a senha está salva(1) ou não está salva(0).
		estado <= estado_aux;       -- o sinal estado_aux é atribuido à saida estado.
		entrada <= teclas;			 -- as teclas são usandas como sinal no process.

end estrutura;