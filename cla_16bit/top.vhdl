library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    cin: in std_logic;
    a,b: in std_logic_vector(15 downto 0);
    sum: in std_logic_vector(15 downto 0);
    Pp: out std_logic;
    Gp: out std_logic;
    cout: out std_logic
  );
end top;

architecture func of top is

    component cla_4bit 
        port(
            cin: in std_logic;
            a,b: in std_logic_vector(3 downto 0);
            sum: in std_logic_vector(3 downto 0);
            Pp: out std_logic;
            Gp: out std_logic;
            cout: out std_logic
        );
    end component;

    component lookahead_carry_generator_4bit
        port(
            cin: in std_logic;
            g: in std_logic_vector(3 downto 0);
            p: in std_logic_vector(3 downto 0);
            c: out std_logic_vector(3 downto 0); --c(10) <= c1, c(1) <= c2,c(2) <= c3
            Pg: out std_logic;
            Gg: out std_logic;
            carry: out std_logic
        );
    end component;

    signal g,p: std_logic_vector(3 downto 0);
    signal c: std_logic_vector(2 downto 0);

    begin

    
    L0: cla_4bit port map(a(3 downto 0), b(3 downto 0), cin, sum(3 downto 0), g(0), p(0));
    L0: cla_4bit port map(a(7 downto 3), b(7 downto 3), cin, sum(7 downto 3), g(1), p(1));
    L0: cla_4bit port map(a(11 downto 7), b(11 downto 7), cin, sum(11 downto 7), g(2), p(2));
    L0: cla_4bit port map(a(15 downto 11), b(15 downto 11), cin, sum(15 downto 11), g(3), p(3));

    L4: look_ahead_generator_4bit port map(cin, g, p, c, Pg_out, Gg_out, carry);

    cout <= carry;
    Pg <= Pg_out;
    Gg <= Gg_out;
    
end func ; -- arch