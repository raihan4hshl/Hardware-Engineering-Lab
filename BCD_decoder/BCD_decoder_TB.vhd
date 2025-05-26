entity BCD_DECODER_TB is
end BCD_DECODER_TB;

architecture Behavior of BCD_DECODER_TB is
	component BCD_Decoder
		port(
			A0,A1,A2,A3: in bit;
			OUT0, OUT1, OUT2, OUT3, OUT4, OUT5, OUT6, OUT7, OUT8, OUT9: out bit); 
	end component;


signal A0_TB,A1_TB,A2_TB,A3_TB: bit;
signal OUT0_TB, OUT1_TB, OUT2_TB, OUT3_TB, OUT4_TB,OUT5_TB,OUT6_TB, OUT7_TB, 
	OUT8_TB, OUT9_TB: bit;

begin
DUT1: BCD_Decoder port map(
			A0=>A0_TB,A1=>A1_TB,A2=>A2_TB,A3=>A3_TB,
			OUT0=>OUT0_TB, OUT1=>OUT1_TB, OUT2=>OUT2_TB, OUT3=>OUT3_TB, 
			OUT4=>OUT4_TB, OUT5=>OUT5_TB,OUT6=>OUT6_TB, OUT7=>OUT7_TB, 
			OUT8=>OUT8_TB, OUT9=>OUT9_TB);

A0_TB<='0', '1' after 15ns, '0' after 30ns, '1' after 45ns, '0' after 60ns,'1' after 75ns, 
     '0' after 90ns,'1' after 105ns, '0' after 120ns, '1' after 135ns, '0' after 150ns;
A1_TB<='0', '1' after 30ns, '0' after 60ns, '1' after 90ns, '0' after 120ns,'1' after 150ns;
A2_TB<='0', '1' after 60ns, '0' after 120ns;
A3_TB<='0', '1' after 120ns;

end architecture Behavior;

