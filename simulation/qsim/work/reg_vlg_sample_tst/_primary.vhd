library verilog;
use verilog.vl_types.all;
entity reg_vlg_sample_tst is
    port(
        B               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        res             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end reg_vlg_sample_tst;
