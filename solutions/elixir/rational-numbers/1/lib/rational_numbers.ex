defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, a2}, {b1, b2}), do: reduce({a1 * b2 + b1 * a2, a2 * b2})

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, a2}, {b1, b2}), do: reduce({a1 * b2 - b1 * a2, a2 * b2})

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, a2}, {b1, b2}), do: reduce({a1 * b1, a2 * b2})

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({n1, n2}, {d1, d2}), do: reduce({n1 * d2, n2 * d1})

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}), do: reduce({Kernel.abs(a), Kernel.abs(b)})

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) do
    cond do
      n < 0 -> reduce({Integer.pow(b, -n), Integer.pow(a, -n)})
      true -> reduce({Integer.pow(a, n), Integer.pow(b, n)})
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}), do: Float.pow(x / 1.0, a / b)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) do
    g = Integer.gcd(a, b)
    c = div(a, g)
    d = div(b, g)
    cond do
      d < 0 -> {-c, -d}
      true -> {c, d}
    end
  end
end
