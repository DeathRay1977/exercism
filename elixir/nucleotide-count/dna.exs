defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.
  ## Examples
  iex> DNA.count('AATAA', ?A)
  4
  iex> DNA.count('AATAA', ?T)
  1
  """

  def count(strand, nucleotide) do
    Enum.count strand, fn (x) -> x == nucleotide end
  end


  @doc """
  Returns a summary of counts by nucleotide.
  ## Examples
  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """

  def nucleotide_counts(strand) do
    Enum.map(@nucleotides, fn (x) -> {x, count(strand, x)}end)
    |> Enum.into(%{})
  end
end
