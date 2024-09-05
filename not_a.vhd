library IEEE;
USE IEEE.std_logic_1164.all;

entity not_a is
Port(

	a : in std_logic_vector(3 downto 0);
	s : out std_logic_vector(3 downto 0)

);
end not_a;

architecture arq_not_a of not_a is
begin

s <= not a;


end arq_not_a;