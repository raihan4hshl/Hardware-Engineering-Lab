library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity rca_4bit_TB is 
end entity;

architecture Behavior of rca_4bit_TB is
	component  rca_4bit
		port(A, B: in STD_LOGIC_VECTOR(3 downto 0); 
			Cin: in STD_LOGIC; 
			SUM: out STD_LOGIC_VECTOR(3 downto 0); 
			Cout: out STD_LOGIC);
	end component;

signal A_TB, B_TB: STD_LOGIC_VECTOR(3 downto 0);
signal Cin_TB: STD_LOGIC;
signal SUM_TB: STD_LOGIC_VECTOR(3 downto 0);
signal Cout_TB: STD_LOGIC;

begin 

	DUT1: rca_4bit port map(A_TB, B_TB, Cin_TB, SUM_TB, Cout_TB);
	process
		begin
		
        A_TB    <= "0000"; 
        B_TB    <= "0000";  
        Cin_TB  <= '0';
        wait for 10 ns;

        
        A_TB    <= "0001";  
        B_TB    <= "0010";  
        Cin_TB  <= '0';
        wait for 10 ns;

        
        A_TB    <= "0011"; 
        B_TB    <= "0100";  
        Cin_TB  <= '0';
        wait for 10 ns;

        
        A_TB    <= "0110";
        B_TB    <= "1000";
        Cin_TB  <= '0';
        wait for 10 ns;

	A_TB    <= "0101";
        B_TB    <= "0101";
        Cin_TB  <= '0';
        wait for 10 ns;

	A_TB    <= "1000";
        B_TB    <= "0110";
        Cin_TB  <= '1';
        wait for 10 ns;

	A_TB    <= "0000";
        B_TB    <= "0001";
        Cin_TB  <= '1';
        wait for 10 ns;

	A_TB    <= "0111"; 
        B_TB    <= "1000"; 
        Cin_TB  <= '1';
        wait for 10 ns;

        A_TB    <= "1111";  
        B_TB    <= "1111";  
        Cin_TB  <= '0';
        wait for 10 ns;

	wait;
	end process;
end Behavior;