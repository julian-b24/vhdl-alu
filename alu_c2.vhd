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
    begin
        process define_operation(a, b, operation) is
            begin
                case(operation) is
                
                    when "000" =>
                        final <= "0000";
                    when "001" =>
                        final <= "0001";
                    when "010"
                        final_aux : substraction port map(a, b, final);
                    when "011"
                        final_aux : sum_4 port map(a, b, 0, final);
                    when "100"
                        
                
                    when others =>
                
                end case ;
        end process

end behavior;