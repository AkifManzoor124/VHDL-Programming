library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a,b,cin: in std_logic;
        sum,cout: out std_logic;
    );
end full_adder;

architecture arch of ent is

    signal s1, s2, s3 : std_logic;

begin

    s1 <= a xor b;
    s2 <= cin and s1;
    s3 <= a and b;

    sum <= s1 xor s2;
    cout <= s2 or s3;

end arch ; -- arch