--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:44:20 04/16/2021
-- Design Name:   
-- Module Name:   C:/Users/mateu/dekoder_klawiatura/test_dekoder.vhd
-- Project Name:  dekoder_klawiatura
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dekoder_klawiatura
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
 
ENTITY test_dekoder IS
END test_dekoder;
 
ARCHITECTURE behavior OF test_dekoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dekoder_klawiatura
    PORT(
         WEJSCIE : IN  std_logic_vector(9 downto 0);
         WYJSCIE : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal WEJSCIE : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal WYJSCIE : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dekoder_klawiatura PORT MAP (
          WEJSCIE => WEJSCIE,
          WYJSCIE => WYJSCIE
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		WEJSCIE <= "1000000000";

      wait;
   end process;

END;
