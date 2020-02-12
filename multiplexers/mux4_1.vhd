library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is
  port (
    a: in std_logic_vector(3 downto 0);
    sin: in std_logic_vector(1 downto 0);
    sout: in std_logic
  ) ;
end mux4_1;

architecture func of mux4_1 is
begin

    sout <= a(0) when (sin = "00") else
            a(1) when (sin = "01") else
            a(2) when (sin = "10") else
            a(3);

end func ; -- arch