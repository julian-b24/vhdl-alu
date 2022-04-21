library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alu is
    port(
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        operation : in std_logic_vector(2 downto 0);
        result : out std_logic_vector(3 downto 0)
    );
end alu;

architecture behavior of alu is
    signal final : std_logic_vector(3 downto 0);

    begin
        process (a, b, operation) is
            begin
                case(operation) is
                
                    when "000" =>
                        final <= "0000";
                    when "001" =>
                        final <= "1111";
                    when "010" =>
                        final <= std_logic_vector(unsigned(a) + (not(unsigned(b)) + "0001")) ;
                    when "011" =>
                        final <= std_logic_vector(unsigned(a) + unsigned(b));
                    when "100" =>
                        final <= a and b;
                    when "101" =>
                        final <= not(a and b);
                    when "110" =>
                        final <= a or b;
                    when "111" =>
                        final <= not(a or b);
                    when others =>
                        final <= not a;
                
                end case ;
        end process;

        result <= final;

end behavior;