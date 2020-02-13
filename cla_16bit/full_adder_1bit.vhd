library ieee;
use ieee.std_logic_1164.all;

entity full_adder_1bit is
    port (
        a,b: in std_logic;
        cin: in std_logic;
        sum: out std_logic;
        p: out std_logic;
        g: out std_logic
    );
end full_adder_1bit;

architecture func of full_adder_1bit is
begin

   p <= a xor b;
   g <= a and b;
   sum <= a xor b xor cin;

end func ; -- arch