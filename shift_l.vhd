LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY shift_r IS
	PORT(
		a: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0)
	);
end shift_r;

architecture arq_shift_r of shift_r is

begin
	s(0) <= '0';
	s(1) <= a(0);
	s(2) <= a(1);
	s(3) <= a(2);
end arq_shift_r;