library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity part_2 is
	port (SW: in std_logic_vector (3 downto 0);
		LEDR : out std_logic_vector (3 downto 0);
		HEX0 : out std_logic_vector (6 downto 0);
		HEX1 : out std_logic_vector (6 downto 0);
		HEX2 : out std_logic_vector (6 downto 0));
end part_2;

architecture Behavioural of part_2 is
	component hex_decoder
		Port(	INPUT_A : in std_logic_vector (3 downto 0);
				HEXOUT : out std_logic_vector (6 downto 0));
	end component;
	
begin
	LEDR <= SW;
	
			--instantiating HEX Decoder 1
			HEXOUT1 : hex_decoder
				port map(	INPUT_A => SW,
								HEXOUT => HEX0
				);
	
			--instantiating HEX Decoder 2
			HEXOUT2 : hex_decoder
				port map(	INPUT_A => SW,
								HEXOUT => HEX1
				);
	
			--instantiating HEX Decoder 3
			HEXOUT3 : hex_decoder
				port map(	INPUT_A => SW,
								HEXOUT => HEX2
				);
end Behavioural;
	
