library ieee;
use ieee.std_logic_1164.all;

entity A_or_B is
Port(

	a,b : in std_logic_vector(3 downto 0);
	s : out std_logic_vector(3 downto 0)
);
end A_or_B;

architecture arq_A_or_b of A_or_B is
begin

s <= a or b;

end arq_A_or_b;

