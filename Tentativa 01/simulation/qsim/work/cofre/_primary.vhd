library verilog;
use verilog.vl_types.all;
entity cofre is
    port(
        teclas          : in     vl_logic_vector(7 downto 0);
        cs              : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        clk_FPGA        : in     vl_logic;
        modo            : out    vl_logic;
        abre            : out    vl_logic;
        bloqueado       : out    vl_logic;
        salvou          : out    vl_logic;
        estado          : out    vl_logic_vector(2 downto 0)
    );
end cofre;
