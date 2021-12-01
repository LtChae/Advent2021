defmodule Advent.Day1 do
  def run(measurements) do
    {_, increases} = Enum.reduce(measurements, {nil, []}, &detect_increase/2)
    Enum.count(increases)
  end

  defp detect_increase(measurement, {nil, increases}), do: {measurement, increases}
  defp detect_increase(measurement, {previous, increases}) when previous < measurement, do: {measurement, [measurement | increases]}
  defp detect_increase(measurement, {_previous, increases}), do: {measurement, increases}

  def run_pt_2(measurements) do
    measurements
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> run
  end

  def get_data(file_path) do
    File.read!(file_path)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
