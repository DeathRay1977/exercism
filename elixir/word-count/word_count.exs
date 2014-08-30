defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence |> String.downcase |> remove_unwanted_chars |> remove_extra_whitespace |> make_list |> _count(%{})
  end

  defp _count( [], map ), do: map

  defp _count( [head | tail], map ), do: _count(tail, Map.update(map, head, 1, fn(val) -> val+1 end))

  defp remove_unwanted_chars(sentence) do
    sentence |> String.replace(~r/[!@$%^&:,]/,"")
  end

  defp remove_extra_whitespace(sentence) do
    sentence |> String.replace(~r/\s+/, " ")
  end

  defp make_list(sentence) do
    sentence |> String.split(~r/[\s_]/)
  end
end
