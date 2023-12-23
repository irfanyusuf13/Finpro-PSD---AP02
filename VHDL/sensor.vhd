library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sensor is
    port (
        CLK, RST : IN STD_LOGIC;
        humidityLevel : IN STD_LOGIC_VECTOR(0 to 6); 
        dropWater : OUT STD_LOGIC;
        waterCount : OUT INTEGER
    );
end entity sensor;

architecture rtl of sensor is
    type state_sensor is (INIT, READ_MOISTURE_LEVEL, CHECK_THRESHOLD, WATER_PLANT);
    signal curr_state_sensor : state_sensor := INIT;
    signal next_state_sensor : state_sensor := INIT;
    signal water_counter : INTEGER := 0;
    signal water_plant_transition : BOOLEAN := FALSE;
    
begin
    process(CLK, RST, curr_state_sensor, humidityLevel) is
        variable temp_humidity : STD_LOGIC_VECTOR(0 to 6);
        variable temp_out_sensor : STD_LOGIC;
    begin
        if RST = '1' then
            dropWater <= '0';
            temp_humidity := "0000000";
            temp_out_sensor := '0';
            next_state_sensor <= INIT;
            water_plant_transition <= FALSE;
            water_counter <= 0;
        else
        case curr_state_sensor is
            when INIT =>
                dropWater <= '0';
                temp_humidity := "0000000";
                temp_out_sensor := '0';
                next_state_sensor <= READ_MOISTURE_LEVEL;

            when READ_MOISTURE_LEVEL =>
                temp_humidity := humidityLevel;
                next_state_sensor <= CHECK_THRESHOLD;

            when CHECK_THRESHOLD =>
                if to_integer(unsigned(temp_humidity)) > 100 then 
                    next_state_sensor <= WATER_PLANT;
                    water_plant_transition <= TRUE;
                elsif to_integer(unsigned(temp_humidity)) < -80 then
                    next_state_sensor <= WATER_PLANT;
                    water_plant_transition <= TRUE;    
                else
                    next_state_sensor <= INIT;
                    water_plant_transition <= FALSE;
                end if;

            when WATER_PLANT =>
                temp_out_sensor := '1';
                dropWater <= temp_out_sensor;
                if water_plant_transition then
                    water_counter <= water_counter + 1;
                end if;
                next_state_sensor <= INIT;
                water_plant_transition <= FALSE;
        end case;
    end if;
end process;
    
    process(CLK) is
    begin
        if rising_edge(CLK) then
            curr_state_sensor <= next_state_sensor;
        end if;
    end process;
    waterCount <= water_counter;
end architecture;
