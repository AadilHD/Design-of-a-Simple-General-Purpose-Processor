LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;  -- For arithmetic operations

ENTITY ALU2 IS
    PORT (
        clk     : IN  std_logic;                     -- Clock signal
        reset   : IN  std_logic;                     -- Reset signal
        A, B    : IN  std_logic_vector(7 DOWNTO 0);  -- 8-bit inputs
        opcode  : IN  std_logic_vector(7 DOWNTO 0);  -- 8-bit opcode
        R1      : OUT std_logic_vector(3 DOWNTO 0);  -- 4-bit result 1
        R2      : OUT std_logic_vector(3 DOWNTO 0);  -- 4-bit result 2
        neg     : OUT std_logic                       -- Negative flag
    );
END ENTITY;

ARCHITECTURE Behavior OF ALU2 IS
    SIGNAL full_result : std_logic_vector(7 DOWNTO 0);  -- Internal 8-bit result
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            full_result <= (OTHERS => '0');  -- Reset the internal result to 0
            neg <= '0';  -- Reset neg to 0
        ELSIF rising_edge(clk) THEN
            CASE opcode IS
                 WHEN "00000001" =>  -- Swap the lower and upper 4 bits of A
						full_result <= A(3 downto 0) & A(7 downto 4);
					  
					  WHEN "00000010" =>  -- OR of A and B
						 full_result <= A OR B;

					  WHEN "00000100" =>  -- Decrement B by 5
						 full_result <= std_logic_vector(unsigned(B) - 5);

					  WHEN "00001000" =>  -- Invert all bits of A
						 full_result <= NOT A;

					  WHEN "00010000" =>  -- Invert the bit-significance order of A
						 full_result <= A(0) & A(1) & A(2) & A(3) & A(4) & A(5) & A(6) & A(7);

					  WHEN "00100000" =>  -- Find the greater value of A and B
						 IF unsigned(A) > unsigned(B) THEN
							full_result <= A;
						 ELSE
							full_result <= B;
						 END IF;

					  WHEN "01000000" =>  -- Produce the difference between A and B
						 full_result <= std_logic_vector(unsigned(A) - unsigned(B));

					  WHEN "10000000" =>  -- Produce the result of XNORing A and B
						 full_result <= A XNOR B;

                WHEN OTHERS =>
                    full_result <= (OTHERS => '0');  -- Default case
            END CASE;

            -- Set the neg signal based on the MSB of the result
            neg <= full_result(7);  -- MSB indicates sign (1 = negative, 0 = positive)
        END IF;
    END PROCESS;

    -- Split the result into R1 and R2
    R1 <= full_result(3 DOWNTO 0);  -- Least significant nibble
    R2 <= full_result(7 DOWNTO 4);  -- Most significant nibble

END ARCHITECTURE;