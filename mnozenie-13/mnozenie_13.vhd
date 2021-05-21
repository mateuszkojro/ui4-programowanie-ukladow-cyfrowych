----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:59:41 04/16/2021 
-- Design Name: 
-- Module Name:    mnozenie_13 - Behavioral 
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

library IEEE;
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

entity mnozenie_13 is
    Port ( wejscie : in  STD_LOGIC_VECTOR (3 downto 0);
           wyjscie : out  STD_LOGIC_VECTOR (7 downto 0));
end mnozenie_13;

architecture Behavioral of mnozenie_13 is

	SIGNAL przesuniecie_2 : STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL przesuniecie_3 : STD_LOGIC_VECTOR (7 downto 0);

begin

	przesuniecie_2 <= "00" & wejscie & "00";
	przesuniecie_3 <= "0" & wejscie & "000";
	
	wyjscie <= wejscie + przesuniecie_2 + przesuniecie_3;
	
end Behavioral;

