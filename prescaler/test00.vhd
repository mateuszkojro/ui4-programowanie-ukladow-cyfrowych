----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:38:00 05/07/2021 
-- Design Name: 
-- Module Name:    test00 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test00 is
    Port ( clk , reset : in  STD_LOGIC;
          y : out  STD_LOGIC);
end test00;

architecture Behavioral of test00 is
signal temp : std_logic;

begin
process (clk, reset)
variable dzielnik : natural range 0 to 12500000;
begin
	if reset = '1' then
		dzielnik := 0;
	elsif (clk'event and clk = '0') then
		dzielnik := dzielnik + 1;
			if dzielnik = 12500000 then
				dzielnik := 0;
				temp <= not temp;
			end if;
	end if;
end process;
y <= temp;
end Behavioral;

