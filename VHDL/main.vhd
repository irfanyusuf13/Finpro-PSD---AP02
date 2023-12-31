library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    port (
        CLK, RST : IN STD_LOGIC;
        humidityLevel : IN STD_LOGIC_VECTOR(0 to 6); 
        dropWater : OUT STD_LOGIC;
        waterCount : OUT INTEGER
    );
end entity main;

architecture structural of main is
    signal waterTime, counterTime : STD_LOGIC_VECTOR(0 to 6);
    signal wateringDrop : STD_LOGIC;
    signal wateringCount : INTEGER;
    signal timeWater, timecounter : STD_LOGIC_VECTOR(0 to 6);
    signal dropWatering : STD_LOGIC;

    component randomizedWatering
        port (
            CLK, RST : IN STD_LOGIC;
            dropWater : OUT STD_LOGIC;
            waterTime, counterTime : INOUT STD_LOGIC_VECTOR(0 to 6)
        );
    end component;

    component wateringSystem
        port (
            CLK, RST : IN STD_LOGIC;
            waterTime, counterTime : INOUT STD_LOGIC_VECTOR(0 to 6);
            dropWater : OUT STD_LOGIC
        );
    end component;

    component sensor
        port (
            CLK, RST : IN STD_LOGIC;
            humidityLevel : IN STD_LOGIC_VECTOR(0 to 6); 
            dropWater : OUT STD_LOGIC;
            waterCount : OUT INTEGER
        );
    end component;

begin
    randomizedWatering_inst : randomizedWatering
        port map (
            CLK => CLK,
            RST => RST,
            dropWater => dropWatering,
            waterTime => timeWater,
            counterTime => timecounter
        );

    wateringSystem_inst : wateringSystem
        port map (
            CLK => CLK,
            RST => RST,
            waterTime => waterTime,
            counterTime => counterTime,
            dropWater => wateringDrop
        );

    sensor_inst : sensor
        port map (
            CLK => CLK,
            RST => RST,
            humidityLevel => humidityLevel,
            dropWater => dropWater,
            waterCount => wateringCount
        );

    waterCount <= wateringCount;

end architecture structural;
