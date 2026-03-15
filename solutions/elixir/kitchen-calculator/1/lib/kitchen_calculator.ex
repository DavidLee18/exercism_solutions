defmodule KitchenCalculator do
  def get_volume({_, n} = _) do
    n
  end

  def to_milliliter({:milliliter, vol} = _), do: {:milliliter, vol}

  def to_milliliter({:cup, vol} = _), do: {:milliliter, vol * 240}

  def to_milliliter({:fluid_ounce, vol} = _), do: {:milliliter, vol * 30}

  def to_milliliter({:teaspoon, vol} = _), do: {:milliliter, vol * 5}

  def to_milliliter({:tablespoon, vol} = _), do: {:milliliter, vol * 15}

  def from_milliliter({:milliliter, vol} = _, :cup = unit), do: {:cup, vol / 240}

  def from_milliliter({:milliliter, vol} = _, :fluid_ounce = unit), do: {:fluid_ounce, vol / 30}

  def from_milliliter({:milliliter, vol} = _, :teaspoon = unit), do: {:teaspoon, vol / 5}

  def from_milliliter({:milliliter, vol} = _, :tablespoon = unit), do: {:tablespoon, vol / 15}

  def from_milliliter({:milliliter, vol} = _, :milliliter = unit), do: {:milliliter, vol}

  def convert({:milliliter, vol} = volume_pair, unit), do: from_milliliter(volume_pair, unit)

  def convert(volume_pair, :milliliter), do: to_milliliter(volume_pair)

  def convert(volume_pair, unit) do
    pair1 = to_milliliter(volume_pair)
    from_milliliter(pair1, unit)
  end
end
