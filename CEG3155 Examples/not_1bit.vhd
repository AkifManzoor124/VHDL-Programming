library ieee;
use ieee.std_logic_1164.all;

entity not_1bit is
    port(
        x: in std_logic;
        f: out std_logic
    );
end not_1bit;

architecture func of not_1bit is

begin

    f <= not x

end func ; -- func