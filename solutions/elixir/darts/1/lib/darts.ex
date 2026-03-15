defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    dist2 = x*x + y*y
    cond do
      dist2 > 100 -> 0
      dist2 > 25 -> 1
      dist2 > 1 -> 5
      true -> 10
    end
  end
end
