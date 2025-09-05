library verilog;
use verilog.vl_types.all;
entity Lab6_vlg_check_tst is
    port(
        R_First_Four    : in     vl_logic_vector(3 downto 0);
        R_Last_Four     : in     vl_logic_vector(3 downto 0);
        sign            : in     vl_logic_vector(0 to 6);
        StudentID       : in     vl_logic_vector(0 to 6);
        sampler_rx      : in     vl_logic
    );
end Lab6_vlg_check_tst;
