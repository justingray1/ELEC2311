library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Part_1 is
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
end Part_1;

Architecture Behavioural of Part_1 is

	signal Y				:	STD_LOGIC_VECTOR(8 downto 0);
	signal Q_signal	:	STD_LOGIC_VECTOR(8 downto 0);
	signal counter		:	integer := 0;
	signal CLK			:	STD_LOGIC;
	

	component flip_flop
		Port	(
					D		:	in		STD_LOGIC;
					CLK	:	in		STD_LOGIC;
					Q		:	out	STD_LOGIC
				);
	end component;
	
	
begin
	Y0: flip_flop
		Port Map(Y(0),CLK,Q_signal(0));
	Y1: flip_flop
		Port Map(Y(1),CLK,Q_signal(1));
	Y2: flip_flop
		Port Map(Y(2),CLK,Q_signal(2));
	Y3: flip_flop
		Port Map(Y(3),CLK,Q_signal(3));
	Y4: flip_flop
		Port Map(Y(4),CLK,Q_signal(4));
	Y5: flip_flop
		Port Map(Y(5),CLK,Q_signal(5));
	Y6: flip_flop
		Port Map(Y(6),CLK,Q_signal(6));
	Y7: flip_flop
		Port Map(Y(7),CLK,Q_signal(7));
	Y8: flip_flop
		Port Map(Y(8),CLK,Q_signal(8));
					
	process(SW0, SW1, KEY0)
	
	begin
	
		if SW0 = '0' then --reset is pressed
			y <= "000000000";

		else
			if falling_edge(KEY0) then
				Y(0) <= '1';
				Y(1) <= (NOT SW1 AND Y(0)) OR (NOT SW1 AND Y(5)) OR (NOT SW1 AND Y(6)) OR (NOT SW1 AND Y(7)) OR (NOT SW1 AND Y(8));
				Y(2) <= (NOT SW1) AND Y(1);
				Y(3) <= (NOT SW1) AND Y(2);
				Y(4) <= ((NOT SW1) AND Y(3)) OR (Y(4) AND (NOT SW1));
				Y(5) <= (SW1 AND Y(0)) OR (SW1 AND Y(1)) OR (SW1 AND Y(2)) OR (SW1 AND Y(3)) OR (SW1 AND Y(4));
				Y(6) <= (SW1 AND Y(5));
				Y(7) <= (SW1 AND Y(6));
				Y(8) <= (SW1 AND Y(7)) OR (Y(8) AND SW1);
			end if;
		end if;
		
		LEDR0 <= Y(0);
		LEDR1 <= Y(1);
		LEDR2 <= Y(2);
		LEDR3 <= Y(3);
		LEDR4 <= Y(4);
		LEDR5 <= Y(5);
		LEDR6 <= Y(6);
		LEDR7 <= Y(7);
		LEDR8 <= Y(8);

	end process;
end Behavioural;