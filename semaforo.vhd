
-- Company: ETSIT
-- Engineer: Jesus RO

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity semaforo is
port ( sensor : in STD_LOGIC; -- Sensor
		 clk : in STD_LOGIC; 	-- clock
		 rst_n : in STD_LOGIC;  -- reset active low
		 light_highway: out STD_LOGIC_VECTOR(2 downto 0);
		 light_farm: out STD_LOGIC_VECTOR(2 downto 0));
end semaforo;



architecture a_semaforo of semaforo is

type TIPO_ESTADO is (NORMAL,SALTO1,SALTO2,SALTO3,SALTO4);
signal ESTADO_actual: TIPO_ESTADO:= NORMAL;
--signal ESTADO_siguiente: TIPO_ESTADO := NORMAL;
signal contador : STD_LOGIC_VECTOR(8 downto 0) :="000000000";

constant verde : STD_LOGIC_VECTOR (2 downto 0) :="001";
constant amarillo : STD_LOGIC_VECTOR (2 downto 0) :="010";
constant rojo : STD_LOGIC_VECTOR (2 downto 0) :="100";

begin

--process (clk,rst_n)
--		if (rst_n='0') then
--						ESTADO_actual <= NORMAL;	
--			elsif (clk'event and clk='1') then
--						ESTADO_actual <= ESTADO_siguiente;
--			end if;
--begin 
			
	--	end process;
	
	process (rst_n,clk,ESTADO_actual,sensor)
		begin		
		if (rst_n='0') then
					  ESTADO_actual <= NORMAL;	
		elsif (clk'event and clk='1') then
			
			case ESTADO_actual is 
				when NORMAL =>
					if (sensor = '1') then 
						ESTADO_actual <= SALTO1;
					else
						ESTADO_actual <= NORMAL;					
					end if;
					
				when SALTO1 =>
					if(rst_n='0') then 
						ESTADO_actual <= NORMAL;
					else
						contador <= contador +1;
						if (contador = 29) then
							contador <= "000000000";
							ESTADO_actual <= SALTO2;
						else
							ESTADO_actual <= SALTO1; -- ponia ESTADO_siguiente
						end if;
					end if;
					
				when SALTO2 =>
					if(rst_n='0') then 
						ESTADO_actual <= NORMAL;
					else
						contador <= contador +1;
						if (contador = 69) then 
							contador <= "000000000";
							ESTADO_actual <= SALTO3;
						else 
							ESTADO_actual <= SALTO2;
						end if;
					end if;
					
				when SALTO3 =>
					if(rst_n='0') then 
						ESTADO_actual <= NORMAL;
					else
						contador <= contador +1;
						if (contador = 29) then 
							contador <= "000000000";
							ESTADO_actual <= SALTO4;
						else
							ESTADO_actual <= SALTO3;
						end if;
					end if;
					
				when SALTO4 =>
					if(rst_n='0') then 
						ESTADO_actual <= NORMAL;
					else
						contador <= contador +1;
						if(contador=98) then
						contador <= "000000000";
						ESTADO_actual <= NORMAL;
						else
						ESTADO_actual <= SALTO4;
						end if;
					end if;
				end case;
			end if;
		end process;

process(ESTADO_actual)
	begin
		case ESTADO_actual is
			when NORMAL =>
				light_highway <= verde;
				light_farm <= rojo;
			when SALTO1 =>
				light_highway <= amarillo;
				light_farm <= rojo;
			when SALTO2 =>
				light_highway <= rojo;
				light_farm <= verde;
			when SALTO3 =>
				light_highway <= rojo;
				light_farm <= amarillo;
			when SALTO4 =>
				light_highway <= verde;
				light_farm <= rojo;		
		end case;
	end process;
end a_semaforo;

