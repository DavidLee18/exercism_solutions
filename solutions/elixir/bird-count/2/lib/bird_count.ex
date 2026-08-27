defmodule BirdCount do
  def today([]), do: nil
  def today([head|_]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([h|tail]), do: [h+1|tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([h|t]), do: h == 0 || has_day_without_birds?(t)

  def total([]), do: 0
  def total([h|t]), do: h + total(t)

  def busy_days([]), do: 0
  def busy_days([h|t]) do
    cond do
      h >= 5 -> 1 + busy_days(t)
      true -> busy_days(t)
    end
  end
end
