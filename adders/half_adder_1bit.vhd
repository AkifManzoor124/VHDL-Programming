library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (
        a,b: in std_logic;
        sum, cout: out std_logic
    );
end half_adder;

architecture func of half_adder is
begin
    sum <= a XOR b;
    cout <= a AND b;
end func; -- arch
