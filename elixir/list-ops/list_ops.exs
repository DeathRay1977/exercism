defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(list), do: _reverse(list, [])
  defp _reverse([], reverselist), do: reverselist
  defp _reverse([head | tail], reverselist), do: _reverse(tail, [head|reverselist])

  @spec map(list, (any -> any)) :: list
  def map([], _func), do: []
  def map([head | tail ], func), do: [func.(head) | map(tail, func)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _func), do: []
  def filter( [head | tail], func ) do
    if func.(head) == true do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  @type value :: any
  @spec reduce(list, value, ((any, value) -> value)) :: value
  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  @spec append(list, list) :: list
  def append(a, b), do: _append(reverse(a), b)
  defp _append(a, []), do: reverse(a)
  defp _append([], b), do: b
  defp _append(a, [head | tail]), do: _append([head | a], tail)

  @spec concat([[any]]) :: [any]
  def concat(list), do: _concat(list, [])
  defp _concat([], result), do: result
  defp _concat([head | tail], result), do: _concat(tail, append(result, head))

end
