if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("list_ops.exs")
end

ExUnit.start

defmodule ListOpsTest do
  alias ListOps, as: L

  use ExUnit.Case, async: true

  defp odd?(n), do: rem(n, 2) == 1

  test "count of empty list" do
    IO.puts "1. count of empty list"
    assert L.count([]) == 0
  end

  test "count of normal list" do
    IO.puts "2. count of normal list"
    assert L.count([1,3,5,7]) == 4
  end

  test "count of huge list" do
    IO.puts "3. count of huge list"
    assert L.count(Enum.to_list(1..1_000_000)) == 1_000_000
  end

  test "reverse of empty list" do
    IO.puts "4. reverse of empty list"
    assert L.reverse([]) == []
  end

  test "reverse of normal list" do
    IO.puts "5. reverse of normal list"
    assert L.reverse([1,3,5,7]) == [7,5,3,1]
  end

  test "reverse of huge list" do
    IO.puts "6. reverse of huge list"
    assert L.reverse(Enum.to_list(1..1_000_000)) == Enum.to_list(1_000_000..1)
  end

  test "map of empty list" do
    IO.puts "7. map of empty list"
    assert L.map([], &(&1+1)) == []
  end

  test "map of normal list" do
    IO.puts "8. map of normal list"
    assert L.map([1,3,5,7], &(&1+1)) == [2,4,6,8]
  end

  test "map of huge list" do
    IO.puts "9. map of huge list"
    assert L.map(Enum.to_list(1..1_000_000), &(&1+1)) ==
      Enum.to_list(2..1_000_001)
  end

  test "filter of empty list" do
    IO.puts "10. filter of empty list"
    assert L.filter([], &odd?/1) == []
  end

  test "filter of normal list" do
    IO.puts "11. filter of normal list"
    assert L.filter([1,2,3,4], &odd?/1) == [1,3]
  end

  test "filter of huge list" do
    IO.puts "12. filter of huge list"
    assert L.filter(Enum.to_list(1..1_000_000), &odd?/1) ==
      Enum.map(1..500_000, &(&1*2-1))
  end

  test "reduce of empty list" do
    IO.puts "13. reduce of empty list"
    assert L.reduce([], 0, &(&1+&2)) == 0
  end

  test "reduce of normal list" do
    IO.puts "14. reduce of normal list"
    assert L.reduce([1,2,3,4], -3, &(&1+&2)) == 7
  end

  test "reduce of huge list" do
    IO.puts "15. reduce of huge list"
    assert L.reduce(Enum.to_list(1..1_000_000), 0, &(&1+&2)) ==
      Enum.reduce(1..1_000_000, 0, &(&1+&2))
  end

  test "reduce with non-commutative function" do
    IO.puts "16. reduce with non-commutative function"
    assert L.reduce([1,2,3,4], 10, fn x, acc -> acc - x end) == 0
  end

  test "append of empty lists" do
    IO.puts "17. append of empty lists"
    assert L.append([], []) == []
  end

  test "append of empty and non-empty list" do
    IO.puts "18. append of non-empty lists"
    assert L.append([], [1,2,3,4]) == [1,2,3,4]
  end

  test "append of non-empty and empty list" do
    IO.puts "19. append of non-empty and empty lists"
    assert L.append([1,2,3,4], []) == [1,2,3,4]
  end

  test "append of non-empty lists" do
    IO.puts "20. append of non-empty lists"
    assert L.append([1,2,3], [4,5]) == [1,2,3,4,5]
  end

  test "append of huge lists" do
    IO.puts "21. append of huge list"
    assert L.append(Enum.to_list(1..1_000_000), Enum.to_list(1_000_001..2_000_000)) ==
      Enum.to_list(1..2_000_000)
  end

  test "concat of empty list of lists" do
    IO.puts "22. concat of empty list of lists"
    assert L.concat([]) == []
  end

  test "concat of normal list of lists" do
    IO.puts "23. concat of normal list of lists"
    assert L.concat([[1,2],[3],[],[4,5,6]]) == [1,2,3,4,5,6]
  end

  test "concat of huge list of small lists" do
    IO.puts "24. concat of huge list of small lists"
    assert L.concat(Enum.map(1..1_000_000, &[&1])) ==
      Enum.to_list(1..1_000_000)
  end

  test "concat of small list of huge lists" do
    IO.puts "25. append of huge list"
    assert L.concat(Enum.map(0..9, &Enum.to_list((&1*100_000+1)..((&1+1)*100_000)))) ==
      Enum.to_list(1..1_000_000)
  end
end
