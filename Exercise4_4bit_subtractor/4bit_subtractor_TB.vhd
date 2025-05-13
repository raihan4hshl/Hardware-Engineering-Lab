library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Four_bit_subtractor_TB is 
end entity;

architecture behavior of Four_bit_subtractor_TB is 
	component Four_bit_subtractor
		port(X,Y: in std_logic_vector(3 downto 0);
		ADDnSUB: in std_logic;
		Result: out std_logic_vector(3 downto 0);
		FinalCarry: out std_logic);
	end component;

signal X_TB, Y_TB: std_logic_vector(3 downto 0);
signal ADDnSUB_TB: std_logic;
signal Result_TB: std_logic_vector(3 downto 0);
signal FinalCarry_TB: std_logic;

begin

DUT1: Four_bit_subtractor
	port map(X=>X_TB, Y=>Y_TB, ADDnSUB=>ADDnSUB_TB, Result=>Result_TB, FinalCarry=>FinalCarry_TB);
process
begin
-- ADD 5 + 3 = 8
        X_TB <= "0101"; Y_TB <= "0011"; ADDnSUB_TB <= '0';
        wait for 10 ns;

        -- SUB 5 - 3 = 2
        X_TB <= "0101"; Y_TB <= "0011"; ADDnSUB_TB <= '1';
        wait for 10 ns;

        -- ADD 7 + 8 = 15
        X_TB <= "0111"; Y_TB <= "1000"; ADDnSUB_TB <= '0';
        wait for 10 ns;

        -- SUB 7 - 8 = -1 (two's complement)
        X_TB <= "0111"; Y_TB <= "1000"; ADDnSUB_TB <= '1';
        wait for 10 ns;

        -- Edge case: 0 - 1 = -1
        X_TB <= "0000"; Y_TB <= "0001"; ADDnSUB_TB <= '1';
        wait for 10 ns;

        wait;
    end process;

end architecture;


