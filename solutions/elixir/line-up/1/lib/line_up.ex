defmodule LineUp do
  @doc """
  Formats a full ticket sentence for the given name and number, including
  the person's name, the ordinal form of the number, and fixed descriptive text.
  """
  @spec format(name :: String.t(), number :: pos_integer()) :: String.t()
  def format(name, number) do
    cond do
      rem(number, 10) == 1 && rem(number, 100) != 11 -> "#{name}, you are the #{number}st customer we serve today. Thank you!"
      rem(number, 10) == 2 && rem(number, 100) != 12 -> "#{name}, you are the #{number}nd customer we serve today. Thank you!"
      rem(number, 10) == 3 && rem(number, 100) != 13 -> "#{name}, you are the #{number}rd customer we serve today. Thank you!"
      true -> "#{name}, you are the #{number}th customer we serve today. Thank you!"
    end
  end
end
