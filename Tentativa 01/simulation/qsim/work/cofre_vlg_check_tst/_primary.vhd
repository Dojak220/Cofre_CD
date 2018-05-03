library verilog;
use verilog.vl_types.all;
entity cofre_vlg_check_tst is
    port(
        abre            : in     vl_logic;
        bloqueado       : in     vl_logic;
        estado          : in     vl_logic_vector(2 downto 0);
        modo            : in     vl_logic;
        salvou          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end cofre_vlg_check_tst;
