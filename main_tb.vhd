library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main_tb is
end entity main_tb;

architecture tb_arch of main_tb is
    signal CLK, RST : std_logic := '0';
    signal humidityLevel, waterTime, counterTime : std_logic_vector(0 to 6) := (others => '0');
    signal dropWater, wateringDrop, dropWatering : std_logic;
    signal wateringCount, waterCount : integer := 0;

    -- Add your entity instantiation here
    component main
        port (
            CLK, RST : in std_logic;
            humidityLevel, waterTime, counterTime : inout std_logic_vector(0 to 6); 
            dropWater, wateringDrop, dropWatering : out std_logic;
            wateringCount : inout integer;
            waterCount : out integer
        );
    end component;

begin
    UUT: main
        port map (
            CLK => CLK,
            RST => RST,
            humidityLevel => humidityLevel,
            waterTime => waterTime,
            counterTime => counterTime,
            dropWater => dropWater,
            wateringDrop => wateringDrop,
            dropWatering => dropWatering,
            wateringCount => wateringCount,
            waterCount => waterCount
        );

    CLK_PROCESS: process
    begin
        while now < 10000 ps loop
            CLK <= not CLK;
            wait for 5 ps;
        end loop;
        wait;
    end process;

    STIMULUS_PROCESS: process
    begin
        wait for 15 ps; 

        RST <= '1';
        wait for 5 ps;
        RST <= '0';
        wait;
    end process;
end architecture tb_arch;
