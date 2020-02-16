library ieee;
use ieee.std_logic_1164.all;

entity full_sub_8bit is
    port (
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        sum: out std_logic_vector(7 downto 0)
        cout: out std_logic
    );
end full_sub_8bit;

architecture func of full_sub_8bit is

    component full_sub_1bit
        port(
            a: in std_logic;
            b: in std_logic;
            cin: in std_logic;
            sum: out std_logic;
            cout: out std_logic
        );
    end component;

    signal c: in std_logic_vector(6 downto 0);

begin

    L0: full_sub_1bit port map (a(0), b(0), cin, sum(0), c(0));
    L1: full_sub_1bit port map (a(1), b(1), c(0), sum(1), c(1) );
    L2: full_sub_1bit port map (a(2), b(2), c(1), sum(2), c(2) );
    L3: full_sub_1bit port map (a(3), b(3), c(2), sum(3), c(3) );
    L4: full_sub_1bit port map (a(4), b(4), c(3), sum(4), c(4) );
    L5: full_sub_1bit port map (a(5), b(5), c(4), sum(5), c(5) );
    L6: full_sub_1bit port map (a(6), b(6), c(5), sum(6), c(6) );
    L7: full_sub_1bit port map (a(7), b(7), c(6), sum(7), cout);

end func; -- arch