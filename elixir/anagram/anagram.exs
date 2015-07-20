defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    try_match(base, candidates, [])
  end

  @spec try_match(String.t, [String.t], [String.t]) :: [String.t]
  defp try_match(_base, candidates, result) when candidates == [] do
    Enum.reverse result
  end

  defp try_match(base, candidates, result) do
    [h | t] = candidates
    if is_match?(h, base) do
      try_match(base, t, [h | result])
    else
      try_match(base, t, result)
    end
  end

  defp sorted_list(s) do
    s |> String.downcase |> String.split( "", trim: true) |> Enum.sort
  end

  defp is_match?(s1, s2) do
    (String.downcase(s1) != String.downcase(s2)) and
    (sorted_list(s1) == sorted_list(s2))
  end
end
