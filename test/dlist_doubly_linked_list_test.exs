defmodule DlistDoublyLinkedListTest do
  use ExUnit.Case, async: true
  alias Dlist.DoublyLinkedList, as: DLL

  # `setup` is called before each test is run
  setup do
    {:ok, dll} = DLL.new

    on_exit fn ->
      if (Process.alive?(dll)) do
        DLL.destroy(dll)
      end
    end

    # Returns extra metadata, it must be a dict
    {:ok, %{dll: dll}}
  end

  test "new returns something", %{dll: dll} do
    assert dll != nil
  end

  test "can prepend items", %{dll: dll} do
    DLL.prepend(dll, 3)
    DLL.prepend(dll, 2)
    DLL.prepend(dll, 1)
    assert DLL.to_list(dll) == [1,2,3]
  end

  test "can append items", %{dll: dll} do
    DLL.append(dll, 1)
    DLL.append(dll, 2)
    DLL.append(dll, 3)
    assert DLL.to_list(dll) == [1,2,3]
  end

  test "can get first item", %{dll: dll} do
    DLL.append(dll, 1)
    DLL.append(dll, 2)
    DLL.append(dll, 3)
    assert DLL.first(dll) == 1
  end

  test "can get last item", %{dll: dll} do
    DLL.append(dll, 1)
    DLL.append(dll, 2)
    DLL.append(dll, 3)
    assert DLL.last(dll) == 3
  end

  test "can get list of items", %{dll: dll} do
    DLL.append(dll, 4)
    DLL.append(dll, 5)
    DLL.prepend(dll, 3)
    DLL.prepend(dll, 2)
    DLL.prepend(dll, 1)
    assert DLL.to_list(dll) == [1,2,3,4,5]
  end

  test "can destroy list and children" do
    {:ok, dll} = DLL.new
    assert Process.alive?(dll) == true
    orig_proc_count = length(Process.list)

    DLL.append(dll, 4)
    # :timer.sleep(100)
    new_proc_count = length(Process.list)
    assert new_proc_count == orig_proc_count + 1

    DLL.append(dll, 5)
    # :timer.sleep(100)
    new_proc_count = length(Process.list)
    assert new_proc_count == orig_proc_count + 2

    DLL.destroy(dll)
    # :timer.sleep(100)
    new_proc_count = length(Process.list)
    assert Process.alive?(dll) != true
    assert new_proc_count == orig_proc_count - 1 # minus 1 because the list proc is closed as well
  end

end