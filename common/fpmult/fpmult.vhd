

library ieee;
use ieee.std_logic_1164.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity fpmult is
	port (
			clk 	: in std_logic ;
			rst : in std_logic;
			en : in std_logic;
			a 	: in std_logic_vector (31 downto 0);
			b 	: in std_logic_vector (31 downto 0);
			ovf 	: out std_logic ;
			udf 	: out std_logic ;
			zero 	: out std_logic ;
			nan 	: out std_logic ;
			res 	: out std_logic_vector (31 downto 0)
	);
end fpmult;


architecture behavioral of fpmult is


   	component alt_fpmult
	port (
         aclr		: in std_logic ;
			clk_en   : in std_logic;
			clock	: in std_logic ;
			dataa	: in std_logic_vector (31 downto 0);
			datab	: in std_logic_vector (31 downto 0);
			overflow	: out std_logic ;
			underflow	: out std_logic ;
			zero	: out std_logic ;
			nan	: out std_logic ;
			result	: out std_logic_vector (31 downto 0)
	);
	end component; 
    
begin
alt_fpmult_inst : alt_fpmult port map (
      aclr	 => rst,
		clk_en	 => en,
		clock	 => clk ,
		dataa	 => a ,
		datab	 => b ,
		overflow	 => ovf ,
		underflow	 => udf ,
		zero	 => zero,
		nan	 => nan ,
		result	 => res 

	);



end behavioral;
