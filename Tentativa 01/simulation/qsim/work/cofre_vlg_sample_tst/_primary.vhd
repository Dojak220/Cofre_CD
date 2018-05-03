library verilog;
use verilog.vl_types.all;
entity cofre_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clk_FPGA        : in     vl_logic;
        cs              : in     vl_logic;
        reset           : in     vl_logic;
        teclas          : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end cofre_vlg_sample_tst;
