LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity ULA is 
Port(
		a,b : in std_logic_vector(3 downto 0);
		v,z, c : out std_logic;
		n : OUT std_logic;
		AUX_1 , AUX_2 : OUT std_logic_vector(1 downto 0);
		sel : in std_logic_vector(2 downto 0);
		y : out std_logic_vector(3 downto 0);
		s : out std_logic_vector(13 downto 0)
);
end ULA;

architecture arq_ula of ULA is
type array_of_7_3_down_to_0_vectors is array (0 to 6) of std_logic_vector(3 downto 0);
SIGNAL result: array_of_7_3_down_to_0_vectors;
SIGNAL n_local: std_logic;
SIGNAL c_local: std_logic_vector(1 downto 0);
SIGNAL v_local: std_logic_vector(1 downto 0);
signal aux_y : std_logic_vector(3 downto 0);


component soma4bits
port (a : in std_logic_vector(3 downto 0);
      b : in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0);
		V,Z,N,carry: OUT std_logic
		);
end component;

component A_and_B
Port(
	a,b : in std_logic_vector(3 downto 0 );
	s : out std_logic_vector(3 downto 0 )
);
end component;

component A_or_B
Port(

	a,b : in std_logic_vector(3 downto 0);
	s : out std_logic_vector(3 downto 0)
);
end component;

component not_a
Port(

	a : in std_logic_vector(3 downto 0);
	s : out std_logic_vector(3 downto 0)
);
end component;

component subtrator 
port (a : in std_logic_vector(3 downto 0);
      b : in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0);
		v : out std_logic;
		z,n, carry : out std_logic
		);
end component;

component shift_r
PORT(
		a: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0)
	);
end component;

component shift_l
PORT(
		a: in std_logic_vector(3 downto 0);
		s: out std_logic_vector(3 downto 0)
	);
end component;


component bits_7_display
PORT(
		binary_input: in std_logic_vector(4 downto 0);
		s: out std_logic_vector(13 downto 0)
	);
end component;

begin

	add_op: soma4bits
		port map(a => a,
               b => b,
					s => result(0),
					v => v_local(0),
					carry => c_local(0));
	sub_op : subtrator
		port map(a => a,
					b => b,
					s => result(1),
					v => v_local(1),
					carry => c_local(1),
					n => n);
	and_op : A_and_B
		port map(a => a,
					b => b,
					s => result(4));
	or_op : A_or_B
		port map(a => a,
					b => b,
					s => result(5));
	not_op : not_a
		port map(a => a,
					s => result(6));
	shift_l_op : shift_l
		port map(a => a,
					s => result(2));
	shift_r_op : shift_r
		port map(a => a,
					s => result(3));
	with sel select
		aux_y <=         result(0) when "000", -- add
							  result(4) when "001", -- sub
							  result(2) when "010", -- shift left
							  result(6) when "011", -- shift right
							  result(1) when "100", -- and
							  result(5) when "101", -- or
							  result(3) when "110", -- not
							  
							   "0000"  when others ; -- null
		
	
	with aux_y select
		
		z <=  '1' when "0000",
		
				'0' when others;
				
	v <= (v_local(1) or v_local(0)); -- overflow
                    -- negativo
	c <= (c_local(1) and c_local(0));	-- carry
		
	 y <= aux_y;
	convert_to_7_display: bits_7_display
		port map(binary_input(3 downto 0) => aux_y(3 downto 0), 
					s => s);				
					
					
end arq_ula;					
-- SUB = ANDC, AND = SUBC, SHIFT RIGHT = ERRADO, NOT = SHIFT RIGHT, SHIFT RIGHT = NOT. 
