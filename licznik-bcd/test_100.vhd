--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:36:34 04/23/2021
-- Design Name:   
-- Module Name:   C:/Users/mateu/LicznikBCD/test_100.vhd
-- Project Name:  LicznikBCD
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LICZNIK_100
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
use IEEE.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_100 IS
END test_100;
 
ARCHITECTURE behavior OF test_100 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LICZNIK_100
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         en_1 : OUT  std_logic;
         en_2 : OUT  std_logic;
         wyjscie : OUT  std_logic_vector(3 downto 0);
         wyjscie2 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal en_1 : std_logic;
   signal en_2 : std_logic;
   signal wyjscie : std_logic_vector(3 downto 0);
   signal wyjscie2 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LICZNIK_100 PORT MAP (
          clk => clk,
          reset => reset,
          en_1 => en_1,
          en_2 => en_2,
          wyjscie => wyjscie,
          wyjscie2 => wyjscie2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		reset <= '1';
	
      wait for 100 ns;

		reset <='0';

      wait;
   end process;

END;
