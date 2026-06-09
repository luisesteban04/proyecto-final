library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_ALU is
end entity TB_ALU;

architecture behavioral of TB_ALU is

    component ALU
        port (
            A       : in  std_logic_vector(7 downto 0);
            B       : in  std_logic_vector(7 downto 0);
            ALU_Sel : in  std_logic_vector(2 downto 0);
            Result  : out std_logic_vector(7 downto 0);
            NZVC    : out std_logic_vector(3 downto 0)
        );
    end component;

    signal A       : std_logic_vector(7 downto 0) := (others => '0');
    signal B       : std_logic_vector(7 downto 0) := (others => '0');
    signal ALU_Sel : std_logic_vector(2 downto 0) := (others => '0');
    signal Result  : std_logic_vector(7 downto 0);
    signal NZVC    : std_logic_vector(3 downto 0);

begin

    DUT : ALU
        port map (
            A       => A,
            B       => B,
            ALU_Sel => ALU_Sel,
            Result  => Result,
            NZVC    => NZVC
        );

    STIMULUS : process
    begin

        ALU_Sel <= "000";

        A <= x"15";
        B <= x"0B";
        wait for 20 ns;

        A <= x"00";
        B <= x"00";
        wait for 20 ns;

        A <= x"09";
        B <= x"F1";
        wait for 20 ns;

        A <= x"64";
        B <= x"28";
        wait for 20 ns;

        A <= x"B4";
        B <= x"5A";
        wait for 20 ns;

        A <= x"C0";
        B <= x"40";
        wait for 20 ns;

        ALU_Sel <= "001";

        A <= x"19";
        B <= x"09";
        wait for 20 ns;

        A <= x"21";
        B <= x"21";
        wait for 20 ns;

        A <= x"04";
        B <= x"0C";
        wait for 20 ns;

        A <= x"80";
        B <= x"06";
        wait for 20 ns;

        A <= x"7D";
        B <= x"F8";
        wait for 20 ns;

        ALU_Sel <= "111";
        A <= x"37";
        B <= x"D8";
        wait for 20 ns;

        wait;

    end process STIMULUS;

end architecture behavioral;