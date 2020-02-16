LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_8bit IS
  PORT (
    en : IN std_logic;
    rst : IN std_logic;
    d : IN std_logic_vector(7 DOWNTO 0);
    clock : IN std_logic;
    q : OUT std_logic_vector(7 DOWNTO 0)
  );
END;

ARCHITECTURE func OF reg_8bit IS

  COMPONENT dff
    PORT (
      en : IN std_logic;
      rst : IN std_logic;
      d : IN std_logic;
      clock : IN std_logic;
      q : OUT std_logic
    );
  END COMPONENT;

  SIGNAL regout : std_logic_vector(7 DOWNTO 0);
	SIGNAL regin : std_logic_vector(7 DOWNTO 0);

BEGIN

  output_gen : FOR i IN 0 TO 7 GENERATE
    regi : dflip PORT MAP(rst, d(i), en, clock, q(i));
  END GENERATE output_gen;

END func; -- func