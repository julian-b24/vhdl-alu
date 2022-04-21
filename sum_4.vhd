library IEEE;
use IEEE.std_logic_1164.all;

entity sum_4 is
    port(
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        cin: in std_logic;
        sum : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
end sum_4;

architecture behavior of sum_4 is

    -- Carry out vector
    signal C : std_logic_vector(3 downto 0);

    -- Component that sums one bit
    component sum_1 is
        port(
            a : in std_logic;
            b : in std_logic;
            ci : in std_logic;
            cout : out std_logic;
            sum : in std_logic
        );
    end component;

    begin
        -- Sum of each bit of A and B, saves the result in sum
        sum0: sum_1 port map(a(0), b(0), cin, sum(0), c(0));
        sum1: sum_1 port map(a(1), b(1), c(0), sum(1), c(1));
        sum2: sum_1 port map(a(2), b(2), c(1), sum(2), c(2));
        sum3: sum_1 port map(a(3), b(3), c(2), sum(3), c(3));

        -- Last carry out
        cout <= c(3);

end behavior;