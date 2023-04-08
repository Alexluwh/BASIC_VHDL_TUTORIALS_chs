entity T07_WaitOnUntilTb is
end entity;

architecture sim of T07_WaitOnUntilTb is

  signal CountUp     : integer := 0;
  signal CountDown   : integer := 10;
  signal Countsteady : integer := 15;
begin

  process is
  begin

    CountUp   <= CountUp + 1;
    CountDown <= CountDown - 1;
    wait for 10 ns;

  end process;

  process is
  begin

    wait on CountUp, CountDown;
    report "CountUp=" & integer'image(CountUp) &
      " CountDown=" & integer'image(CountDown);

  end process;

  process is
  begin

    wait until CountUp = CountDown;
    report "Jackpot!";

  end process;

  process is
  begin

    wait on Countsteady until CountUp = CountDown for 30 ns;
    report "test1";

  end process;

  process is
  begin

    wait on Countsteady until CountUp = CountDown for 50 ns;
    report "test2";

  end process;

  process is
  begin

    wait on CountUp until CountUp = CountDown for 50 ns;
    report "test3";

  end process;

end architecture;