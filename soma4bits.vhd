library ieee;
use ieee.std_logic_1164.all;

entity soma4bits is
port (a : in std_logic_vector(3 downto 0);
      b : in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0);
		V,Z,N,carry: out std_logic
		);
end soma4bits;

architecture arq_soma4bits of soma4bits is

component MS is
Port(a0 : in std_logic;
     b0 : in 	std_logic;
	  s0 : out 	std_logic;
	  c0 : out 	std_logic);
end component;

component SC is
Port(ai : in std_logic;
     bi : in std_logic;
	  ci : in std_logic;
	  s0 : out std_logic;
	  cout : out std_logic);
end component;

signal c, tw : std_logic_vector(3 downto 0);


begin
s <= tw;
M0: MS port map(a0 => a(0),
                b0 => b(0),
					 c0 => c(0),
					 s0 => tw(0));

M1: SC port map(ai => a(1),
                bi => b(1),
					 ci => c(0),
					 s0 => tw(1),
					 cout => c(1));

M2: SC port map(ai => a(2),
                bi => b(2),
					 ci => c(1),
					 s0 => tw(2),
					 cout => c(2));
					 
M3: SC port map(ai => a(3),
                bi => b(3),
					 ci => c(2),
					 s0 => tw(3),
					 cout => c(3));
v <= c(2) xor c(3); -- Detecção de overflow.
n <= tw(3); -- O número é negativo quando o bit mais significativo for 1.
z <= not (tw(0) or tw(1) or tw(2) or tw(3)); -- o número é zero quando nenhum bit for 1.
carry <= c(3);
end arq_soma4bits;
