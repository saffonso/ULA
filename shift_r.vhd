LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY shift_l IS
	PORT(
		a: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0)
	);
end shift_l;

architecture arq_shift_l of shift_l is

begin
	s(0) <= a(1);
	s(1) <= a(2);
	s(2) <= a(3);
	s(3) <= '0';
end arq_shift_l;