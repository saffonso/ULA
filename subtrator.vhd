library ieee;
use ieee.std_logic_1164.all;

entity subtrator is
port (a : in std_logic_vector(3 downto 0);
      b : in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0);
		v : out std_logic;
		z,n, carry : out std_logic
		);
end subtrator;

architecture arq_subtrator of subtrator is

component SC is
Port(ai : in std_logic;
     bi : in std_logic;
	  ci : in std_logic;
	  s0 : out std_logic;
	  cout : out std_logic
);
end component;

signal c,not_b, tw  : std_logic_vector(3 downto 0);


begin
   not_b(0) <= not b(0);
	not_b(1) <= not b(1);
	not_b(2) <= not b(2);
	not_b(3) <= not b(3);   
s <= tw;
M0: SC port map(ai => a(0),
                bi =>  not_b(0),
					 ci => '1',
					 s0 => tw(0),
					 cout => c(0));

M1: SC port map(ai => a(1),
                bi => not_b(1),
					 ci => c(0),
					 s0 => tw(1),
					 cout => c(1));

M2: SC port map(ai => a(2),
                bi => not_b(2),
					 ci => c(1),
					 s0 => tw(2),
					 cout => c(2));
					 
M3: SC port map(ai => a(3),
                bi => not_b(3),
					 ci => c(2),
					 s0 => tw(3),
					 cout => c(3)
					 );

v <= c(2) xor c(3);
n <= tw(3);
z <= not(tw(0)or tw(1)or tw(2) or tw(3));
carry <= c(3);
end arq_subtrator;
