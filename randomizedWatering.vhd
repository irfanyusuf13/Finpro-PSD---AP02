library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


entity randomizedWatering is
    port (
        CLK,RST : IN STD_LOGIC;
        dropWater : OUT STD_LOGIC;
        waterTime, counterTime : INOUT STD_LOGIC_VECTOR(0 to 6) := "0000000"
    );
end entity randomizedWatering;

architecture rtl of randomizedWatering is
    type state is (INIT, SET_TIME, WAIT_FOR_INTERVAL, WATERING);
    signal curr_state : state := INIT;
    signal next_state : state := INIT;
    
begin
    process(CLK, RST, curr_state) is
        variable temp_inp : STD_LOGIC_VECTOR(0 to 6);
        variable temp_counter : STD_LOGIC_VECTOR(0 to 6);
        variable temp_out : STD_LOGIC;
        variable seed_1, seed_2 : INTEGER := 1;

        impure function randint
            return INTEGER is
            variable ril : Real;
            variable temp : INTEGER;
            begin
            uniform(seed_1, seed_2, ril);
            temp := INTEGER(ril * 64.0);
            return temp;
        end function;

    begin
        case curr_state is
            when INIT =>
                dropWater <= '0';
                temp_inp := "0000000";
                temp_counter := "0000000";
                temp_out := '0';
                next_state <= SET_TIME;

            when SET_TIME =>
                temp_inp := STD_LOGIC_VECTOR(to_unsigned(randint, 7));
                waterTime <= temp_inp;
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
        if rising_edge(CLK) then
            curr_state <= next_state;
        end if;
    end process;
end architecture rtl;    