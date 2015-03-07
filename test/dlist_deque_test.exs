defmodule Dlist.DequeTest do
  use ExUnit.Case

  test "empty dlist" do
    assert Dlist.Deque.to_list(Dlist.Deque.new) == []
  end

  test "new from existing list" do
    assert Dlist.Deque.to_list(Dlist.Deque.new([1, 2, 3])) == [1, 2, 3]
  end

  test "append works" do
    assert Dlist.Deque.to_list(new_app_list([1, 2, 3])) == [1, 2, 3]
  end

  test "prepend works" do
    assert Dlist.Deque.to_list(new_pre_list([3, 2, 1])) == [1, 2, 3]
  end

  test "append and preprend work together" do
    dlist = Dlist.Deque.new 
    |> Dlist.Deque.prepend(2)
    |> Dlist.Deque.prepend(1)
    |> Dlist.Deque.append(3)
    assert Dlist.Deque.to_list(dlist) == [1, 2, 3]
  end

  test "first is nil for empty dlist" do
    assert Dlist.Deque.first(Dlist.Deque.new) == nil
  end

  test "can retrieve first after append and preprend" do
    dlist = Dlist.Deque.new
    |> Dlist.Deque.append(3)
    |> Dlist.Deque.append(4)
    |> Dlist.Deque.prepend(2)
    |> Dlist.Deque.prepend(1)
    assert Dlist.Deque.first(dlist) == 1
  end

  test "can retrieve first with empty last list" do
    assert Dlist.Deque.first(new_pre_list([3, 2, 1])) == 1
  end

  test "can retrieve first with empty first list" do
    assert Dlist.Deque.first(new_app_list([1, 2, 3])) == 1
  end

  test "last is nil for empty dlist" do
    assert Dlist.Deque.last(Dlist.Deque.new) == nil
  end

  test "can retrieve last after append and preprend" do
    dlist = Dlist.Deque.new
    |> Dlist.Deque.append(3)
    |> Dlist.Deque.append(4)
    |> Dlist.Deque.prepend(2)
    |> Dlist.Deque.prepend(1)
    assert Dlist.Deque.last(dlist) == 4
  end

  test "can retrieve last with empty first list" do
    assert Dlist.Deque.last(new_app_list([1, 2, 3])) == 3
  end

  test "can retrieve last with empty last list" do
    assert Dlist.Deque.last(new_pre_list([3, 2, 1])) == 3
  end

  test "to_list combines both internal lists" do
    dlist = Dlist.Deque.new
    |> Dlist.Deque.append(3)
    |> Dlist.Deque.append(4)
    |> Dlist.Deque.prepend(2)
    |> Dlist.Deque.prepend(1)
    assert Dlist.Deque.to_list(dlist) == [1, 2, 3, 4]
  end

  defp new_app_list(items) do
    Enum.reduce(items, Dlist.Deque.new, fn item, acc ->
      Dlist.Deque.append(acc, item)
    end)
  end

  defp new_pre_list(items) do
    Enum.reduce(items, Dlist.Deque.new, fn item, acc ->
      Dlist.Deque.prepend(acc, item)
    end)
  end

end
