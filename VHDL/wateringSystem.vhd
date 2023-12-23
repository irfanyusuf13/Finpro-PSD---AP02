library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



entity wateringSystem is
    port (
        CLK, RST : IN STD_LOGIC;
        waterTime, counterTime : INOUT STD_LOGIC_VECTOR(0 to 6);
        dropWater : OUT STD_LOGIC
    );
end entity wateringSystem;

architecture rtl of wateringSystem is
    type state is (INIT, SET_TIME, WAIT_FOR_INTERVAL, WATERING);
    signal curr_state : state := INIT;
    signal next_state : state := INIT;
    
begin
    process(CLK, RST, curr_state) is
        variable temp_inp : STD_LOGIC_VECTOR(0 to 6);
        variable temp_counter : STD_LOGIC_VECTOR(0 to 6);
        variable temp_out : STD_LOGIC;
    begin
        case curr_state is
            when INIT =>
                dropWater <= '0';
                counterTime <= "0000000";
                temp_inp := "0000000";
                temp_counter := "0000000";
                temp_out := '0';
                next_state <= SET_TIME;

            when SET_TIME =>
                temp_inp := waterTime;
                next_state <= WAIT_FOR_INTERVAL;

            when WAIT_FOR_INTERVAL =>
                if temp_inp = temp_counter then
                    next_state <= WATERING;
                else
                    temp_counter := temp_counter + 1;
                    counterTime <= temp_counter;
                    next_state <= WAIT_FOR_INTERVAL;
                end if;
            when WATERING =>
                temp_out := '1';
                dropWater <= temp_out;
                next_state <= INIT;
        end case;
    end process;
    
    process(CLK) is
    begin
        waterTime <= "0000011";

        if rising_edge(CLK) then
            curr_state <= next_state;
        end if;
    end process;
end architecture rtl;