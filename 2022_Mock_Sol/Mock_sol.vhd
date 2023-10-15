library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY Mock_sol IS
	PORT
	(
		RST_ASYNC_LOW	:	IN		STD_LOGIC;
		CLK_IN			:	IN		STD_LOGIC;
		RATE				:	IN		STD_LOGIC;
		W					:	IN		STD_LOGIC;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5			:	OUT	STD_LOGIC_VECTOR(6 downto 0)
	);
END ENTITY;

ARCHITECTURE Arch OF Mock_sol IS

TYPE State_t IS (A,B,C,D);
	ATTRIBUTE syn_encoding: string;
	ATTRIBUTE syn_encoding OF State_t	:	TYPE IS "00 01 10 11";
	
SIGNAL Current_state	:	State_t;
SIGNAL Next_state		:	State_t;

SIGNAL Divided_CLK	:	STD_LOGIC;
SIGNAL Count			:	STD_LOGIC_VECTOR (3 downto 0);

SIGNAL Mux_Clock0		:	STD_LOGIC;
SIGNAL Mux_clock1		:	STD_LOGIC;

attribute chip_pin	:	string;

attribute chip_pin of clk_in				:	signal is "P11";
attribute chip_pin of RST_ASYNC_LOW		:	signal is "B8";
attribute chip_pin of RATE					:	signal is "C11";
attribute chip_pin of W						:	signal is "C10";

--attribute chip_pin of DISPLAY				:	signal is "C14, E15, C15, C1, E16, D17, C17";
--attribute chip_pin of DISPLAY				:	signal is "C17, D17, E16, C1, C15, E15, C14";

--HEX 0
attribute chip_pin of HEX0			:	signal is "C17, D17, E16, C16, C15, E15, C14";
--HEX 1
attribute chip_pin of HEX1			:	signal is "B17, A18, A17, B16, E18, D18, C18";
--HEX 2
attribute chip_pin of HEX2			:	signal is "B22, C22, B21, A21, B19, A20, B20";
--HEX 3
attribute chip_pin of HEX3			:	signal is "E17, D19, C20, C19, E21, E22, F21";
--HEX 4
attribute chip_pin of HEX4			:	signal is "F20, F19, H19, J18, E19, E20, F18";
--HEX 5
attribute chip_pin of HEX5			:	signal is "N20, N19, M20, N18, L18, K20, J20";

--SWITCHES
--attribute chip_pin of SW			:	signal is "F15, B16, A14, A13, B12, A12, C12, D12, C11, C10";

--LEDS
--attribute chip_pin of LEDS			:	signal is "B11, A11, D14, E14, C13, D13, B10, A10, A9, A8";

component hex_decoder is
	Port
	(
		INPUT_A	:	IN		STD_LOGIC_VECTOR(3 downto 0);
		HEXOUT	:	OUT	STD_LOGIC_VECTOR(6 downto 0)
	);
end component;

component clk_divider_to_1hz is
	generic(Freq_in	:	integer	:=	50000000);
	Port
	(
		clk_in	:	IN		STD_LOGIC;
		reset		:	IN		STD_LOGIC;
		clk_out	:	OUT	STD_LOGIC
	);
end component;

BEGIN
	
	Divided_clk <= Mux_Clock0 WHEN RATE = '0' ELSE MUX_Clock1;
	
	slow_clock	:	clk_divider_to_1hz
		GENERIC MAP(Freq_in => 100000000)
		PORT MAP(CLK_IN,'0',Mux_Clock0);
		
	fast_clock	:	clk_divider_to_1hz
		GENERIC MAP(Freq_in => 50000000)
		PORT MAP(CLK_IN, '0', MUX_clock1);
		
	seven_seggy_1	:	hex_decoder
		PORT MAP(Count, HEX0);
	seven_seggy_2	:	hex_decoder
		PORT MAP(Count, HEX1);
	seven_seggy_3	:	hex_decoder
		PORT MAP(Count, HEX2);
	seven_seggy_4	:	hex_decoder
		PORT MAP(Count, HEX3);
	seven_seggy_5	:	hex_decoder
		PORT MAP(Count, HEX4);
	seven_seggy_6	:	hex_decoder
		PORT MAP(Count, HEX5);
		
	sync_process	:	Process(Divided_clk, RST_ASYNC_LOW)
		BEGIN
			IF RST_ASYNC_LOW = '0' then
				current_state <= A;
			ELSIF rising_edge(divided_clk) THEN
				current_state <= next_state;
			END IF;
	END PROCESS sync_process;
	
	comb_process	:	Process(current_state, w)
		BEGIN
			CASE current_state IS
				WHEN A =>
					count <= "0000";
					IF w = '0' THEN
						next_state <= D;
					ELSIF w = '1' THEN
						next_state <= B;
					END IF;
				WHEN B =>
					count <= "0001";
					IF w = '0' THEN
						next_state <= A;
					ELSIF w = '1' THEN
						next_state <= C;
					END IF;
				WHEN C =>
					count <= "0010";
					IF w = '0' THEN
						next_state <= B;
					ELSIF w = '1' THEN
						next_state <= D;
					END IF;
				WHEN D =>
					count <= "0011";
					IF w = '0' THEN
						next_state <= C;
					ELSIF w = '1' THEN
						next_state <= A;
					END IF;
			END CASE;
	END PROCESS comb_process;
END ARCHITECTURE;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	