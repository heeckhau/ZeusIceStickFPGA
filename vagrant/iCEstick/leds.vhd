library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity leds is
	port(
		clk                          : in  std_logic;
		--  Led positions
--
--  I         D3
--  r
--  D     D2  D5  D4
--  A
--            D1
--
		led1, led2, led3, led4, led5 : out std_logic
	);
end entity leds;

architecture blink of leds is
	signal clk_4hz : std_logic;
begin

	name : process(clk) is
		variable counter : unsigned(23 downto 0);
	begin
		if rising_edge(clk) then
			if counter = 2_999_999 then
				counter := x"000000";
--				clk_4hz <= '1';
				clk_4hz <= not clk_4hz;
			else
				counter := counter + 1;
			end if;

		end if;
	end process name;
	
	led1 <= clk_4hz;
	led2 <= clk_4hz;
	led3 <= clk_4hz;
	led4 <= clk_4hz;
	led5 <= not clk_4hz;

end architecture blink;

