library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tt_um_top is
    port (
        ui_in   : in  std_logic_vector(7 downto 0);
        uo_out  : out std_logic_vector(7 downto 0);
        uio_in  : in  std_logic_vector(7 downto 0);
        uio_out : out std_logic_vector(7 downto 0);
        uio_oe  : out std_logic_vector(7 downto 0);
        ena     : in  std_logic;
        clk     : in  std_logic;
        rst_n   : in  std_logic
    );
end tt_um_top;

architecture Behavioral of tt_um_top is

 component compteur port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           cmpt : out STD_LOGIC_VECTOR (7 downto 0));
 end component ;

begin

   -- uo_out <= std_logic_vector(unsigned(ui_in) + unsigned(uio_in));
    uio_out <= "00000000";
    uio_oe <= "00000000";
    
     U1 : compteur  port map (
                            clk => clk,
                            rst => not(rst_n),
                            cmpt =>   uo_out
                        );


end Behavioral;
