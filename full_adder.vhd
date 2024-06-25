library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port (
        a, b, cin: in std_logic;
        sum, carry: out std_logic
    );
end entity full_adder;

architecture dataflow of full_adder is
    signal s1, c1, s2: std_logic;
begin
	--work finds half_adder file
	--has to be in the same directory for it to work
	--uses positional port mapping technique
    ha0: entity work.half_adder port map (a, b, s1, c1);
    ha1: entity work.half_adder port map (cin, s1, sum, s2);
    carry <= c1 or s2;
end dataflow; 
