LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1_1bit IS
  PORT (
    i : IN std_logic_vector(3 DOWNTO 0);
    sel : IN std_logic_vector(1 DOWNTO 0);
    sout : IN std_logic
  );
END mux4to1_1bit;

ARCHITECTURE func OF mux4to1_1bit IS
BEGIN

  sout <= i(0) WHEN (sel = "00") ELSE
    i(1) WHEN (sel = "01") ELSE
    i(2) WHEN (sel = "10") ELSE
    i(3) WHEN OTHERS;

END func; -- arch