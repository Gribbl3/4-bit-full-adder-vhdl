library ieee;
use ieee.std_logic_1164.all;

entity main is
	port(
		x, y : in std_logic_vector(3 downto 0);
		c_in : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		c_out : out std_logic
	);
end main;

architecture behavioral of main is 
	signal carry : std_logic_vector(4 downto 0);
begin
	carry(0) <= c_in; --initial carry in
	
	generate_full_adders: for i in 0 to 3 generate
		full_adder : entity work.full_adder port map(x(i), y(i), carry(i), sum(i), carry(i+1));
	end generate;
	
	c_out <= carry(4); --final carry output
end behavioral;