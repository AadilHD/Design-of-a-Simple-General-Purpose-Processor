library verilog;
use verilog.vl_types.all;
entity Lab6_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        En              : in     vl_logic;
        Reset           : in     vl_logic;
        reset_FSM       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Lab6_vlg_sample_tst;
