defmodule MultiDict do
  def new, do: Map.new

  def add(dict, key, value) do
    Map.update(
      dict,
      key,
      [value],
      &[value | &1] 
    )
  end

  def get(dict, key) do
    Map.get(dict, key, [])
  end

end
# => [33mwarning: [0mredefining module MultiDict (current version loaded from Elixir.MultiDict.beam)
# =>   nofile:1
# => [33mwarning: [0mHashDict.new/0 is deprecated, use maps and the Map module instead
# =>   nofile:2
# => [33mwarning: [0mHashDict.update/4 is deprecated, use maps and the Map module instead
# =>   nofile:5
# => [33mwarning: [0mHashDict.get/3 is deprecated, use maps and the Map module instead
# =>   nofile:14
# => [31m
# => 13:09:38.090 [error] Module 'Elixir.MultiDict' must be purged before deleting
# => [0m{:module, MultiDict,
# =>  <<70, 79, 82, 49, 0, 0, 5, 72, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 131,
# =>    0, 0, 0, 13, 16, 69, 108, 105, 120, 105, 114, 46, 77, 117, 108, 116, 105, 68,
# =>    105, 99, 116, 8, 95, 95, 105, 110, 102, ...>>, {:get, 2}}
