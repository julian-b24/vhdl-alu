library IEEE;
use IEEE.std_logic_1164.all;

entity sum_1 is
    port(
        a : in std_logic;
        b : in std_logic;
        ci : in std_logic;
        cout : out std_logic;
        sum : out std_logic
    );
end sum_1;

architecture behavior of sum_1 is
begin
    sum <= a xor b xor ci;
    cout <= (a and b) or (a and ci) or (b and ci);
end behavior;