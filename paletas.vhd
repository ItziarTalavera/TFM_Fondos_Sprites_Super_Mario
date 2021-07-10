----------------------------------------------------------------------------------
--                                Paletas                                       --
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library WORK;
use WORK.VGA_PKG.ALL;

entity paletas is
	port (
	--Puertos de entrada
	dir_paletas  : in std_logic_vector(6-1 downto 0); --64 posiciones de memoria
 	--Puertos de salida
	dato_paletas : out std_logic_vector(12-1 downto 0)
);
end paletas;

architecture behavioral of paletas is

signal dir_int_img : natural range 0 to 2**6-1;
type img is array (natural range<>) of std_logic_vector(12-1 downto 0);
constant title : img := (
    "010001000100", 
    "000000000101", 
    "000000000111", 
    "000000000111", 
    "001100000100", 
    "010100000000", 
    "010100000000", 
    "010000000000", 
    "000100000000", 
    "000000010000", 
    "000000010000", 
    "000000010000", 
    "000000010010", 
    "000000000000", 
    "000000000000", 
    "000000000000", 
    "100110011001", 
    "000001001011", 
    "000000111110", 
    "010100011101", 
    "100100001010", 
    "110000000101", 
    "110000000000", 
    "101000100000", 
    "010100110000", 
    "000001010000", 
    "000001100000", 
    "000001100001", 
    "000001010110", 
    "000000000000", 
    "000000000000", 
    "000000000000", 
    "111111111111", 
    "000110011111", 
    "010101111111", 
    "100101101111", 
    "111101101111", 
    "111101101011", 
    "111101110110", 
    "111110000001", 
    "110010010000", 
    "011110110000", 
    "001011000010", 
    "000011000111", 
    "000010111101", 
    "001000100010", 
    "000000000000", 
    "000000000000", 
    "111111111111", 
    "100111011111", 
    "101011001111", 
    "110110111111", 
    "111110111111", 
    "111111001110", 
    "111111001011", 
    "111111001001", 
    "111011011000", 
    "110011011000", 
    "101011101010", 
    "100111101100", 
    "100111101110",
    "101010101010",
    "000000000000",
    "000000000000" 
);

begin

dir_int_img <= to_integer(unsigned(dir_paletas));
dato_paletas <= title(dir_int_img);

end behavioral;