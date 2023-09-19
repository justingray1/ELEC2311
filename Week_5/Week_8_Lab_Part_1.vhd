library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Week_8_Lab_Part_1 is
	Port	(
				SW0	:	in		STD_LOGIC;	--Active-low synchronus reset
				SW1	:	in 	STD_LOGIC;	--w input
				KEY0	:	in 	STD_LOGIC;	--clock input
				LEDR9	:	out 	STD_LOGIC;	--z output
				LEDR8	:	out	STD_LOGIC;	--flip flop state 8
				LEDR7	:	out	STD_LOGIC;	--flip flop state 7
				LEDR6	:	out	STD_LOGIC;	--flip flop state 6
				LEDR5	:	out	STD_LOGIC;	--flip flop state 5
				LEDR4	:	out	STD_LOGIC;	--flip flop state 4
				LEDR3	:	out	STD_LOGIC;	--flip flop state 3
				LEDR2	:	out	STD_LOGIC;	--flip flop state 2
				LEDR1	:	out	STD_LOGIC;	--flip flop state 1
				LEDR0	:	out	STD_LOGIC	--flip flop state 0
			);
end entity Week_8_Lab_Part_1;

Architecture Behavioural of Week_8_Lab_Part_1 is

	signal Y_state : std_logic_vector(8 downto 0);
	
begin

	process(SW0, SW1, KEY0, Y_state)
	
	begin
		if falling_edge(KEY0) then
		
			if SW0 = '0' then
				Y_state <= "101010101";
			
				else 
					if falling_edge(SW1) then
						Y_state <= "000000001";
					elsif rising_edge(SW1) then
						Y_state <= "000000001";
					end if;
					
					if SW1 = '0' then
						case Y_state is
							when "000000001" => 
								Y_state <= "000000010";
							when "000000010" => 
								Y_state <= "000000100";
							when "000000100" => 
								Y_state <= "000001000";
							when "000001000" => 
								Y_state <= "000010000";
							when "000010000" => 
								Y_state <= "000010000";
							when "000100000" => 
								Y_state <= "000000010";
							when "001000000" => 
								Y_state <= "000000010";
							when "010000000" => 
								Y_state <= "000000010";
							when "100000000" => 
								Y_state <= "000000010";
							when others =>
								Y_state <= "111110000";
						end case;
					else
						case Y_state is
							when "000000001" => 
								Y_state <= "000100000";
							when "000000010" => 
								Y_state <= "000100000";
							when "000000100" => 
								Y_state <= "000100000";
							when "000001000" => 
								Y_state <= "000100000";
							when "000010000" => 
								Y_state <= "000100000";
							when "000100000" => 
								Y_state <= "001000000";
							when "001000000" => 
								Y_state <= "010000000";
							when "010000000" => 
								Y_state <= "100000000";
							when "100000000" => 
								Y_state <= "100000000";
							when others =>
								Y_state <= "000011111";
						end case;
				end if;
			end if;
		end if;
		LEDR0 <= Y_state(0);
		LEDR1 <= Y_state(1);
		LEDR2 <= Y_state(2);
		LEDR3 <= Y_state(3);
		LEDR4 <= Y_state(4);
		LEDR5 <= Y_state(5);
		LEDR6 <= Y_state(6);
		LEDR7 <= Y_state(7);
		LEDR8 <= Y_state(8);
		LEDR9 <= KEY0;
	end process;
end Behavioural;