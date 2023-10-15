library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_decoder is
	port (INPUT_A: in std_logic_vector (3 downto 0);
		HEXOUT : out std_logic_vector (6 downto 0));
end entity;

architecture Behavioural of hex_decoder is
begin
	process(INPUT_A)
		begin
			case INPUT_A is
				when "0000" => HEXOUT <= "1000000"; --0
				when "0001" => HEXOUT <= "1111001"; --1
				when "0010" => HEXOUT <= "0100100"; --2
				when "0011" => HEXOUT <= "0110000"; --3
				when "0100" => HEXOUT <= "0011001"; --4
				when "0101" => HEXOUT <= "0010010"; --5
				when "0110" => HEXOUT <= "0000010"; --6
				when "0111" => HEXOUT <= "1111000"; --7
				when "1000" => HEXOUT <= "0000000"; --8
				when "1001" => HEXOUT <= "0010000"; --9
				when "1010" => HEXOUT <= "0001000"; --A
				when "1011" => HEXOUT <= "0000011"; --B
				when "1100" => HEXOUT <= "0100111"; --C
				when "1101" => HEXOUT <= "0100001"; --D
				when "1110" => HEXOUT <= "0000110"; --E
				when "1111" => HEXOUT <= "0001110"; --F
				when others => HEXOUT <= "-------"; --invalid G
			end case;
		end process;
end Behavioural;
