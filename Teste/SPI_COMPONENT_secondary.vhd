
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPI_COMPONENT_secondary is
    Port (
        CLK             : in  std_logic;
        RST             : in  std_logic;
        -- SPI MASTER INTERFACE
 --       M_SCLK          : out std_logic;
   --     M_CS_N          : out std_logic;
  --      M_MOSI          : out std_logic;
   --     M_MISO          : in  std_logic;
        -- SPI SLAVE INTERFACE
        S_SCLK          : in  std_logic;
        S_CS_N          : in  std_logic;
        S_MOSI          : in  std_logic;
        S_MISO          : out std_logic;
        -- USER INTERFACE
        BTN_MENU_MODE   : in  std_logic;
        BTN_MENU_ACTION : in  std_logic;
	     key_s_data      : in std_logic_vector(3 downto 0);
        SSEG            : out std_logic_vector(6 downto 0)
    );
end entity;

architecture RTL of SPI_COMPONENT_secondary is

    signal reset           : std_logic;
    signal clk_en_1k       : std_logic;

    signal menu_mode_en    : std_logic;
    signal menu_action_en  : std_logic;

    signal menu_cnt        : unsigned(1 downto 0);
    signal menu_mode_led   : std_logic_vector(3 downto 0);
    signal m_cnt           : unsigned(3 downto 0);
    signal s_cnt           : unsigned(3 downto 0);
    signal m_cnt_en        : std_logic;
    signal s_cnt_en        : std_logic;

    signal m_din           : std_logic_vector(7 downto 0);
    signal s_din           : std_logic_vector(7 downto 0):= "00000010";
    signal m_din_vld       : std_logic;
    signal s_din_vld       : std_logic;
    signal m_dout          : std_logic_vector(7 downto 0);
    signal s_dout          : std_logic_vector(7 downto 0);
    signal m_dout_vld      : std_logic;
    signal s_dout_vld      : std_logic;
    signal m_dout_reg      : std_logic_vector(3 downto 0);
    signal s_dout_reg      : std_logic_vector(3 downto 0);

begin
    -- -------------------------------------------------------------------------
    --  RESET SYNCHRONIZER
    -- -------------------------------------------------------------------------

    reset_sync_i : entity work.RST_SYNC
    port map (
        CLK        => CLK,
        ASYNC_RST  => RST,
        SYNCED_RST => reset
    );
    -- -------------------------------------------------------------------------
    --  CLOCK ENABLE GENERATOR
    -- -------------------------------------------------------------------------

    clk_en_gen_i : entity work.CLK_EN_GEN
    generic map (
        CLK_FREQ => 50e6
    )
    port map (
        CLK       => CLK,
        ASYNC_RST => reset,
        CLK_EN_1K => clk_en_1k
    );
	 
	 	 
    ----------------------------------------------------------------------------	 
	    btn1_debounce_i : entity work.BTN_DEBOUNCE
    port map (
        CLK        => CLK,
        ASYNC_RST  => reset,
        SAMPLE_EN  => clk_en_1k,
        BTN_RAW    => BTN_MENU_MODE,
        BTN_DEB    => open,
        BTN_DEB_RE => menu_mode_en
    ); 

    btn2_debounce_i : entity work.BTN_DEBOUNCE
    port map (
        CLK        => CLK,
        ASYNC_RST  => reset,
        SAMPLE_EN  => clk_en_1k,
        BTN_RAW    => BTN_MENU_ACTION,
        BTN_DEB    => open,
        BTN_DEB_RE => menu_action_en
    );

    -- -------------------------------------------------------------------------
    --  MENU MODE COUNTER


    process(menu_mode_en,menu_action_en)
    begin
        case menu_mode_en is
            when '1' =>
                s_din_vld <= menu_action_en;
            when others =>
                s_din_vld <= '0';
        end case;
    end process;
    -- -------------------------------------------------------------------------
    --  SPI MASTER AND SLAVE entities//only slave
    -- -------------------------------------------------------------------------


    slave_i : entity work.SPI_SLAVE
    port map (
        CLK      => CLK,
        RST      => reset,
        -- SPI MASTER INTERFACE
        SCLK     => S_SCLK,
        CS_N     => S_CS_N,
        MOSI     => S_MOSI,
        MISO     => S_MISO,
        -- USER INTERFACE
        DIN      => s_din,
        DIN_VLD  => '1',
        DIN_RDY  => open,
        DOUT     => s_dout,
        DOUT_VLD => s_dout_vld
    );

    s_dout_reg_p : process (CLK, reset)
    begin
        if (reset = '1') then
            s_dout_reg <= (others => '0');
        elsif (rising_edge(CLK)) then
            if (s_dout_vld = '1') then
                s_dout_reg <= s_dout(3 downto 0);
            end if;
        end if;
    end process;
	


    sseg_driver_i : entity work.SSEG_DRIVER
    port map (
        CLK       => CLK,
        CLK_EN_1K => clk_en_1k,
        ASYNC_RST => reset,
        DATA0     => s_dout(3 downto 0),
        SSEG      => SSEG
    );	
end architecture;	 