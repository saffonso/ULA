library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        v               : out    vl_logic;
        z               : out    vl_logic;
        c               : out    vl_logic;
        n               : out    vl_logic;
        AUX_1           : out    vl_logic;
        AUX_2           : out    vl_logic;
        sel             : in     vl_logic_vector(2 downto 0);
        y               : out    vl_logic_vector(3 downto 0);
        s               : out    vl_logic_vector(13 downto 0)
    );
end ULA;
