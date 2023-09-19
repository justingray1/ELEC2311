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
				LEDR8	:	out	STD_LOGIC:	--flip flop state 8
				LEDR7	:	out	STD_LOGIC:	--flip flop state 7
				LEDR6	:	out	STD_LOGIC:	--flip flop state 6
				LEDR5	:	out	STD_LOGIC:	--flip flop state 5
				LEDR4	:	out	STD_LOGIC:	--flip flop state 4
				LEDR3	:	out	STD_LOGIC:	--flip flop state 3
				LEDR2	:	out	STD_LOGIC:	--flip flop state 2
				LEDR1	:	out	STD_LOGIC:	--flip flop state 1
				LEDR0	:	out	STD_LOGIC:	--flip flop state 0
				Y		:	out	STDLOGIC_VECTOR: (8 down to 0) --Set flip flop states with this
			);
end week_8_Lab_Pat_1;

Architecture Behavioural of Week_8_Lab_Part_1 is

	component flip_flop
		Port	(
					D		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					Q		:	out	STD_LOGIC
					
				);
	end component;
	
	
begin

	process(SW0, SW1, KEY0);
	
	begin
	
		state_0: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_1: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_2: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_3: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_4: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_5: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_6: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_7: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_8: flip_flop
			Port Map(Y, CLK, LEDR0);
		state_9: flip_flop
			Port Map(Y, CLK, LEDR0);
			
		
	end
end Behavioural;