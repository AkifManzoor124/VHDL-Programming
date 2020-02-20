library ieee;
use ieee.std_logic_1164.all;

entity even_parity_3bit is
  port (
    a: in std_logic_vector(2 downto 0);
    even: out std_logic
  ) ;
end even_parity_3bit;

architecture func1 of even_parity_3bit is

    signal p: std_logic_vector(3 downto 0);

begin
    
    p(3) <= a(2) and not a(1) and not a(0);
    p(2) <= not a(2) and a(1) and a(0);
    p(1) <= a(2) and not a(1) and a(0);
    p(0) <= a(2) and a(1) and not a(0);
    
    even <= p(3) or p(2) or p(1) or p(0);

end func1 ; -- func

architecture func2 of even_parity_3bit is

    signal odd: in std_logic;

begin
    
    even <= not odd;
    odd <= a(2) xor a(1) xor a(0);

end func2 ; -- func2

architecture func3 of even_parity_3bit is

    component not_1bit
        port(
            x: in std_logic;
            f: out std_logic
        );
    end component;
    
    component xor_1bit
        port(
            x: in std_logic;
            y: in std_logic;
            f: out std_logic
        );
    end component;

    signal s0,s1: std_logic

begin

    L0: xor_1bit portmap(x <= a(2), y <= a(1),f => s0);
    L1: xor_1bit portmap(x <= s0, y <= a(0), f => s1);
    L2: not_1bit portmap(x <= s1, f => even);

end func3 ; -- func3

architecture behavioral1 of even_parity_3bit is

    signal odd: std_logic;

begin
    even <= not odd;

    process(a)
        variable tmp: std_logic;
    begin
        tmp := '0';
        for i in 2 downto 0 loop
            tmp := tmp xor a(i);
        end loop;
        odd <= tmp;
    end process;
end behavioral1; -- behavioral

architecture behavioral2 of even_parity_3bit is
begin
    process(a)
        variable sum, r: std_logic;
    begin
        sum := '0';
        for i in 2 downto 0 loop
            if(a(i) = '1') then
                sum := sum + 1; -- integer value
            end if;
        end loop;
        r := sum mod 2; -- returns an integer
        if(r = 0) then
            even <= '1'; 
        else
            even <= '0';
        end if;
    end process;
end behavioral2;

-- A(2)    A(1)    A(0)    even
-- 0       0       0       1
-- 0       0       1       0
-- 0       1       0       0
-- 0       1       1       1
-- 1       0       0       0
-- 1       0       1       1
-- 1       1       0       1
-- 1       1       1       0

-- f = A!B!C + !ABC + A!BC + AB!C
-- f  = not (A xor B xor C)