-- Operations which can be performed by this unit are:
--     AND
--     OR
--     XOR
--     NOT

library ieee;
use ieee.std_logic_1164.all

entity logic_1bit is
    port (
        a,b: in std_logic;
        op: in std_logic_vector(1 downto 0);
        result: out std_logic
    ) ;
end logic_1bit;

architecture func of logic_1bit is

    component mux4to1_1bit
    port (
        i: in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        sout: in std_logic
      ) ;
    end component;

    signal s: in std_logic_vector(3 downto 0);

begin
    
    s(0) = a and b;
    s(1) = a or b;
    s(2) = a xor b
    s(3) = not a;

    L: mux4to1_bit portmap(s, op, result);

end func ; -- func