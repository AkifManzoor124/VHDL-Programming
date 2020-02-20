LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY lec9_example IS
    PORT (
        a : IN std_logic_vector(7 DOWNTO 0);
        b : IN std_logic_vector(7 DOWNTO 0);
        c : IN std_logic_vector(7 DOWNTO 0);
        d : IN std_logic_vector(7 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0);
        f : OUT std_logic_vector(7 DOWNTO 0)
    );
END lec9_example;

ARCHITECTURE func1 OF lec9_example IS

    COMPONENT mux4to1_8bit
        PORT (
            a : IN std_logic_vector(7 DOWNTO 0);
            b : IN std_logic_vector(7 DOWNTO 0);
            c : IN std_logic_vector(7 DOWNTO 0);
            d : IN std_logic_vector(7 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0);
            o : OUT std_logic_vector(7 DOWNTO 0)
        );
    END COMPONENT;
    SIGNAL sum1, sum2, sum3 : std_logic;

BEGIN

    sum1 <= a + b;
    sum2 <= a + c;
    sum3 <= d + 1;
    sum4 <= "00000000";
    L : mux4to1_8bit PORT MAP(a <= sum1, b <= sum2, c <= sum3, d <= sum4, sel <= sel, f <= o);

END func1; -- func1

ARCHITECTURE func2 OF lec9_example IS

    SIGNAL sum1, sum2 : std_logic;

BEGIN

    sum1 <= a + b;
    sum2 <= a + c;
    sum3 <= d + 1;
    sum4 <= "00000000";

    f <= sum1 WHEN (sel = "00") ELSE
        sum2 WHEN (sel = "01") ELSE
        sum3 WHEN (sel = "10") ELSE
        sum4;

END func2;

ARCHITECTURE func3 OF lec9_example IS

    SIGNAL sum1, sum2 : std_logic;

BEGIN

    sum1 <= a + b;
    sum2 <= a + c;
    sum3 <= d + 1;
    sum4 <= "00000000";

    WITH sel SELECT
        sum1 WHEN "00",
        sum2 WHEN "01",
        sum3 WHEN "10",
        sum4 WHEN OTHERS;

END func3;

ARCHITECTURE func4 OF lec9_example IS

    SIGNAL sig1, sig2 : std_logic;

BEGIN

    zero <= "00000000";

    sig1 <= a WHEN (sel = "00") OR (sel = "01") ELSE
        d;
    sig2 <= b WHEN (sel = "10")ELSE
        zero;

    f <= sig1 + sig2;

END func4; -- arch

ARCHITECTURE func5 OF lec9_example IS

    SIGNAL

BEGIN

    sum1 <= a + b;
    sum2 <= a + c;
    sum3 <= d + 1;
    sum4 <= "00000000";

    PROCESS (a, b, c, d, sel)
        IF (sel = "00") THEN
            f <= sum1;
        ELSIF (sel = "01") THEN
            f <= sum2;
        ELSIF (sel = "10") THEN
            f <= sum3;
        ELSE
            f <= sum4;
        END IF;
    END PROCESS

END func5; -- func5

ARCHITECTURE func5 OF lec9_example IS

    SIGNAL sig1, sig2 : std_logic;

BEGIN

    zero <= "00000000"

    PROCESS (a, b, c, d, sel)
        IF (sel = "00" OR sel = "01") THEN
            sig1 <= a;
        ELSIF (sel = "10") then
            sig2 <= d;
        else
            sig2 <= zero;
        END IF;
    END PROCESS

    f <= sig1 + sig2;

END func5; -- func5