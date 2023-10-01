LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part2 IS 
   PORT ( Clock, Write : IN  STD_LOGIC;
          DataIn       : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
          Address      : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
          DataOut      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END part2;

ARCHITECTURE Behavior OF part2 IS

	attribute chip_pin : string;
	attribute chip_pin of Clock is "B8";
	attribute chip_pin of write is "A7";
	attribute chip_pin of DataIn is 
	
   COMPONENT ram32x4 
      PORT ( address : IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
             clock   : IN  STD_LOGIC ;
             data    : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
             wren    : IN  STD_LOGIC  := '1';
             q       : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;
BEGIN
   -- instantiate LPM module
   -- entity ram32x4 (address, clock, data, wren, q)
   U1: ram32x4 PORT MAP (Address, Clock, DataIn, Write, DataOut);
END Behavior;