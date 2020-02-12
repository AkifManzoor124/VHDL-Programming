library ieee;
use ieee.std_logic_1164.all;

entity mux2_1 is
  port (
    a,b,sin: in std_logic;
    sout: out std_logic
  ) ;
end mux2_1;

architecture func of mux2_1 is
begin

    sout = (not sin and a) OR (sin and b);

end func ; -- func