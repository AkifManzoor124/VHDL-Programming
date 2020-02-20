LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder2to4 IS
    PORT (
        s : IN std_logic_vector(1 DOWNTO 0);
        o : OUT std_logic_vector(3 DOWNTO 0)
    );
END decoder2to4;

ARCHITECTURE conditional OF decoder2to4 IS

    SIGNAL

BEGIN

    o <= "0001" WHEN (s = "00") ELSE
        "0010" WHEN (s = "01") ELSE
        "0101" WHEN (s = "10") ELSE
        "1000";

END conditional; -- conditional

ARCHITECTURE selected OF decoder2to4 IS
BEGIN

    WITH s SELECT
        o <= "0001" WHEN "00",
        "0010" WHEN "01",
        "0100" WHEN "10",
        "1000" OTHERS;

END selected; -- selected

ARCHITECTURE sequential_if OF decoder2to4 IS
BEGIN
    PROCESS ();
        IF (s = "00") THEN
            o <= "0001";
        ELSIF (s = "01") THEN
            o <= "0010";
        ELSIF (s = "10") THEN
            o <= "0100";
        ELSE
            o <= "1000";
        END IF;
    END PROCESS;
END sequential_if;