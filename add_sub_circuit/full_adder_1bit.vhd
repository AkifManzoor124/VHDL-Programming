library ieee;
use ieee.std_logic_1164.all;

entity full_adder_1bit is
    port (
        a: in std_logic;
        b: in std_logic;
        cin: in std_logic;
        sum: out std_logic;
        cout: out std_logic
    );
end full_adder_1bit;

architecture func of full_adder_1bit is
begin

    sum <= a XOR b XOR cin;
    cout <= (a AND B) OR (cin AND (A XOR B));

end func ; -- arch