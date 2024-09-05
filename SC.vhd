LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity SC is
Port(ai : in std_logic;
     bi : in std_logic;
	  ci : in std_logic;
	  s0 : out std_logic;
	  cout : out std_logic);
end SC;

architecture Arq of SC is
begin

s0 <= ai xor bi xor ci;
cout <= (ai and bi) or (ai and ci) or (bi and ci);

end Arq;