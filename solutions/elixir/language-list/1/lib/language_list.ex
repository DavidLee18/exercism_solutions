defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_ | list2] = list
    list2
  end

  def first(list) do
    [a | _] = list
    a
  end

  def count(list) do
    cond do
      list == [] -> 0
      true -> 1 + count(remove(list))
    end
  end

  def functional_list?(list) do
    if list == [] do
      false
    else
      [a | l] = list
      if a == "Elixir" do
        true
      else
        functional_list?(l)
      end
    end
  end
end
