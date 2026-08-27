defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    cond do
      div(number, 2) == 0 -> rem(number, 2)
      true -> rem(number, 2) + egg_count(div(number, 2))
    end
  end
end
