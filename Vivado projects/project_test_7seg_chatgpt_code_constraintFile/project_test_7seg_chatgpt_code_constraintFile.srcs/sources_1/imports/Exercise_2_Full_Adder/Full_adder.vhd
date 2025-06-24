library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_segment_display is
    Port ( clk     : in  STD_LOGIC;          -- 100 MHz clock
           an      : out STD_LOGIC_VECTOR(3 downto 0); -- Anode controls (active low)
           seg     : out STD_LOGIC_VECTOR(6 downto 0); -- Segments a to g (active low)
           dp      : out STD_LOGIC           -- Decimal point (active low)
         );
end seven_segment_display;

architecture Behavioral of seven_segment_display is

    signal refresh_counter : unsigned(16 downto 0) := (others => '0');
    signal digit_select    : unsigned(1 downto 0) := (others => '0');
    signal current_digit   : std_logic_vector(3 downto 0);
    type digit_array is array(0 to 3) of std_logic_vector(3 downto 0);
    signal digits : digit_array := (
        "0001", -- 1
        "0010", -- 2
        "0011", -- 3
        "0100"  -- 4
    );

begin

    -- Refresh rate: ~1ms (100 MHz / 100000)
    process(clk)
    begin
        if rising_edge(clk) then
            refresh_counter <= refresh_counter + 1;
            if refresh_counter = 99999 then
                refresh_counter <= (others => '0');
                digit_select <= digit_select + 1;
            end if;
        end if;
    end process;

    -- Anode control (active LOW)
    process(digit_select)
    begin
        an <= "1111";  -- default all off
        case digit_select is
            when "00" => an(0) <= '0';
            when "01" => an(1) <= '0';
            when "10" => an(2) <= '0';
            when "11" => an(3) <= '0';
            when others => null;
        end case;
    end process;

    -- Assign current digit
    current_digit <= digits(to_integer(digit_select));

    -- Decimal point OFF
    dp <= '1';

    -- Segment decoder (common anode: active LOW)
    process(current_digit)
    begin
        case current_digit is
            when "0000" => seg <= "1000000"; -- 0
            when "0001" => seg <= "1111001"; -- 1
            when "0010" => seg <= "0100100"; -- 2
            when "0011" => seg <= "0110000"; -- 3
            when "0100" => seg <= "0011001"; -- 4
            when "0101" => seg <= "0010010"; -- 5
            when "0110" => seg <= "0000010"; -- 6
            when "0111" => seg <= "1111000"; -- 7
            when "1000" => seg <= "0000000"; -- 8
            when "1001" => seg <= "0010000"; -- 9
            when others => seg <= "1111111"; -- blank
        end case;
    end process;

end Behavioral;
