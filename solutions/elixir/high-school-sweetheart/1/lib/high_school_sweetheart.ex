defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  def initial(name) do
    name |> HighSchoolSweetheart.first_letter() |> String.upcase(:ascii) |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name |> String.split() |> List.foldr("", fn x, acc -> if String.length(x) > 0 do
      HighSchoolSweetheart.initial(x) <> " " <> acc
    else
      acc
    end
    |> String.trim_trailing()
  end)
  end

  def pair(full_name1, full_name2) do
    "❤-------------------❤\n" <> "|  #{HighSchoolSweetheart.initials(full_name1)}  +  #{HighSchoolSweetheart.initials(full_name2)}  |\n" <> "❤-------------------❤\n"
  end
end
