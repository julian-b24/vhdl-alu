library IEEE;
use IEEE.std_logic_1164.all;

entity substraction is
    port(
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        result : out std_logic_vector(3 downto 0)
    );
end substraction;

architecture behavior of substraction is

    signal b_c2 : std_logic_vector(3 downto 0);
    signal c_out: std_logic;

    -- Component of sum
    component sum_4 is
        port(
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            cin: in std_logic;
            sum : out std_logic_vector(3 downto 0)
            cout : out std_logic
        );
    end component;

    -- Component of complements 2
    component c2 is
        port(
            a : in std_logic_vector(3 downto 0);
            a_c2 : out std_logic_vector(3 downto 0)
        );
    end component;

    begin
        negation : c2 port map(b, b_c2);
        final : sum_4 port map(a, b_c2, '0', result, c_out);
end behavior;