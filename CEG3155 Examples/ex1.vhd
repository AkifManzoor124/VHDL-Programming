-- importing the library ieee
library ieee;
-- using the std_logic from the ieee library
use ieee.std_logic_1164.all;

-- definition of entity and ports
-- std_logic_vector helps to define signals quickly
-- x(2), x(1), x(0)
entity ex1 is
  port (
    x: in std_logic_vector(2 downto 0);
    f: out std_logic
  ) ;
end ex1;

-- definition of architecture for entity ex1
architecture func of ex1 is

begin

    --boolean logic for the functionality of ex1
    --assigned to f
    f <= (x(0) and x(1)) or (not x(1) and x(2));

end func ; -- func