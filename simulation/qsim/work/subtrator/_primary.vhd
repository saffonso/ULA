library verilog;
use verilog.vl_types.all;
entity subtrator is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        s               : out    vl_logic_vector(3 downto 0);
        v               : out    vl_logic;
        carry           : out    vl_logic
    );
end subtrator;
