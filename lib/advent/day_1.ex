defmodule Advent.Day1 do
  def run(measurements) do
    {_, increases} = measurements
    |> Enum.reduce({nil, []}, fn measurement, {previous, increases} ->
      case previous do
        nil -> {measurement, increases}
        p when p < measurement -> {measurement, [measurement | increases]}
        _ -> {measurement, increases}
      end
    end)

    Enum.count(increases)
  end

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
