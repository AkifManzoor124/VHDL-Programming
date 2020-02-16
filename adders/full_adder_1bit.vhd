LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_1bit IS
    PORT (
        a : IN std_logic;
        b : IN std_logic;
        cin : IN std_logic;
        sum : OUT std_logic;
        cout : OUT std_logic
    );
END full_adder_1bit;

ARCHITECTURE func OF full_adder_1bit IS
BEGIN

    sum <= a XOR b XOR cin;
    cout <= (a AND B) OR (cin AND (A XOR B));

END func; -- arch