LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU3 IS
PORT (
    Clock      : IN  STD_LOGIC;
    A, B       : IN  UNSIGNED(7 DOWNTO 0);
    Student_id : IN  UNSIGNED(3 DOWNTO 0);
    OP         : IN  UNSIGNED(15 DOWNTO 0);
    Neg        : OUT STD_LOGIC;
    R1         : OUT UNSIGNED(3 DOWNTO 0); -- Lower 4 bits of the result
    R2         : OUT UNSIGNED(3 DOWNTO 0)  -- Upper 4 bits of the result
);
END ALU3;

ARCHITECTURE Behavior OF ALU3 IS
SIGNAL Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (Clock, OP, A, B)
    BEGIN
        IF (rising_edge(Clock)) THEN
            CASE OP IS
                -- 3G (Circular Left Shift of A)
                WHEN "0000010000000000" => -- Opcode for Circular Left Shift
                    Neg <= '0';
                    Result <= A(6 DOWNTO 0) & A(7); -- Circular left shift
                
                -- Default: Do nothing
                WHEN OTHERS =>
                    Result <= (OTHERS => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- Map outputs
    R1 <= Result(3 DOWNTO 0); -- Lower 4 bits
    R2 <= Result(7 DOWNTO 4); -- Upper 4 bits
END Behavior;