library ieee;
use ieee.std_logic_1164.all;

entity full_adder_1bit is
    port (
        a,b,cin: in std_logic;
        sum,cout: out std_logic
    );
end full_adder_1bit;

architecture func of full_adder_1bit is

    signal s : std_logic_vector(2 downto 0);

begin

    s(1) <= a xor b;
    s(2) <= cin and s1;
    s(3) <= a and b;

    sum <= s(1) xor s(2);
    cout <= s(2) or s(3);

end func ; -- arch