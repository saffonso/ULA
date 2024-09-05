library verilog;
use verilog.vl_types.all;
entity subtrator_vlg_check_tst is
    port(
        carry           : in     vl_logic;
        s               : in     vl_logic_vector(3 downto 0);
        v               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end subtrator_vlg_check_tst;
