LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
  leds1 : OUT STD_LOGIC_VECTOR(0 TO 6) ;
  leds2 : OUT STD_LOGIC_VECTOR(0 TO 6) ;
  SIGN : IN STD_LOGIC ) ;
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
PROCESS (bcd)
BEGIN
CASE bcd IS             -- abcdefg
WHEN "0000"       =>leds1 <= "1111110";
WHEN "0001"     =>leds1 <= "0110000";
WHEN "0010"     =>leds1 <= "1101101";
WHEN "0011"     =>leds1 <= "1111001";
WHEN "0100"     =>leds1 <= "0110011";
WHEN "0101"     =>leds1 <= "1011011";
WHEN "0110"     =>leds1 <= "1011111";
WHEN "0111"     =>leds1 <= "1110000";
WHEN "1000"     =>leds1 <= "1111111";
WHEN "1001"     =>leds1 <= "1110011";
WHEN OTHERS     =>leds1 <= "-------";
END CASE ;
END PROCESS;

PROCESS (SIGN)
    BEGIN
    IF (SIGN = '1') THEN
    leds2 <= "0000001";
    
    ELSE
    leds2 <= "0000000";
    
    END IF;
    END PROCESS;
END Behavior ;