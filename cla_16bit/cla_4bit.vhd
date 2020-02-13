library ieee;
use ieee.std_logic_1164.all;

entity cla_4bit is
  port (
    a,b: in std_logic_vector(3 downto 0);
    cin: in std_logic;
    sum: in std_logic_vector(3 downto 0);
    Pg: out std_logic;
    Gp: out std_logic;
    cout: out std_logic
  );
end cla_4bit;

architecture func of cla_4bit is

    component full_adder_1_bit -- with propogate and generate signals
        port(
            a,b: in std_logic;
            cin: in std_logic;
            sum: out std_logic;
            g: out std_logic;
            p: out std_logic
        );
    end component;

    component look_ahead_generator_4bit
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

    signal g, p: std_logic_vector(3 downto 0);
    signal c: std_logic_vector(2 downto 0);

    begin

    L0: full_adder_1_bit port map(a(0), b(0), cin, sum(0), g(0), p(0));
    output_gen: for i in 1 to 3 generate 
    L: full_adder_1_bit port map(a(i), b(i), c(i-1), sum(i), g(i), p(i));
    end generate output_gen;
    L4: look_ahead_generator_4bit port map(cin, g, p, c, Pg_out, Gg_out, carry);

    cout <= carry;
    Pg <= Pg_out;
    Gg <= Gg_out;

end func ; -- arch