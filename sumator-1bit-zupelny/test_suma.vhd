--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:17:04 04/09/2021
-- Design Name:   
-- Module Name:   C:/Users/mateu/sumator_1bi_zupelny/test_suma.vhd
-- Project Name:  sumator_1bi_zupelny
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumator
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
 
ENTITY test_suma IS
END test_suma;
 
ARCHITECTURE behavior OF test_suma IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumator
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         v : IN  std_logic;
         s : OUT  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal v : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumator PORT MAP (
          a => a,
          b => b,
          v => v,
          s => s,
          c => c
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		a <= '1';
		b <= '1';
		v <= '1';
		
      wait for 100 ns;	

		a <= '1';
		b <= '0';
		v <= '1';	

      wait for 100 ns;	

		a <= '1';
		b <= '1';
		v <= '0';

      wait for 100 ns;	

		a <= '0';
		b <= '0';
		v <= '0';
		
		wait for 100 ns;	

		a <= '0';
		b <= '0';
		v <= '1';	
		
      wait;
   end process;

END;
