--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:48:03 04/16/2021
-- Design Name:   
-- Module Name:   C:/Users/mateu/mnozenie_10/test_mnozenie_10.vhd
-- Project Name:  mnozenie_10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mnozenie_10
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_mnozenie_10 IS
END test_mnozenie_10;
 
ARCHITECTURE behavior OF test_mnozenie_10 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mnozenie_10
    PORT(
         MNOZNA : IN  std_logic_vector(3 downto 0);
         WYNIK : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MNOZNA : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal WYNIK : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mnozenie_10 PORT MAP (
          MNOZNA => MNOZNA,
          WYNIK => WYNIK
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		MNOZNA <= "1010";

      wait for 100 ns;	

		MNOZNA <= "0110";

      wait;
   end process;

END;
