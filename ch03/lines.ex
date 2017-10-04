defmodule Lines do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lenghts!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.map(&(String.length(&1)))
  end

  defp high_number(list) do
    do_high(0, list)
  end

  defp do_high(nm, []) do
    nm
  end
  defp do_high(nm, [head | tail]) do
    if head >= nm do
      do_high(head, tail)
    else
      do_high(nm, tail)
    end
  end

  def longest_line!(path) do
    hn =
      lines_lenghts!(path)
      |> high_number
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) == hn))
  end

  def words_per_line(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.split(&1))
    |> Enum.map(&length(&1))
  end

end
