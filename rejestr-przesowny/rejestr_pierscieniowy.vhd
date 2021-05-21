----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:08:17 04/16/2021 
-- Design Name: 
-- Module Name:    rejestr_pierscieniowy - Behavioral 
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

entity rejestr_pierscieniowy is
    Port ( 
				clk : in STD_LOGIC;
				reset : in STD_LOGIC;
				rej : inout  STD_LOGIC_VECTOR (7 downto 0));
				
end rejestr_pierscieniowy;

architecture Behavioral of rejestr_pierscieniowy is

begin

	process (clk, reset)
	begin  
		if reset = '1' then
		
				rej <= "00000000";

		--	nastapi zmiana na clk i po tej zmianie bedzie 0	
		elsif (clk'event and clk = '0') then
		
				rej <= not rej(0) & rej(7 downto 1);

		end if;
	end process;

end Behavioral;

