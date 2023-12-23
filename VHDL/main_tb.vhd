LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY main_tb IS
END ENTITY main_tb;

ARCHITECTURE behavior OF main_tb IS

    COMPONENT main
        PORT (
            CLK, RST : IN STD_LOGIC;
            humidityLevel : IN STD_LOGIC_VECTOR(0 TO 6);
            dropWater : OUT STD_LOGIC;
            waterCount : OUT INTEGER
        );
    END COMPONENT ;

    SIGNAL CLK, RST : STD_LOGIC := '0';
    SIGNAL humidityLevel : STD_LOGIC_VECTOR(0 TO 6) := "0000000";
    SIGNAL dropWater : STD_LOGIC;
    SIGNAL waterCount : INTEGER;
    SIGNAL timeWater, timeCounter : STD_LOGIC_VECTOR(0 TO 6);
    SIGNAL wateringDrop : STD_LOGIC;

    BEGIN
    UUT : main
        PORT MAP (
            CLK => CLK,
            RST => RST,
            humidityLevel => humidityLevel,
            dropWater => dropWater,
            waterCount => waterCount
        );

    CLK_PROCESS : process
    begin
        while now < 100 ps loop
            clk <= not clk;
            wait for 5 ps;
        end loop;
        wait;
    END PROCESS ;

    STIMULUS_PROCESS: PROCESS
    BEGIN
        RST <= '1';  
        WAIT FOR 10 NS;
        RST <= '0'; 
        WAIT FOR 10 NS;

        for i in 1 to 64 loop
            WAIT UNTIL rising_edge(clk);
        end loop;
        WAIT;
    END PROCESS ; 

END ARCHITECTURE behavior;
