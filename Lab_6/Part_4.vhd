library ieee;
use ieee.std_logic_1164.all;

entity Part_4 is
	Port
		(
		HEX0:	OUT STD_LOGIC_VECTOR(6 downto 0);
		clock: IN STD_LOGIC;
		HEX3: OUT STD_LOGIC_VECTOR(6 downto 0);
		HEX2: OUT STD_LOGIC_VECTOR(6 downto 0);
		RESET: IN STD_LOGIC_VECTOR;
		WRITE_ADDRESS: IN STD_LOGIC_VECTOR(6 downto 0);
		READ_ADDRESS: IN STD_LOGIC_VECTOR(3 downto 0)
		DATA_IN: IN 
		);
end Part_4;

architecture behavioural of Part_4 is

	dual_port_ram: simple_dual_port_ram_single_clock
	port map
	(
	clock, 
	read_address,
	write_address,
	
	
	
	);
end behavioural;