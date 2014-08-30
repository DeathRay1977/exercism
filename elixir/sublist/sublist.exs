defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([a], [b]), do :unequal
  def compare(a, []), do: :superlist
  def compare([], b), do: :sublist
  def 
end
