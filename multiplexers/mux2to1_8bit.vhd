library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8bit is
    port(
        sin: in std_logic;
        a,b: in std_logic_vector(7 downto 0);
        sout: out std_logic_vector(7 downto 0)
    );
end mux2to1_8bit;

architecture func of mux2to1_8bit is
begin

    sout = (not sin and a) OR (sin and b);

end func ; -- func