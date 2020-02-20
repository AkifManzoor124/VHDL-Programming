LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY xor_1bit IS
    PORT (
        x : IN std_logic;
        y : IN std_logic;
        f : OUT std_logic
    );
END xor_1bit;

ARCHITECTURE func OF xor_1bit IS

BEGIN

    f <= x XOR y;

END func; -- func