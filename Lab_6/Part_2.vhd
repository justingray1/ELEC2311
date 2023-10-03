LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part_2 IS 
   PORT ( 
			Clock, Write : IN  STD_LOGIC;
			DataIn       : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			Address      : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
			DataOut      :OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
			HEX5				:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4				:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2				:OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX0				:OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
			);
			
END part_2;

ARCHITECTURE Behavior OF part_2 IS

--	attribute chip_pin : string;
--	attribute chip_pin of Clock : signal is "B8";
--	attribute chip_pin of write : signal is "F15";
--	attribute chip_pin of DataIn : signal is "C12,D12,C11,C10";
--	attribute chip_pin of Address : signal is "B14,A14,A13,B12,A12";
--	attribute chip_pin of HEX5 : signal is "L19,N20,N19,M20,N18,L18,K20";
--	attribute chip_pin of HEX4 : signal is "F17,F20,F19,H19,J18,E19,E20";
--	attribute chip_pin of HEX2 : signal is "A19,B22,C22,B21,A21,B19,A20";
--	attribute chip_pin of HEX0 : signal is "C17, D17, E16, C16, C15, E15, C14";
	
	signal d_out : STD_LOGIC_VECTOR(3 DOWNTO 0);

	
   COMPONENT ram32x4
      PORT 
			( 
				address : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
				clock   : IN  STD_LOGIC ;
				data    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				wren    : IN  STD_LOGIC  := '1';
				q       : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
			);
   END COMPONENT;
	
	component hex_decoder
		PORT
			(
				INPUT_A: in std_logic_vector (3 downto 0);
				HEXOUT : out std_logic_vector (6 downto 0)
			);
	END COMPONENT;
	
BEGIN
	
   U1: ram32x4 PORT MAP (Address, Clock, DataIn, Write, d_out);
	HEX_Decoder_5: hex_decoder PORT Map (Address(4 downto 1), HEX5);
	HEX_Decoder_4: hex_decoder PORT Map ("000" & Address(0), HEX4);
	HEX_Decoder_2: hex_decoder PORT Map (DataIn, HEX2);
	HEX_Decoder_0: hex_decoder PORT Map (d_out, HEX0);
	--HEX_Decoder_0: hex_decoder PORT Map (input_A => "0000", HEXOUT => HEX0);
	
	dataout <= d_out;
	
	
END Behavior;