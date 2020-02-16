library ieee;
use ieee.std_logic_1164.all;

entity mux4to1_1bit is
  port (
    i: in std_logic_vector(3 downto 0);
    sel: in std_logic_vector(1 downto 0);
    sout: in std_logic
  ) ;
end mux4to1_1bit;

architecture func of mux4to1_1bit is
begin

    sout <= i(0) when (sel = "00") else
            i(1) when (sel = "01") else
            i(2) when (sel = "10") else
            i(3) when others;

end func ; -- arch