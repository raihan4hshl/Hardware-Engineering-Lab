library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BinaryToBCD is
    Port (
        binary_in : in  STD_LOGIC_VECTOR(3 downto 0);
        bcd_ones  : out STD_LOGIC_VECTOR(3 downto 0);
        bcd_tens  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end BinaryToBCD;

architecture Behavioral of BinaryToBCD is
begin
    process(binary_in)
        variable value : integer range 0 to 15;
    begin
        value := to_integer(unsigned(binary_in));
        if value < 10 then
            bcd_tens <= "0000";
            bcd_ones <= std_logic_vector(to_unsigned(value, 4));
        else
            bcd_tens <= "0001";
            bcd_ones <= std_logic_vector(to_unsigned(value - 10, 4));
        end if;
    end process;
end Behavioral;

