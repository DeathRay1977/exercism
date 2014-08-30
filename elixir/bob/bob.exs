defmodule Teenager do
  def hey(sentence) do
    cond do
      sentence |> isSilence? -> "Fine. Be that way!"
      sentence |> isQuestion? -> "Sure."
      sentence |> isRussian? -> "Woah, chill out!"
      sentence |> isNormalConversation? -> "Whatever."
      sentence |> isShouting? -> "Woah, chill out!"
      true -> "Whatever."
    end
  end
  defp isSilence?(sentence) do
    sentence |> String.strip |> String.length == 0
  end

  defp isQuestion?(sentence) do
    sentence |> String.ends_with? "?"
  end

  defp isRussian?(sentence) do
    sentence |> String.match? ~r/^[А-Яа-я]+?$/
  end

  defp isNormalConversation?(sentence) do
    sentence |> String.match? ~r/^[[:digit:][:blank:][:punct:]]+?$/
  end

  defp isShouting?(sentence) do
    sentence |> String.match? ~r/^[[:upper:][:digit:][:blank:][:punct:]]+?$/
  end
end
