----------------------------------------------------------------------------------
--                         		   OAM      	  		                        --
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library WORK;
use WORK.VGA_PKG.ALL;

entity OAM is
	port (
	--Puertos de entrada
	clk      : in std_logic;
	dir_OAM  : in std_logic_vector(8-1 downto 0);
 	--Puertos de salida
	dato_OAM : out std_logic_vector(8-1 downto 0)
);
end OAM;

architecture behavioral of OAM is

signal dir_int_img : natural range 0 to 2**8-1;
type img is array (natural range<>) of std_logic_vector(8-1 downto 0);
constant title : img := (
	"00010110",
	"00000000",
	"00000000",
	"00001000",
	"00010110",
	"00000001",
	"00000000",
	"00001001",
	"00010111",
	"00000010",
	"00000000",
	"00001000",
	"00010111",
	"00000011",
	"00000000",
	"00001001",
	"00011000",
	"00000100",
	"00000000",
	"00001000",
	"00011000",
	"00000101",
	"00000000",
	"00001001",
	"00011001",
	"00000110",
	"00000000",
	"00001000",
	"00011001",
	"00000111",
	"00000000",
	"00001001",
	"00010000",
	"01110000",
	"00000001",
	"00010110",
	"00010000",
	"01110001",
	"00000001",
	"00010111",
	"00010001",
	"01110010",
	"00000001",
	"00010110",
	"00010001",
	"01110011",
	"00000001",
	"00010111",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000",
	"00000000",
	"00000000",
	"00100000",
	"00000000"
);

begin

dir_int_img <= to_integer(unsigned(dir_OAM));

P_img: process (clk)
begin
	if clk'event and clk='1' then
		dato_OAM <= title(dir_int_img);
	end if;
end process;

end behavioral;