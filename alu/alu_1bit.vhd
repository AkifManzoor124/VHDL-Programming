LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top IS
  PORT (
    a : IN std_logic;
    b : IN std_logic;
    cin : IN std_logic;
    sel_op : IN std_logic(2 DOWNTO 0); --if(sel_op(2)) = 1 => 0; Arithmetic Unit
    cout : OUT std_logic
    result : OUT std_logic
  );
END top;

ARCHITECTURE func OF top IS

  COMPONENT arith_1bit
    PORT (
      a : IN std_logic;
      b : IN std_logic;
      cin : IN std_logic;
      op : IN std_logic_vector(1 DOWNTO 0);
      cout : OUT std_logic
      result : OUT std_logic
    );
  END COMPONENT;

  COMPONENT logic_1bit
    PORT (
      a : IN std_logic;
      b : IN std_logic;
      op : IN std_logic_vector(1 DOWNTO 0);
      result : OUT std_logic
    );
  END COMPONENT;

  COMPONENT mux2to1_1bit
    PORT (
      a : IN std_logic;
      b : IN std_logic;
      sel : IN std_logic;
      sout : OUT std_logic
    );
  END COMPONENT;

  SIGNAL arith_out : IN std_logic;
  SIGNAL logic_out : IN std_logic;

BEGIN

  L0 : logic_1bit portmap(a => a, b => b, sel(1 DOWNTO 0) => op, result => logic_out);
  L1 : arith_1bit portmap(a => a, b => b, cin => cin, sel(1 DOWNTO 0) => op, cout => cout, result => arith_out);
  L2 : mux2to1_1bit portmap(arith_out => a, logic_out => b, sel_op(2) => sel, sout => result);

END func; -- func