----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:47:00 04/23/2021 
-- Design Name: 
-- Module Name:    LICZNIK_100 - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LICZNIK_100 is
    Port ( clk, reset  : in  STD_LOGIC;
			  en_1 : out STD_LOGIC;
			  en_2 : out STD_LOGIC;
           wyjscie : out  STD_LOGIC_VECTOR (3 downto 0);
           wyjscie2 : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end LICZNIK_100;

architecture Behavioral of LICZNIK_100 is

signal wyjscie_tym : STD_LOGIC_VECTOR (3 downto 0);
signal wyjscie_tym2 : STD_LOGIC_VECTOR (3 downto 0);
signal en_1_tym : STD_LOGIC;
signal en_2_tym : STD_LOGIC;

begin

	process (clk, reset)
	begin  
		if reset = '1' then
			wyjscie_tym <= "0000";
			
		elsif (clk'event and clk = '1') then
			wyjscie_tym <= wyjscie_tym + 1;
			en_1_tym <= '0';
			
			if wyjscie_tym = "1000" then
				en_1_tym <= '1';
			end if;
			
			if wyjscie_tym = "1001" then
				wyjscie_tym <= "0000";
			end if;
		end if;
	end process;
	
	
	
	process (clk, reset)
	begin  
		if reset = '1' then
			wyjscie_tym2 <= "0000";
		elsif (clk'event and clk = '1') then
		
				en_2_tym <= '0';
				
			if en_1_tym = '1' then
					wyjscie_tym2 <= wyjscie_tym2 + 1;
					
				if wyjscie_tym2 = "1000" then
					en_2_tym <= '1';
				end if;
				
				if wyjscie_tym2 = "1001" then
					wyjscie_tym2 <= "0000";
				end if;
			end if;
		end if;
	end process;
		

	en_1 <= en_1_tym;
	en_2 <= en_2_tym;
	wyjscie <= wyjscie_tym;
	wyjscie2 <= wyjscie_tym2;

end Behavioral;

