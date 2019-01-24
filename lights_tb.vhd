
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Testbench VHDL code for traffic light controller 

ENTITY test_VHDL IS
END test_VHDL ;

ARCHITECTURE behavior OF test_VHDL IS 
    -- Component Declaration for the traffic light controller 
    COMPONENT semaforo
    PORT(
         sensor : IN  std_logic;
         clk : IN  std_logic;
         rst_n : IN  std_logic;
         light_highway : OUT  std_logic_vector(2 downto 0);
         light_farm : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
	 
   --Inputs 
   signal sensor : std_logic := '0';
   signal clk : std_logic := '1';
   signal rst_n : std_logic := '0';
   --Outputs
   signal light_highway : std_logic_vector(2 downto 0);
   signal light_farm : std_logic_vector(2 downto 0);
	
-- Definición del periodo del reloj correspondiente
-- según el código de Entrega

-- Códigos acabados en            Periodo

--	       0,4,6                    100 ms
--			 1,5,7                    200 ms
--			 2,8                      250 ms
--			 3,9                      500 ms
			 
   constant clk_period : time := 100 ms;
	
BEGIN
 -- Instantiate the traffic light controller 
   sem : semaforo PORT MAP (
          sensor => sensor,
          clk => clk,
          rst_n => rst_n,
          light_highway => light_highway,
          light_farm => light_farm
        );

-- Clock process definitions
   clk_process :process
   begin
   clk <= '1';
   wait for clk_period/2;
   clk <= '0';
   wait for clk_period/2;
   end process;
  

stim_proc: process
  begin    
  rst_n <= '0';
  sensor <= '0';
  wait for 100 ms;

  assert (light_highway="001") report "ASRT T1H not_OK";
  assert (light_highway/="001") report "ASRT T1H OK";
  assert (light_farm="100") report "ASRT T1F not_OK";
  assert (light_farm/="100") report "ASRT T1F OK";

  wait for 900 ms;
  rst_n <= '1';
  
  wait for 50 ms;

  assert (light_highway="001") report "ASRT T2H not_OK";
  assert (light_highway/="001") report "ASRT T2H OK";
  assert (light_farm="100") report "ASRT T2F not_OK";
  assert (light_farm/="100") report "ASRT T2F OK";

  wait for 1900 ms;

  sensor <= '1';
  
  wait for 100 ms;
  assert (light_highway="010") report "ASRT T3H not_OK";
  assert (light_highway/="010") report "ASRT T3H OK";
  assert (light_farm="100") report "ASRT T3F not_OK";
  assert (light_farm/="100") report "ASRT T3F OK";
  
  wait for 3000 ms;
  assert (light_highway="100") report "ASRT T4H not_OK";
  assert (light_highway/="100") report "ASRT T4H OK";
  assert (light_farm="001") report "ASRT T4F not_OK";
  assert (light_farm/="001") report "ASRT T4F OK";

  wait for 2900 ms;
  sensor <= '0';
  
  wait for 100 ms;
  assert (light_highway="100") report "ASRT T5H not_OK";
  assert (light_highway/="100") report "ASRT T5H OK";
  assert (light_farm="001") report "ASRT T5F not_OK";
  assert (light_farm/="001") report "ASRT T5F OK";
  
  wait for 2900 ms;
  sensor <= '1';

  wait for 100 ms;
  assert (light_highway="100") report "ASRT T6H not_OK";
  assert (light_highway/="100") report "ASRT T6H OK";
  assert (light_farm="001") report "ASRT T6F not_OK";
  assert (light_farm/="001") report "ASRT T6F OK";
  
  wait for 1000 ms;
  assert (light_highway="100") report "ASRT T7H not_OK";
  assert (light_highway/="100") report "ASRT T7H OK";
  assert (light_farm="010") report "ASRT T7F not_OK";
  assert (light_farm/="010") report "ASRT T7F OK";

  wait for 900 ms;
  sensor <= '0';

  wait for 100 ms;
  assert (light_highway="100") report "ASRT T8H not_OK";
  assert (light_highway/="100") report "ASRT T8H OK";
  assert (light_farm="010") report "ASRT T8F not_OK";
  assert (light_farm/="010") report "ASRT T8F OK";

  wait for 2000 ms;
  assert (light_highway="001") report "ASRT T9H not_OK";
  assert (light_highway/="001") report "ASRT T9H OK";
  assert (light_farm="100") report "ASRT T9F not_OK";
  assert (light_farm/="100") report "ASRT T9F OK";


  wait for 7900 ms;
  sensor <= '1';

  wait for 100 ms;
  assert (light_highway="001") report "ASRT T10H not_OK";
  assert (light_highway/="001") report "ASRT T10H OK";
  assert (light_farm="100") report "ASRT T10F not_OK";
  assert (light_farm/="100") report "ASRT T10F OK";
  

  wait for 2000 ms;
  assert (light_highway="010") report "ASRT T11H not_OK";
  assert (light_highway/="010") report "ASRT T11H OK";
  assert (light_farm="100") report "ASRT T11F not_OK";
  assert (light_farm/="100") report "ASRT T11F OK";
  
  wait for 3000 ms;
  assert (light_highway="100") report "ASRT T12H not_OK";
  assert (light_highway/="100") report "ASRT T12H OK";
  assert (light_farm="001") report "ASRT T12F not_OK";
  assert (light_farm/="001") report "ASRT T12F OK";

  wait for 2900 ms;
  sensor <= '0';

  wait for 100 ms;
  assert (light_highway="100") report "ASRT T13H not_OK";
  assert (light_highway/="100") report "ASRT T13H OK";
  assert (light_farm="001") report "ASRT T13F not_OK";
  assert (light_farm/="001") report "ASRT T13F OK";

  wait for 1900 ms;
  rst_n <= '0';
  
  wait for 10 ms;   
  assert (light_highway="001") report "ASRT T14H not_OK";
  assert (light_highway/="001") report "ASRT T14H OK";
  assert (light_farm="100") report "ASRT T14F not_OK";
  assert (light_farm/="100") report "ASRT T14F OK";

  wait for 990 ms;
  rst_n <= '1';

  wait for 3000 ms;
  sensor <='1';
  
  wait for 100 ms;
  assert (light_highway="010") report "ASRT T15H not_OK";
  assert (light_highway/="010") report "ASRT T15H OK";
  assert (light_farm="100") report "ASRT T15F not_OK";
  assert (light_farm/="100") report "ASRT T15F OK";
  
  wait for 3000 ms;  
  assert (light_highway="100") report "ASRT T16H not_OK";
  assert (light_highway/="100") report "ASRT T16H OK";
  assert (light_farm="001") report "ASRT T16F not_OK";
  assert (light_farm/="001") report "ASRT T16F OK";
  
  wait for 1900 ms;
  sensor <='0';
  
  wait for 5100 ms;
  assert (light_highway="100") report "ASRT T17H not_OK";
  assert (light_highway/="100") report "ASRT T17H OK";
  assert (light_farm="010") report "ASRT T17F not_OK";
  assert (light_farm/="010") report "ASRT T17F OK";

  wait for 3000 ms;
  assert (light_highway="001") report "ASRT T18H not_OK";
  assert (light_highway/="001") report "ASRT T18H OK";
  assert (light_farm="100") report "ASRT T18F not_OK";
  assert (light_farm/="100") report "ASRT T18F OK";

  wait for 12000 ms;
  assert (light_highway="001") report "ASRT T19H not_OK";
  assert (light_highway/="001") report "ASRT T19H OK";
  assert (light_farm="100") report "ASRT T19F not_OK";
  assert (light_farm/="100") report "ASRT T19F OK";

  wait;
 end process;

END;