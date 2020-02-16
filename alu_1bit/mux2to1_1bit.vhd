library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_1bit is
  port (
    a: in std_logic;
    b: in std_logic;
    sel: in std_logic;
    sout: out std_logic
  );
end mux2to1_1bit;

architecture func of mux2_1 is
begin

    sout = (not sel and a) OR (sel and b);

end func ; -- func