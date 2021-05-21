--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:06:59 04/16/2021
-- Design Name:   
-- Module Name:   C:/Users/mateu/mnozenie_13/mnozenie_13_test.vhd
-- Project Name:  mnozenie_13
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mnozenie_13
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
 
ENTITY mnozenie_13_test IS
END mnozenie_13_test;
 
ARCHITECTURE behavior OF mnozenie_13_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mnozenie_13
    PORT(
         wejscie : IN  std_logic_vector(3 downto 0);
         wyjscie : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal wejscie : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal wyjscie : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mnozenie_13 PORT MAP (
          wejscie => wejscie,
          wyjscie => wyjscie
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		wejscie <= "1111";
		
		wait for 100 ns;
		
		wejscie <= "1100";

		wait for 100 ns;
		
		wejscie <= "0000";

      wait;
   end process;

END;
