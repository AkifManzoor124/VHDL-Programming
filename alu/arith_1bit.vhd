-- Operations which can be performed by this unit: 
--     Addition
--     Subtraction

library ieee;
use std_logic_1164.all;

entity arith_1bit is
  port (
    a,b: in std_logic;
    cin: in std_logic;
    op: in std_logic_vector(1 downto 0);
    cout: out std_logic;
    result: out std_logic
  ) ;
end arith_1bit;

architecture func of arith_1bit is

    component full_adder_1bit
        port (
            a,b,cin: in std_logic;
            sum,cout: out std_logic
        );
    end component;

    component mux4to1_1bit
        port (
            i: in std_logic_vector(3 downto 0);
            sel: in std_logic_vector(1 downto 0);
            sout: in std_logic
        );
    end component;

    signal mux_input: std_logic_vector(3 downto 0);
    signal mux_output: std_logic;

begin

    mux_input(3) <= "1";
    mux_input(2) <= not b;
    mux_input(1) <= b;
    mux_input(0) <= "0";

    L0: mux4to1_1bit portmap(mux_input => i, op => sel, mux_output => sout);
    L1: full_adder_1bit portmap(a => a,mux_output => b, cin => cin, sum => result, cout => cout);

end func; -- func

