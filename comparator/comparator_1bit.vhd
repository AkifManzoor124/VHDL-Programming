LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator_1bit IS
    PORT (
        a : IN std_logic;
        b : IN std_logic;
        gt : OUT std_logic;
        lt : OUT std_logic;
        eq : OUT std_logic
    );
END comparator_1bit;

ARCHITECTURE sequential_if OF comparator_1bit IS

    SIGNAL

BEGIN
    -- To avoid implied memory
    gt <= "0";
    lt <= "0";
    eq <= "0";

    PROCESS (a, b)
        IF (a > b) THEN
            gt <= "1";
        ELSIF (a < b) THEN
            lt <= "1";
        ELSE
            eq <= "1";
        END IF;
    END PROCESS;
END sequential_if; -- func1

ARCHITECTURE conditional OF ent IS

    SIGNAL

BEGIN

    gt <= "1" WHEN (a > b) ELSE
        "0";
    lt <= "1" WHEN (a < b) ELSE
        "0";
    eq <= "1" WHEN (a = b) ELSE
        "0";

END conditional; -- conditional

ARCHITECTURE conditional2 OF ent IS

    SIGNAL sig1, sig2: std_logic;

BEGIN

    sig1 <= "1" WHEN (a > b) ELSE
    "0";
    sig2 <= "1" WHEN (a < b) ELSE
    "0";

    --eq <= not gt and not lt
    --Wrong syntax because gt and lt are inputs
    --We need signals

    gt <= sig1;
    lt <= sig2;
    eq <= not sig1 and not sig2;

END conditional2; -- arch