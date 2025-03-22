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

 component boot_loader 
    GENERIC (
            RAM_ADR_WIDTH : INTEGER := 6;
            RAM_SIZE : INTEGER := 64);
    port (  rst : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        rx : IN STD_LOGIC;
        tx : OUT STD_LOGIC;
        boot : OUT STD_LOGIC;
        scan_memory : IN STD_LOGIC;
        ram_out : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        ram_rw : OUT STD_LOGIC;
        ram_enable : OUT STD_LOGIC;
        ram_adr : OUT STD_LOGIC_VECTOR(RAM_ADR_WIDTH - 1 DOWNTO 0);
        ram_in : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
 end component ;

        SIGNAL s_uio_out1,s_uio_out5 : STD_LOGIC_VECTOR(15 DOWNTO 0) ;
        SIGNAL s_uio_out2,s_uio_out3 , s_uio_out6 : STD_LOGIC;
        SIGNAL s_uio_out4: STD_LOGIC_VECTOR(7 DOWNTO 0);




begin

    uo_out(7 downto 1) <= "000000";
     U1 : boot_loader  
         generic map( RAM_ADR_WIDTH => 6,
            RAM_SIZE => 64)
         port map (rst => not(rst_n),
        clk => clk,
        ce => ena,
                   
        rx => ui_in(0),
        scan_memory => ui_in(1),
                   
        ram_out => s_uio_out1,     
        ram_rw => s_uio_out2,
        ram_enable => s_uio_out3,
        ram_adr => s_uio_out4,
        ram_in => s_uio_out5,
        tx => uo_out(0),
        boot => s_uio_out6);


end Behavioral;
