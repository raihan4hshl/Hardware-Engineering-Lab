library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Subtractor is
    port (
        A, B : in std_logic_vector(3 downto 0);
        Cin  : in std_logic;
        Diff : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end Subtractor;

architecture Behavioral of Subtractor is
    signal temp : signed(4 downto 0);
begin
    temp <= signed('0' & A) - signed('0' & B);
    Diff <= std_logic_vector(temp(3 downto 0));
    Cout <= temp(4);
end Behavioral;
