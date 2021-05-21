----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:25:04 04/16/2021 
-- Design Name: 
-- Module Name:    dekoder_klawiatura - Behavioral 
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

entity dekoder_klawiatura is
    Port ( WEJSCIE : in  STD_LOGIC_VECTOR (9 downto 0);
           WYJSCIE : out  STD_LOGIC_VECTOR (7 downto 0));
end dekoder_klawiatura;

architecture Behavioral of dekoder_klawiatura is

	SIGNAL decoded : STD_LOGIC_VECTOR (4 downto 0);

begin
	
	decoded(0) <= WEJSCIE(1) or WEJSCIE(3) or WEJSCIE(5) or WEJSCIE(7) or WEJSCIE(9);
	decoded(1) <= WEJSCIE(2) or WEJSCIE(3) or WEJSCIE(5) or WEJSCIE(6) or WEJSCIE(9);
	decoded(2) <= WEJSCIE(4) or WEJSCIE(5) or WEJSCIE(6);
	decoded(3) <= WEJSCIE(7) or WEJSCIE(8) or WEJSCIE(9);
	
	
	
	WYJSCIE <=  "0000" & decoded;
	
end Behavioral;

