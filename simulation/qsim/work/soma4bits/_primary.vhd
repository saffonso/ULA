library verilog;
use verilog.vl_types.all;
entity soma4bits is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        s               : out    vl_logic_vector(3 downto 0);
        carry           : out    vl_logic_vector(1 downto 0)
    );
end soma4bits;
