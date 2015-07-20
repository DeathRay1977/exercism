defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    cond do
      Enum.count(strand1) != Enum.count(strand2) -> nil
      true -> hamming_distance(strand1, strand2, 0)
    end
  end

  defp hamming_distance('', '', result) do
    result
  end

  defp hamming_distance([h1 | t1], [h2 | t2], result) do
    cond do
      h1 == h2 -> hamming_distance(t1, t2, result)
      true     -> hamming_distance(t1, t2, result + 1)
    end
  end
end
