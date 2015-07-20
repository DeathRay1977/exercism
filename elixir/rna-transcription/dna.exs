defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    to_rna(dna, '')
  end

  defp to_rna('', result) do
    Enum.reverse result
  end

  defp to_rna([h | t], result) do
    cond do
      h == ?A -> to_rna(t, [ ?U | result])
      h == ?C -> to_rna(t, [ ?G | result])
      h == ?T -> to_rna(t, [ ?A | result])
      h == ?G -> to_rna(t, [ ?C | result])
      true    -> raise ArgumentError
    end
  end
end
