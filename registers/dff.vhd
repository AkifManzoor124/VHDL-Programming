library ieee;
use ieee.std_logic_1164.all;

entity dff is
  port (
    en: in std_logic;
    rst: in std_logic;
    d: in std_logic;
    clock: in std_logic;
    q: out std_logic
  ) ;
end dff;

architecture func of dff is
    signal d_out: std_logic;
begin
    onebitdff: process(rst, clock)
    begin
        if(rst = '0') then
            d_out <= '0';
        elsif (clock'event and clock = '1') then --If the clock changes and it equates to 1 (Rising Edge)
            if(en = '1') then 
                d_out <= d;
            end if;
        end if;
    end process onebitdff;
    
    q <= d_out

end func ; -- func