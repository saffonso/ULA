library ieee;
use ieee.std_logic_1164.all;

entity A_and_B is 
Port(
	a,b : in std_logic_vector(3 downto 0 );
	s : out std_logic_vector(3 downto 0 )


);

end A_and_B;

architecture arq_A_and_B of A_and_B is
begin

s <= a and b;

end arq_A_and_B;