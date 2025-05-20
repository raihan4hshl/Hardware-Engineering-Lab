-- File: tb_bin2bcd.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Bin2BCD is
end TB_Bin2BCD;

architecture Behavioral of TB_Bin2BCD is
    signal binary_in : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal bcd_ones  : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd_tens  : STD_LOGIC_VECTOR(3 downto 0);
begin
    -- Instantiate the converter
    UUT: entity work.BinaryToBCD
        port map (
            binary_in => binary_in,
            bcd_ones  => bcd_ones,
            bcd_tens  => bcd_tens
        );

    -- Stimulus process
    stim_proc: process
        variable i_val    : integer;
        variable ones_val : integer;
        variable tens_val : integer;
    begin
        for i in 0 to 15 loop
            binary_in <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;

            -- convert the output vectors to integers
            ones_val := to_integer(unsigned(bcd_ones));
            tens_val := to_integer(unsigned(bcd_tens));

            -- report as strings of integers
            report
              "Input=" & integer'image(i)
              & " ? Tens=" & integer'image(tens_val)
              & " Ones=" & integer'image(ones_val)
              severity note;
        end loop;
        wait;  -- stop simulation
    end process;

end Behavioral;

