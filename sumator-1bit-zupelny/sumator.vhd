----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:05:46 04/09/2021 
-- Design Name: 
-- Module Name:    sumator - Behavioral 
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

entity sumator is
    Port ( a,b,v : in  STD_LOGIC;
           s,c : out  STD_LOGIC);
end sumator;

architecture Behavioral of sumator is

begin

	s <= a xor b xor v;
	c <= (a and b) or ((a xor b) and v);

end Behavioral;

