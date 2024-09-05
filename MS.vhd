LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity MS is
Port(a0 : in std_logic;
     b0 : in 	std_logic;
	  s0 : out 	std_logic;
	  c0 : out 	std_logic);
end MS;

architecture Arq of MS is
begin

s0 <= a0 xor b0;
c0 <= a0 and b0;


end Arq;