LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY add IS
	PORT(
		a, b: in std_logic_vector(3 downto 0);
		v, z, n: out std_logic
	);
end add;

architecture arq_add of add is

SIGNAL c: std_logic_vector(1 downto 0);
signal s: std_logic_vector(3 downto 0);
COMPONENT soma4bits
	port (a : in std_logic_vector(3 downto 0);
      b : in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0);
		carry: out std_logic_vector(1 downto 0)
		);
END COMPONENT;


begin
	add : soma4bits
		port map ( a => a,
					  b => b,
					  s => s,
					  carry => c);
							
		
	v <= c(0) xor c(1); -- Detecção de overflow.
	n <= s(3); -- O número é negativo quando o bit mais significativo for 1.
	z <= not (s(0) or s(1) or s(2) or s(3)); -- o número é zero quando nenhum bit for 1.
end arq_add;