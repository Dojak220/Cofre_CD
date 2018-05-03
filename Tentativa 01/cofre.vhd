library ieee;
use ieee.std_logic_1164.all;

entity cofre is
	port(
		teclas: in std_logic_vector(7 downto 0);
		cs, reset, clk, clk_FPGA: in std_logic;
		modo, abre, bloqueado, salvou: out std_logic;
      estado : out std_logic_vector(2 downto 0)
		);
end cofre;

architecture estrutura of cofre is
 --signal estado: std_logic_vector(2 downto 0) := "000";
   signal estado_aux: std_logic_vector(2 downto 0) := "000";
	signal senha_memoria: std_logic_vector(7 downto 0) := "00000000";
	signal entrada: std_logic_vector(7 downto 0);
	signal resultado_compara: std_logic := '0';
	signal compare : std_logic_vector(7 downto 0) := "00000000";
	signal senha_salva: std_logic := '0';
	signal led_bloq, led_abre, led_modo: std_logic := '0';
 --signal bloq: std_logic := '0';
	
	
	begin
		process(estado_aux, clk, clk_FPGA, cs, senha_salva, reset)
	
		begin
		if clk_FPGA='1' and clk_FPGA'event then
			case estado_aux is
				when "000" => --modo conf
					led_bloq <= '0';
					led_modo <= '1';
					led_abre <= '1';
					
					if (cs = '0' and clk = '0' and (senha_salva = '0')) then
						estado_aux <= "001";
					end if;
					if (cs = '1' and clk = '0' and (senha_salva = '1')) then
						estado_aux <="010";
					end if;
				when "001" => --modo salva
					senha_memoria(0)<= entrada(0);
					senha_memoria(1)<= entrada(1);
					senha_memoria(2)<= entrada(2);
					senha_memoria(3)<= entrada(3);
					senha_memoria(4)<= entrada(4);
					senha_memoria(5)<= entrada(5);
					senha_memoria(6)<= entrada(6);
					senha_memoria(7)<= entrada(7);
					 
					senha_salva <= '1';
					estado_aux <= "000";
					
					
				when "010" => --modo seg/op
					led_modo <= '1';
					led_abre <= '1';
					led_bloq <= '0';
					
					if (clk = '0' and cs = '0') then
						estado_aux <= "000";
						
					elsif (clk = '0' and cs = '1') then
						estado_aux <= "011";
					end if;
				
				when "011" => --comparando
					
					compare(0) <= entrada(0) XNOR senha_memoria(0); 
					compare(1) <= entrada(1) XNOR senha_memoria(1);  
					compare(2) <= entrada(2) XNOR senha_memoria(2); 
					compare(3) <= entrada(3) XNOR senha_memoria(3); 
					compare(4) <= entrada(4) XNOR senha_memoria(4); 
					compare(5) <= entrada(5) XNOR senha_memoria(5);  
					compare(6) <= entrada(6) XNOR senha_memoria(6); 
					compare(7) <= entrada(7) XNOR senha_memoria(7); 
 					resultado_compara <= (compare(0) and compare(1) and compare(2) and compare(3) and compare(4) and compare(5) and compare(6) and compare(7));
					if (resultado_compara = '1') then
						estado_aux <= "100";
					else 
						estado_aux <= "101";
					end if;
				when "100" => --aberto
					led_abre <= '0';
					led_bloq <= '0';
					led_modo <= '0';
					
					if (reset = '0') then --volta seg/op
						estado_aux <= "010";
					end if;
				when "101" => --bloqueado
					led_abre <= '1';
					led_bloq <= '1';
					led_modo <= '1';

					if (reset = '0') then
						estado_aux <= "110";
					end if;			
				when "110" => --espera
					led_bloq <= '0';
					senha_memoria <= "00000000";
					estado_aux <= "000";
					senha_salva <= '0';

				when others =>
					estado_aux <= "010";--seg/op
				end case;
			end if;
					--estado <= estado_aux;
				end process;
		
				modo <= led_modo;
				abre <= led_abre;
				bloqueado <= led_bloq;
				salvou <= senha_salva;
				estado <= estado_aux;
end estrutura;