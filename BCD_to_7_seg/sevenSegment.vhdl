library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_TO_7_segment_Decoder is
	port (
        ABCD   : in  STD_LOGIC_VECTOR(3 downto 0);
        OUTPUT : out STD_LOGIC_VECTOR(6 downto 0);
        anode     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity BCD_TO_7_segment_Decoder;

architecture LogicOperation of BCD_TO_7_segment_Decoder is
	begin
	anode <= "11110111"; -- Enable only AN0
 process(ABCD)
    begin
        case ABCD is
            when "0000" => OUTPUT <= "0000001"; -- 0
            when "0001" => OUTPUT <= "1001111"; -- 1
            when "0010" => OUTPUT <= "0010010"; -- 2
            when "0011" => OUTPUT <= "0000110"; -- 3
            when "0100" => OUTPUT <= "1001100"; -- 4
            when "0101" => OUTPUT <= "0100100"; -- 5
            when "0110" => OUTPUT <= "0100000"; -- 6
            when "0111" => OUTPUT <= "0001111"; -- 7
            when "1000" => OUTPUT <= "0000000"; -- 8
            when "1001" => OUTPUT <= "0000100"; -- 9
            when others => OUTPUT <= "0000000"; -- blank display
        end case;

        
    end process;
end architecture LogicOperation; 

