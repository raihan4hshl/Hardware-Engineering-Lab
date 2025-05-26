library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_BCDto7Seg is
end TB_BCDto7Seg;

architecture Behavioral of TB_BCDto7Seg is

    signal bcd : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal seg : STD_LOGIC_VECTOR(6 downto 0);

begin

    -- Instantiate the decoder
    UUT: entity work.BCDto7Seg
        port map (
            bcd => bcd,
            seg => seg
        );

    -- Stimulus: step through 0?9, then stop
    stim_proc: process
    begin
        for i in 0 to 9 loop
            bcd <= std_logic_vector(to_unsigned(i, 4));
            wait for 20 ns;  -- give time to see the wave
        end loop;
        wait;  -- finish simulation
    end process;

end Behavioral;

