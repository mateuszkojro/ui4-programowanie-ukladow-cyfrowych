----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:37:43 04/16/2021 
-- Design Name: 
-- Module Name:    mnozenie_10 - Behavioral 
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

-- dodajemy lib do dodawania
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

entity mnozenie_10 is
    Port ( MNOZNA : in  STD_LOGIC_VECTOR (3 downto 0);
           WYNIK : out  STD_LOGIC_VECTOR (6 downto 0));
end mnozenie_10;

architecture Behavioral of mnozenie_10 is

	-- sygnal to jakby drut / zmienna tymczasowa mozna zapisac jakas wartosc
	
	SIGNAL przesuniete_1 : STD_LOGIC_VECTOR (6 downto 0);
	SIGNAL przesuniete_3 : STD_LOGIC_VECTOR (6 downto 0);

begin

	-- Przesuwanie dziala jak dzialania na stringach
	przesuniete_1 <= "00" & MNOZNA & '0';
	przesuniete_3 <= MNOZNA & "000";
	
	WYNIK <= przesuniete_1 + przesuniete_3;
	
	

end Behavioral;

