library IEEE;
use IEEE.std_logic_1164.all;

entity alu_c2 is
    port(
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        operation : in std_logic_vector(2 downto 0);
        result : out std_logic_vector(3 downto 0)
    );
end alu_c2;

architecture behavior of alu_c2 is
    signal final : std_logic_vector(3 downto 0);

    component sum_4 is
        port(
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            cin: in std_logic;
            sum : out std_logic_vector(3 downto 0);
            cout : out std_logic
        );
    end component;

    component substraction is
        port(
            a : in std_logic_vector(3 downto 0);
            b : in std_logic_vector(3 downto 0);
            result : out std_logic_vector(3 downto 0)
        );
    end component;

    begin
        process define_operation(a, b, operation) is
            begin
                case(operation) is
                
                    when "000" =>
                        final <= "0000";
                    when "001" =>
                        final <= "1111";
                    when "010"
                        final_aux : substraction port map(a, b, final);
                    when "011"
                        final_aux : sum_4 port map(a, b, 0, final);
                    when "100"
                        final <= a and b;
                    when "101"
                        final <= not(a and b);
                    when "110"
                        final <= a or b;
                    when "111"
                        final <= not(a or b);
                    when others =>
                        final <= not a;
                
                end case ;
        end process

        result <= final;

end behavior;