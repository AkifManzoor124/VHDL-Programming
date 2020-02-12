library ieee;
use ieee.std_logic_1164.all;

entity mux_1bit is
  port (
    a,b,sin: in std_logic;
    sout: out std_logic;
  ) ;
end mux_1bit;

architecture func of mux_1bit is
begin

    sout = (not sin and a) OR (sin and b)

end func ; -- func