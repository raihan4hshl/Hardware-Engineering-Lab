entity HalfAdder is
	port(A,B: in bit;
		S,C: out bit);
end entity;

architecture Data of HalfAdder is 
	begin 
		S<=A XOR B;
		C<=A AND B;
end architecture;
