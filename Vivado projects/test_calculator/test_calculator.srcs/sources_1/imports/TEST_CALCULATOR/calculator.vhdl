library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity calculator is
    port (
        clk     : in std_logic;
        A, B    : in std_logic_vector(3 downto 0);
        SW_Add  : in std_logic;
        SW_Sub  : in std_logic;
        seg     : out std_logic_vector(6 downto 0);
        an      : out std_logic_vector(7 downto 0)
    );
end calculator;

architecture Behavioral of calculator is

    component rca_4bit
        port (
            A, B  : in std_logic_vector(3 downto 0);
            Cin   : in std_logic;
            SUM   : out std_logic_vector(3 downto 0);
            Cout  : out std_logic
        );
    end component;

    component Subtractor
        port (
            A, B  : in std_logic_vector(3 downto 0);
            Diff  : out std_logic_vector(3 downto 0);
            Cout  : out std_logic
        );
    end component;

    component BCD_TO_7_segment_Decoder
        port (
            ABCD : in std_logic_vector(3 downto 0);
            seg  : out std_logic_vector(6 downto 0)
        );
    end component;

    signal Sum_result, Sub_result : std_logic_vector(3 downto 0);
    signal selected_result        : std_logic_vector(3 downto 0);
    signal refresh_counter        : unsigned(16 downto 0) := (others => '0');
    signal digit_select           : std_logic_vector(1 downto 0);
    signal display_val            : std_logic_vector(3 downto 0);

begin

    -- Instantiate components
    add_inst: rca_4bit port map(
        A => A,
        B => B,
        Cin => '0',
        SUM => Sum_result,
        Cout => open
    );

    sub_inst: Subtractor port map(
        A => A,
        B => B,
        Diff => Sub_result,
        Cout => open
    );

    selected_result <= Sum_result when SW_Add = '1' else
                       Sub_result when SW_Sub = '1' else
                       (others => '0');

    -- Refresh counter driven by clock (50MHz assumed)
    process(clk)
    begin
        if rising_edge(clk) then
            refresh_counter <= refresh_counter + 1;
        end if;
    end process;

    digit_select <= std_logic_vector(refresh_counter(16 downto 15));

    process(digit_select)
    begin
        case digit_select is
            when "00" =>
                display_val <= A;
                an <= "11111110"; -- AN0
            when "01" =>
                display_val <= B;
                an <= "11111011"; -- AN2
            when "10" =>
                display_val <= selected_result;
                an <= "01111111"; -- AN7
            when others =>
                display_val <= "0000";
                an <= "11111111";
        end case;
    end process;

    -- Display value on 7-segment
    seg_decoder: BCD_TO_7_segment_Decoder port map(
        ABCD => display_val,
        seg  => seg
    );

end Behavioral;
