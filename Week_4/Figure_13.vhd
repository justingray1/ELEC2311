library ieee;				
use ieee.std_logic_1164.all;


  entity Wk4_D_Neg_Latch is
  
       port(  	D:	in std_logic;
	          CLK:	in std_logic;
	            Q:	out std_logic   );
					
       end Wk4_D_Neg_Latch;

architecture v1 of Wk4_D_Neg_Latch is
begin
	process(D,CLK)
	begin
		if (CLK='0') then
			Q <= D;
		end if;
		-- The absence of an else will result in a latching behviour
	end process;
end v1;