entity HalfAdder_TB  is
end HalfAdder_TB;

architecture Behavioral of HalfAdder_TB  is
	component HalfAdder
		port(A,B: in bit;
			S,C: out bit);
	end component;

signal A_TB, B_TB: bit;
signal S_TB, C_TB: bit;

begin 
DUT1: HalfAdder port map(
			A=>A_TB, 
			B=>B_TB,
			S=>S_TB,
			C=>C_TB);

A_TB <= '0', '0' after 15ns, '1' after 30ns, '1' after 45ns;
B_TB <= '0', '1' after 15ns, '0' after 30ns, '1' after 45ns;

end Behavioral;
