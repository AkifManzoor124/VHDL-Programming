library ieee;
use ieee.std_logic_1164.all;

entity full_sub_1bit is
    port (
        a: in std_logic;
        b: in std_logic;
        cin: in std_logic;
        sum: out std_logic;
        cout: out std_logic
    );
end full_sub_1bit;

architecture func of full_sub_1bit is
begin

    sum <= a xor b xor cin;
    cout <= a and (not(b or cin) or b or cin);

end func ; -- arch