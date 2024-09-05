library verilog;
use verilog.vl_types.all;
entity ULA_vlg_check_tst is
    port(
        AUX_1           : in     vl_logic;
        AUX_2           : in     vl_logic;
        c               : in     vl_logic;
        n               : in     vl_logic;
        s               : in     vl_logic_vector(13 downto 0);
        v               : in     vl_logic;
        y               : in     vl_logic_vector(3 downto 0);
        z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ULA_vlg_check_tst;
