library ieee;
use ieee.std_logic_1164.all;

entity top is
  port (
    a: in std_logic_vector(7 downto 0);
    b: in std_logic_vector(7 downto 0);
    sum: in std_logic_vector(7 downto 0);
    sel: in std_logic;
    cout: out std_logic
  );
end top;

architecture func of top is

    component full_adder_8bit
    port (
        a: in std_logic_vector(7 downto 0);
        b: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        sum: out std_logic_vector(7 downto 0)
        cout: out std_logic
    );
    end component;

    component subtractor
        port(
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            cin: in std_logic;
            sum: out std_logic_vector(7 downto 0)
            cout: out std_logic
        );
    end component;

    component mux2to1_8bit
        port(
            sel: in std_logic;
            a: in std_logic_vector(7 downto 0);
            b: in std_logic_vector(7 downto 0);
            sout: out std_logic_vector(7 downto 0)
        );
    end component;

    signal carry: std_logic;
    signal add, sub: std_logic_vector(7 downto 0);

    begin

    L0: full_adder_8bit port map(a,b,"0",add,carry);
    L1: subtractor port map(a,b,"0",sub,carry);
    L2: mux2to1_8bit port map (sel,add,mult,sum);
    cout <= carry;

end func ; -- func