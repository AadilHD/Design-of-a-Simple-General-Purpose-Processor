LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity reg IS
 port (
     B   : in std_logic_vector(7 downto 0); -- 8-bit input
     res, clk : in std_logic;               -- Reset and clock signals
     Q   : out std_logic_vector(7 downto 0) -- 8-bit output
 );
end reg;

architecture behavior of reg is
begin
  process (res, clk)
  begin
    if res = '1' then
      Q <= "00000000";  -- Reset the output to all 0s
    elsif (clk'EVENT AND clk = '1') then
      Q <= B;           -- On rising edge of the clock, load input B into Q
    end if;
  end process;
end behavior;
