defmodule TodoList do
  defstruct auto_id: 1, entries: Map.new

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList {},
      &add_entry(&2, &1))
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn({_, entry}) ->
      entry.date == date
    end)
    |> Enum.map(fn({_, entry}) ->
      entry
    end)
  end

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todolist,
    entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = Map.put(entries, auto_id, entry)

    %TodoList{todolist |
              entries: new_entries,
              auto_id: auto_id + 1
    }
  end

end

defmodule TodoList.CsvImporter do
  alias TodoList

  def read_csv(file_path)do
    File.stream!(file_path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.split(&1, ["/", ","]))
    |> Enum.map(&format_entrie(&1))
    |> TodoList.new
  end

  defp format_entrie(list) do
      [y, m, d, t] = list
      %{date: {y, m, d}, title: t}
  end

end
