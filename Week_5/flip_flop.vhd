library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flip_flop is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end flip_flop;

architecture Behavioral of flip_flop is
    signal Q_next : STD_LOGIC;
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            Q_next <= D;
        end if;
    end process;

    Q <= Q_next;
end Behavioral;
