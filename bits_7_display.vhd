LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY bits_7_display IS
	PORT(
		binary_input: in std_logic_vector(4 downto 0);
		s: out std_logic_vector(13 downto 0)
	);
end bits_7_display;

architecture arq_bits_7_display of bits_7_display is
begin
	with binary_input select
	
	s <= "10000001000000" when "00000", -- Números positivos sem sinal.
		  "10000001111001" when "00001",
		  "10000000100100" when "00010",
		  "10000000110000" when "00011",
		  "10000000011001" when "00100",
		  "10000000010010" when "00101",
		  "10000000000010" when "00110",
		  "10000001111000" when "00111",
		  "10000000000000" when "01000",
		  "10000000010000" when "01001",
		  "11110011000000" when "01010",
		  "11110011111001" when "01011",
		  "11110010100100" when "01100",
		  "11110010110000" when "01101",
		  "11110010011001" when "01110",
		  "11110010010010" when "01111",
		  
		  "01111110111111" when others; -- Inválido.
end arq_bits_7_display;