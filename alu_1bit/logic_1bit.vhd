-- Operations which can be performed by this unit are:
--     AND
--     OR
--     XOR
--     NOT

LIBRARY ieee;
USE ieee.std_logic_1164.ALL

ENTITY logic_1bit IS
    PORT (
        a : IN std_logic;
        b : IN std_logic;
        op : IN std_logic_vector(1 DOWNTO 0);
        result : OUT std_logic
    );
END logic_1bit;

ARCHITECTURE func OF logic_1bit IS

    COMPONENT mux4to1_1bit
        PORT (
            i : IN std_logic_vector(3 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0);
            sout : IN std_logic
        );
    END COMPONENT;

    SIGNAL s : std_logic_vector(3 DOWNTO 0);

BEGIN

    s(0) = a AND b;
    s(1) = a OR b;
    s(2) = a XOR b
    s(3) = NOT a;

    L : mux4to1_bit portmap(s => i, op => sel, sout => result);

END func; -- func