library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tt_um_top is
    port (
        ui_in1   : in  std_logic_vector(7 downto 0);
        ui_in2   : in  std_logic_vector(7 downto 0);
        ui_in3   : in  std_logic_vector(7 downto 0);
        
        uo_out1  : out std_logic_vector(7 downto 0);
        uo_out2  : out std_logic_vector(7 downto 0);
        uo_out3  : out std_logic_vector(7 downto 0);
        uo_out4  : out std_logic_vector(7 downto 0);


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

begin

    uo_out1(7 downto 4) <= "0000";
    uo_out2(7 downto 6) <= "00";
     U1 : boot_loader  
         generic map( RAM_ADR_WIDTH => 6;
            RAM_SIZE => 64);
         port map (rst => not(rst_n),
        clk => clk,
        ce => ena,
        rx => ui_in1(0),
        scan_memory => ui_in1(1);
        ram_out(7 downto 0) => ui_in2, 
        ram_out(15 downto 8) => ui_in3,
                   
        ram_rw => uo_out1(0),
        ram_enable => uo_out1(1),
        ram_adr => uo_out2(5 downto 0),
        ram_in(7 downto 0) => uo_out3,
        ram_in(15 downto 8) => uo_out4,
        tx => uo_out1(2),
        boot => uo_out1(3));


end Behavioral;
