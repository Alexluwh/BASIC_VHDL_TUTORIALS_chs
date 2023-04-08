entity T09_SensitivityListTb is
end entity;

architecture sim of T09_SensitivityListTb is

  signal CountUp   : integer := 0;
  signal CountDown : integer := 10;

begin

  process is
  begin

    CountUp   <= CountUp + 1;
    CountDown <= CountDown - 1;
    wait for 10 ns;

  end process;

  -- Process triggered using Wait On
  -- 使用 Wait On 触发的进程
  process is
  begin

    if CountUp = CountDown then
      report "Process A: Jackpot!";
    end if;

    wait on CountUp, CountDown;

  end process;

  -- Equivalent process using a sensitivity list
  -- 使用敏感列表的等效进程
  process (CountUp, CountDown) is
  begin

    if CountUp = CountDown then
      report "Process B: Jackpot!";
    end if;

  end process;

end architecture;