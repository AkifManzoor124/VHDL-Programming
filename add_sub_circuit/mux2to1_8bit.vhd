library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8bit is
    port(
        sel: in std_logic;
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        sout: out std_logic_vector(7 downto 0)
    );
end mux2to1_8bit;

architecture func of mux2to1_8bit is
begin

    sout = (not sel and a) OR (sel and b);

end func ; -- func