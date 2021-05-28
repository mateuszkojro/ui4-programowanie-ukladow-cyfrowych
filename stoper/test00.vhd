library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity test00 is
    Port ( clk , reset : in  STD_LOGIC;
			  stop_klatka : in STD_LOGIC;
			  pause_button: in STD_LOGIC;
			  wlacznik : out STD_LOGIC_VECTOR (7 downto 0);
           wyswietlacz : out  STD_LOGIC_VECTOR (6 downto 0);
			  licznik_sek : in  STD_LOGIC_VECTOR (3 downto 0);
			  licznik_sek_10 : in STD_LOGIC_VECTOR (3 downto 0);
			  licznik_min : in STD_LOGIC_VECTOR (3 downto 0);
			  licznik_min_10 : in STD_LOGIC_VECTOR (3 downto 0));
			  
end test00;

architecture Behavioral of test00 is
-- prescaled cock
signal p_clk : std_logic;
signal clk_100hz : std_logic;
signal poz_licz : std_logic_vector (2 downto 0);
signal wejscie_dekodera : std_logic_vector (3 downto 0);
signal wyjscie_dekodera : std_logic_vector (6 downto 0);

signal cs1 : STD_LOGIC_VECTOR (3 downto 0);
signal cs10 : STD_LOGIC_VECTOR (3 downto 0);
signal cs100 : STD_LOGIC_VECTOR (3 downto 0);
signal cs1000 : STD_LOGIC_VECTOR (3 downto 0);

signal out1 : STD_LOGIC_VECTOR (3 downto 0);
signal out2 : STD_LOGIC_VECTOR (3 downto 0);
signal out3 : STD_LOGIC_VECTOR (3 downto 0);
signal out4 : STD_LOGIC_VECTOR (3 downto 0);
signal out5 : STD_LOGIC_VECTOR (3 downto 0);
signal out6 : STD_LOGIC_VECTOR (3 downto 0);
signal out7 : STD_LOGIC_VECTOR (3 downto 0);
signal out8 : STD_LOGIC_VECTOR (3 downto 0);



signal enable1 : STD_LOGIC;
signal enable2 : STD_LOGIC;
signal enable3 : STD_LOGIC;

signal running : STD_LOGIC;

begin
-- /\ - m18
-- \/ p18
-- -> m17
-- + n17
-- <- p17 
-- prescaler

--running <= '1';

process (clk, reset)
variable dzielnik : natural range 0 to 50000;
begin
	if reset = '1' then
		dzielnik := 0;
	elsif (clk'event and clk = '0') then
		dzielnik := dzielnik + 1;
			if dzielnik = 50000 then
				dzielnik := 0;
				p_clk <= not p_clk;
			end if;
	end if;
end process;

-- zegar 100Hz (jakis problem)
process (clk, reset)
variable dzielnik : natural range 0 to 500000;
begin
	if reset = '1' then
		dzielnik := 0;
	elsif (clk'event and clk = '0') then
		dzielnik := dzielnik + 1;
			if dzielnik = 500000 then
				dzielnik := 0;
				clk_100hz <= not clk_100hz;
			end if;
	end if;
end process;

-- Licznik jednosci
process (clk_100hz, reset)
begin  
	if reset = '1' then
		cs1 <= "0000";
		out1 <= "0000";
	elsif (clk_100hz'event and clk_100hz = '1') then
		out1 <= cs1;
		if running = '1' then
			cs1 <= cs1 + 1;
		end if;
		
		enable1 <= '0';
			
		if cs1 = "1000" then
			enable1 <= '1';
		end if;
			
		if cs1 = "1001" then
			cs1 <= "0000";
		end if;
	end if;
end process;

-- licznik 10
process (clk_100hz, reset)
begin  
	if reset = '1' then
		cs10 <= "0000";
		out2 <= "0000";
	elsif (clk_100hz'event and clk_100hz = '1') then
		
			enable2 <= '0';
				
		if enable1 = '1' then
				out2 <= cs10;
				cs10 <= cs10 + 1;
					
			if cs10 = "1000" then
				enable2 <= '1';
			end if;
				
			if cs10 = "1001" then
				cs10 <= "0000";
			end if;
		end if;
	end if;
end process;

-- licznik 100
process (clk_100hz, reset)
begin  
	if reset = '1' then
		cs100 <= "0000";
		out3 <= "0000";
	elsif (clk_100hz'event and clk_100hz = '1') then
		
			enable3 <= '0';
				
		if enable2 = '1' then
				out3 <= cs100;
				cs100 <= cs100 + 1;
					
			if cs100 = "1000" then
				enable3 <= '1';
			end if;
				
			if cs100 = "1001" then
				cs100 <= "0000";
			end if;
			
		end if;
	end if;
end process;

-- licznik 100
process (clk_100hz, reset)
begin  
	if reset = '1' then
		cs1000 <= "0000";
		out4 <= "0000";
	elsif (clk_100hz'event and clk_100hz = '1') then		
		if enable3 = '1' then
				out4 <= cs1000;
				cs1000 <= cs1000 + 1;
			
			if cs1000 = "1001" then
				cs1000 <= "0000";
			end if;
		end if;
	end if;
end process;




-- stopklatka
process (clk, reset)
begin  
	if reset = '1' then
--		out1 <= "0000";
--		out2 <= "0000";
--		out3 <= "0000";
--		out4 <= "0000";
		out5 <= "0000";
		out6 <= "0000";
		out7 <= "0000";
		out8 <= "0000";
		
	elsif (clk'event and clk = '1') then
	
	if stop_klatka = '1' then
	
		out5 <= cs1;
		out6 <= cs10 - 1;
		out7 <= cs100 - 1;
		out8 <= cs1000 - 1;
	
	end if;
	
	if pause_button = '1' then
		running <= not running;
	end if;
	
	end if;
end process;

-- sterowanie wyswietlaczem
process (p_clk, reset)
begin
	if reset = '1' then
		-- others ustawia pozostale na podana wartosc w tym przypadku wszystkie
		poz_licz <= ( others => '0'); 
	elsif (p_clk'event and p_clk = '0') then
		-- odliczamy po kolejnych wyswietlaczach ktor maja byc aktywne 
		-- (tylko do 4 z wzgledy na rozmiar komorki pamieci)
		poz_licz <= poz_licz + 1;
	end if;
end process;


-- wybieramy ktory "wyswietlacz" wybrac
with poz_licz select
wlacznik <= not "00000001" when "000",
				not "00000010" when "001",
				not "00000100" when "010",
				not "00001000" when "011",
				not "00010000" when "100",
				not "00100000" when "101",
				not "01000000" when "110",
				not "10000000" when "111";

---- przekazmy odpowiednia zmienna na dekoder (z klawiatury)
--with poz_licz select 
--wejscie_dekodera <= 	licznik_sek when "00",
--							licznik_sek_10 when "01",
--							licznik_min 	when "10",
--							licznik_min_10 when "11";

-- przekazmy odpowiednia zmienna na dekoder (z licznikow)
with poz_licz select 
wejscie_dekodera <= 	out1 when	"000",
							out2 when 	"001",
							out3 when 	"010",
							out4 when	"011",
							out5 when	"100",
							out6 when	"101",
							out7 when	"110",
							out8 when	"111";


-- zamieniamy wartoc bin na wyswietlacz
with wejscie_dekodera select
wyjscie_dekodera <=  not "1111110" when "0000",
							not "0110000" when "0001",
							not "1101101" when "0010",
							not "1111001" when "0011",
							not "0110011" when "0100",
							not "1011011" when "0101",
							not "1011111" when "0110",
							not "1110000" when "0111",
							not "1111111" when "1000",
							not "1111011" when "1001";


-- przekazujemy wyjscie do wyswietlacza
wyswietlacz <= wyjscie_dekodera;
							
					
end Behavioral;

