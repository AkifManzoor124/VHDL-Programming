library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a,b,cin: in std_logic;
        sum,cout: out std_logic;
    );
end full_adder;

architecture func of full_adder is
begin

    sum <= a XOR b XOR cin;
    cout <= (a AND B) OR (cin AND (A XOR B));

end func ; -- arch