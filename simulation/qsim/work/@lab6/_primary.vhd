library verilog;
use verilog.vl_types.all;
entity Lab6 is
    port(
        R_First_Four    : out    vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        Reset           : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        En              : in     vl_logic;
        data_in         : in     vl_logic;
        reset_FSM       : in     vl_logic;
        R_Last_Four     : out    vl_logic_vector(3 downto 0);
        sign            : out    vl_logic_vector(0 to 6);
        StudentID       : out    vl_logic_vector(0 to 6)
    );
end Lab6;
