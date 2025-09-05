LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;  -- For arithmetic operations

ENTITY ALU IS
    PORT (
        clk     : IN  std_logic;                     -- Clock signal
        reset   : IN  std_logic;                     -- Reset signal
        A, B    : IN  std_logic_vector(7 DOWNTO 0);  -- 8-bit inputs
        opcode  : IN  std_logic_vector(7 DOWNTO 0); -- 16-bit opcode
        R1      : OUT std_logic_vector(3 DOWNTO 0);  -- 4-bit result 1
        R2      : OUT std_logic_vector(3 DOWNTO 0);  -- 4-bit result 2
        neg     : OUT std_logic                       -- Negative flag
    );
END ENTITY;

ARCHITECTURE Behavior OF ALU IS
    SIGNAL full_result : std_logic_vector(7 DOWNTO 0);  -- Internal 8-bit result
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            full_result <= (OTHERS => '0');  -- Reset the internal result to 0
            neg <= '0';  -- Reset neg to 0
        ELSIF rising_edge(clk) THEN
            CASE opcode IS
                WHEN "00000001" =>
                    full_result <= std_logic_vector(unsigned(A) + unsigned(B)); -- Addition
                WHEN "00000010" =>
                    full_result <= std_logic_vector(unsigned(A) - unsigned(B)); -- Subtraction
					 WHEN "00000100" =>
                    full_result <= NOT A;    -- NOT of A
                WHEN "00001000" =>
                    full_result <= not(A AND B);  -- NOT A AND B
                WHEN "00010000" =>
                    full_result <= not(A OR B);   -- NOT A OR B
                WHEN "00100000" =>
                    full_result <= A AND B;  -- A AND B
					 WHEN "01000000" =>
						  full_result <= A XOR B;  -- A XOR B
					 WHEN "10000000" =>
						  full_result <= A OR B;  -- A OR B
                
                WHEN OTHERS =>
                    full_result <= (OTHERS => '0');  -- Default
            END CASE;

            -- Set the neg signal based on the MSB of the result
            neg <= full_result(7);  -- MSB indicates sign (1 = negative, 0 = positive)
        END IF;
    END PROCESS;

    -- Split the result into R1 and R2
    R1 <= full_result(3 DOWNTO 0);  -- Least significant nibble
    R2 <= full_result(7 DOWNTO 4);  -- Most significant nibble

END ARCHITECTURE;