defmodule Dlist.DoublyLinkedList do
  
  def new, do: Dlist.DlistServer.start_link([])

  def prepend(dll, data), do: Dlist.DlistServer.prepend(dll, data)

  def append(dll, data), do: Dlist.DlistServer.append(dll, data)

  def first(dll), do: Dlist.DlistServer.first(dll)
  def last(dll), do: Dlist.DlistServer.last(dll)

  def to_list(dll), do: Dlist.DlistServer.to_list(dll)

  def destroy(dll), do: Dlist.DlistServer.stop(dll)

end