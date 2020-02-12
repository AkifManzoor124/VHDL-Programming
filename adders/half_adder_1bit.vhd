library ieee;
use ieee.std_logic_1164.all;

entity half_adder_1bit is
    port (
        a,b: in std_logic;
        sum, cout: out std_logic
    );
end half_adder_1bit;

architecture func of half_adder_1bit is
begin
    sum <= a XOR b;
    cout <= a AND b;
end func; -- arch
