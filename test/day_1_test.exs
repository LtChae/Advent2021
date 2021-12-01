defmodule Day1Test do
  use ExUnit.Case

  test "detects increases in depth" do
    measurements = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]
    assert Advent.Day1.run(measurements) == 7
  end

  test "detects aggregated increases in depth" do
    measurements = [
      199,
      200,
      208,
      210,
      200,
      207,
      240,
      269,
      260,
      263
    ]
    assert Advent.Day1.run_pt_2(measurements) == 5
  end
end
