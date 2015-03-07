defmodule DlistBenchmark do
  alias Dlist.Deque
  alias Dlist.DoublyLinkedList, as: DLL
  
  def deque_append_prepend_to_list do
    deque = Deque.new
    deque = Deque.append(deque, 2)
    deque = Deque.append(deque, 3)
    deque = Deque.prepend(deque, 1)
    deque = Deque.prepend(deque, 0)
    Deque.to_list(deque)
  end

  def dll_append_prepend_to_list do
    {:ok, dll} = DLL.new
    DLL.append(dll, 2)
    DLL.append(dll, 3)
    DLL.prepend(dll, 1)
    DLL.prepend(dll, 0)
    inspect DLL.to_list(dll)
    DLL.destroy(dll)
  end
end

Benchwarmer.benchmark([
  &DlistBenchmark.deque_append_prepend_to_list/0, 
  &DlistBenchmark.dll_append_prepend_to_list/0
  ]);