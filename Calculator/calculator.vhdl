library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity calculator is
    port (
        	A, B      : in std_logic_vector(3 downto 0); -- 4-bit inputs
        	SW_Add    : in std_logic;  -- Use SW11 for addition
        	SW_Sub    : in std_logic;  -- Use SW12 for subtraction
        	Result    : out std_logic_vector(3 downto 0);
        	Cout      : out std_logic;
        	Overflow  : out std_logic;
        	seg_out   : out std_logic_vector(6 downto 0);
        	anode     : out std_logic_vector(7 downto 0)
    								);
end entity;

architecture Behavioral of calculator is

    component rca_4bit
        port (
            	A, B : in std_logic_vector(3 downto 0);
            	Cin  : in std_logic;
            	SUM  : out std_logic_vector(3 downto 0);
            	Cout : out std_logic
        							);
    end component;

    
    component Subtractor
        port (
            	A, B : in std_logic_vector(3 downto 0);
		Cin  : in std_logic;
            	Diff : out std_logic_vector(3 downto 0);
            	Cout : out std_logic
        							);
    end component;

    component BCD_TO_7_segment_Decoder
        port (
            ABCD   : in std_logic_vector(3 downto 0);
            OUTPUT : out std_logic_vector(6 downto 0);
            anode  : out std_logic_vector(7 downto 0)
        							);
    end component;

    signal Sum_result, Sub_result : std_logic_vector(3 downto 0);
    signal Carry_add, Carry_sub   : std_logic;
    signal active_result           : std_logic_vector(3 downto 0);
    signal active_carry            : std_logic;

begin
  U1: rca_4bit port map (
            		A => A,
            		B => B,
           		Cin => '0',
            		SUM => Sum_result,
            		Cout => Carry_add
       						);
  U2: Subtractor port map (
            		A => A,
            		B => B,
			Cin => '1',
		        Diff => Sub_result,
            		Cout => Carry_sub
        					);

   active_result <= Sum_result when SW_Add = '1' else
                     Sub_result when SW_Sub = '1' else
                     (others => '0');

    active_carry <= Carry_add when SW_Add = '1' else
                    Carry_sub when SW_Sub = '1' else
                    '0';

    Result <= active_result;
    Cout <= active_carry;

    U3: BCD_TO_7_segment_Decoder port map (
            		ABCD   => active_result,
            		OUTPUT => seg_out
        					);
   
end architecture;

