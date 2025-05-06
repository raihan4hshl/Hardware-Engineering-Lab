library ieee;
use ieee.std_logic_1164.all;

entity rca_4bit is
	port (A, B: in STD_LOGIC_VECTOR(3 downto 0); 
		Cin: in STD_LOGIC; 
		SUM: out STD_LOGIC_VECTOR(3 downto 0); 
		Cout: out STD_LOGIC);
end rca_4bit;

architecture Structure of rca_4bit is
	component Full_Adder
			port(A, B, Cin: in STD_LOGIC;
				SUM, Cout: out STD_LOGIC);
	end component;

signal C1, C2, C3: STD_LOGIC;

begin
	FA0: Full_Adder port map (A(0), B(0), Cin, SUM(0), C1);
	FA1: Full_Adder port map (A(1), B(1), C1, SUM(1), C2);
	FA2: Full_Adder port map (A(2), B(2), C2, SUM(2), C3);
	FA3: Full_Adder port map (A(3), B(3), C3, SUM(3), Cout);
end Structure;