LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1_8bit IS
    PORT (
        a : IN std_logic_vector(7 DOWNTO 0);
        b : IN std_logic_vector(7 DOWNTO 0);
        c : IN std_logic_vector(7 DOWNTO 0);
        d : IN std_logic_vector(7 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); --need 2 select inputs to select from 4 mux options
        o : OUT std_logic_vector(7 DOWNTO 0)
    );
END mux4to1_8bit;

ARCHITECTURE conditional OF mux8to1_8bit IS

    SIGNAL

BEGIN

    o <= a WHEN (sel = "00") ELSE
        b WHEN (sel = "01") ELSE
        c WHEN (sel = "10") ELSE
        d;

END conditional; -- arch

ARCHITECTURE selected OF mux8to1_8bit IS
BEGIN

    WITH sel SELECT
        o <= a WHEN "00",
        b WHEN "01",
        c WHEN "10",
        d WHEN OTHERS;

END selected; -- selected

ARCHITECTURE sequential_if OF mux4to1_8bit IS

    SIGNAL

BEGIN
    PROCESS (a, b, c, d, sel)
    BEGIN
        IF (sel = "00") THEN
            o <= a;
        ELSIF (sel = "01") THEN
            o <= b;
        ELSIF (sel = "10") THEN
            o <= c;
        ELSE
            o <= d;
        END IF;
    END PROCESS;

END sequential_if; -- sequential_if

ARCHITECTURE sequential_case OF mux4to1_8bit IS

    SIGNAL

BEGIN
    PROCESS (a, b, c, d, sel)
    BEGIN
        CASE sel IS
            WHEN "00" =>
                o <= a;
            WHEN "01" =>
                o <= b;
            WHEN "10" =>
                o <= c;
            WHEN OTHERS =>
                o <= d;
        END CASE;
    END PROCESS;
END sequential_case; -- sequential_case