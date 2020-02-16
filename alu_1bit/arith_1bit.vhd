-- Operations which can be performed by this unit: 
--     Addition
--     Subtraction

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY arith_1bit IS
    PORT (
        a : IN std_logic;
        b : IN std_logic;
        cin : IN std_logic;
        op : IN std_logic_vector(1 DOWNTO 0);
        cout : OUT std_logic
        result : OUT std_logic
    );
END arith_1bit;

ARCHITECTURE func OF arith_1bit IS

    COMPONENT full_adder_1bit
        PORT (
            a : IN std_logic;
            b : IN std_logic;
            cin : IN std_logic;
            sum : OUT std_logic;
            cout : OUT std_logic
        );
    END COMPONENT;

    COMPONENT mux4to1_1bit
        PORT (
            i : IN std_logic_vector(3 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0);
            sout : IN std_logic
        );
    END COMPONENT;

    SIGNAL mux_input : std_logic_vector(3 DOWNTO 0);
    SIGNAL mux_output : std_logic;

BEGIN

    mux_input(3) <= "1"; --00
    mux_input(2) <= a; -- 01
    mux_input(1) <= NOT b; --10
    mux_input(0) <= "0"; --11

    L0 : mux4to1_1bit portmap(mux_input => i, op => sel, sout => mux_output);
    L1 : full_adder_1bit portmap(a => a, mux_output => b, cin => cin, sum => result, cout => cout);

END func; -- func