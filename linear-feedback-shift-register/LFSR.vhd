----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:28:02 04/22/2021 
-- Design Name: 
-- Module Name:    LFSR - Behavioral 
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

entity LFSR is
     Port ( 
				clk : in STD_LOGIC;
				reset : in STD_LOGIC;
				rej : inout  STD_LOGIC_VECTOR (9 downto 0));
end LFSR;

architecture Behavioral of LFSR is

begin

		process (clk, reset)
	begin  
		if reset = '1' then
		
				rej <= "1100000000";

		--	nastapi zmiana na clk i po tej zmianie bedzie 0	
		elsif (clk'event and clk = '0') then
		
				rej <= (rej(8) xor rej(9)) & rej(9 downto 1);

		end if;
	end process;


end Behavioral;

