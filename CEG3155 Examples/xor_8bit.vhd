LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY xor_8bit IS
    PORT (
        a : IN std_logic_vector(7 DOWNTO 0);
        b : IN std_logic_vector(7 DOWNTO 0);
        f : OUT std_logic_vector(7 DOWNTO 0);
    );
END xor_8bit;

ARCHITECTURE forloop OF xor_8bit IS

    COMPONENT xor_1bit
        PORT (
            x : IN std_logic;
            y : IN std_logic;
            f : OUT std_logic
        );
    END COMPONENT;

BEGIN
    PROCESS (a, b)
        FOR i IN (7 DOWNTO 0) LOOP
            L : xor_1bit portmap(x <= a(i), y <= b(i), f => y(i));
        END LOOP;
    END PROCESS;
END forloop;