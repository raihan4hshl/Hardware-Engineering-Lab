library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Half_Adder is
	port(A,B: in STD_LOGIC;
		SUM,Cout: out STD_LOGIC);
end entity;

architecture Data of Half_Adder is 
	begin 
		SUM<=A XOR B;
		Cout<=A AND B;
end architecture;
