library ieee;
use ieee.std_logic_1164.all;

entity look_ahead_generator_4bit is
    port(
        cin: in std_logic;
        g: in std_logic_vector(3 downto 0);
        p: in std_logic_vector(3 downto 0);
        c: out std_logic_vector(3 downto 0); --c(10) <= c1, c(1) <= c2,c(2) <= c3
        Pg: out std_logic;
        Gg: out std_logic;
        carry: out std_logic
    );
end look_ahead_generator_4bit;

architecture func of look_ahead_generator_4bit is

    begin

    c1 <= g(0) or p(0) and cin
    c2 <= g(1) or p(1) and c1
    c3 <= g(2) or p(2) and c2
    c4 <= g(3) or p(3) and c3
    carry <= c4

    Pg <= p(3) and p(2) and p(1) and p(0)
    Gg <= g(3) or (g(2) and p(2)) or (g(1) and p(3) and p(2)) or (g(0) and p(3) and p(2) and p(1) and p(0));

end func ; -- arch