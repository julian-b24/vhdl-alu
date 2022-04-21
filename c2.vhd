library IEEE;
use IEEE.std_logic_1164.all;

entity c2 is
    port(
        a : in std_logic_vector(3 downto 0);
        a_c2 : out std_logic_vector(3 downto 0)
    );
end c2;

architecture behavior of c2 is
    signal aux_c2 : std_logic_vector(3 downto 0);
    begin
        a_c2 <= not(a) + "0001";
end behavior;