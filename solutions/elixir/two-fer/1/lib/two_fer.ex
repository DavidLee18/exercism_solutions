defmodule TwoFer do
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") do
    cond do
      is_number(name) || is_atom(name) || is_list(name) -> raise FunctionClauseError
      is_nil(name) -> "One for you, one for me."
      true -> "One for " <> name <> ", one for me."
    end
  end
end
