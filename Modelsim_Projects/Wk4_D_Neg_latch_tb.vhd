
library ieee;				
use ieee.std_logic_1164.all;


entity Wk4_D_Neg_Latch_tb is
end Wk4_D_Neg_Latch_tb;

architecture v1 of Wk4_D_Neg_Latch_tb is

	
	--Declare components
	component Wk4_D_Neg_Latch
          port( 	D:	in std_logic;
  	                CLK:	in std_logic;
	                 Q:	out std_logic );
          end component;
	
		--Declare signals

	signal D    : std_logic;
	signal CLK : std_logic;
	signal Q    : std_logic;
	constant T          :time := 50 ns;
	
begin
	--Instantiating devive under test (component of type Wk4_D_Pos_Latch) and connecting testbench signals with Wk4_D_Pos_Latch.vhd 

	DUT: Wk4_D_Neg_Latch PORT MAP (D  => D, CLK => CLK,  Q  => Q );

	main_process:

	process 
		-- Declarations here
	begin	
		-- Apply inputs once at a time	
		

		--Initialise
		D     <= '0';
		CLK <= '0';
		
		wait for T;

		--Let's go
		D     <= '1';
		CLK <= '0';
		wait for T;

		D     <= '1';
		CLK <= '1';
		wait for T;

		D     <= '0';
		CLK <= '1';
		wait for T;

		D     <= '1';
		CLK <= '0';
		wait for T;

		D     <= '1';
		CLK <= '0';
		wait for T;

		D     <= '0';
		CLK <= '1';
		wait for T;

		D     <= '1';
		CLK <= '1';
		wait for T;

		D     <= '0';
		CLK <= '0';
		wait for T;

		D     <= '0';
		CLK <= '0';
		wait for T;

		D     <= '0';
		CLK <= '1';
		wait for T;

		D     <= '1';
		CLK <= '1';
		wait for T;

		D     <= '0';
		CLK <= '0';
		wait for T;

		--End of test is to wait forever
		wait;
	end process;
		
end v1;