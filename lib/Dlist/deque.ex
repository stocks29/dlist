defmodule Dlist.Deque do
  defstruct first: [], last: []

  @doc """
  Construct a dlist from an existing list
  """
  def new(list) when is_list(list), do: %Dlist.Deque{first: list}

  @doc """
  Construct a empty dlist
  """
  def new(), do: %Dlist.Deque{} 

  @doc """
  Add an element to the beginning of the list
  """
  def prepend(%Dlist.Deque{first: first} = dlist, item) do
    %{dlist | first: [item|first]}
  end

  @doc """
  Add an element to the end of the list
  """
  def append(%Dlist.Deque{last: last} = dlist, item) do
    %{dlist | last: [item|last]}
  end

  @doc """
  Returns the first element in the deque or nil if the list is empty
  """
  def first(%Dlist.Deque{first: [], last: []}), do: nil
  def first(%Dlist.Deque{first: [], last: last}), do: List.last(last)
  def first(%Dlist.Deque{first: [head|_]}), do: head

  @doc """
  Returns the last element in the deque or nil if the list is empty
  """
  def last(%Dlist.Deque{first: [], last: []}), do: nil
  def last(%Dlist.Deque{first: first, last: []}), do: List.last(first)
  def last(%Dlist.Deque{last: [head|_]}), do: head

  @doc """
  Convert the Dlist.Deque into a List
  """
  def to_list(%Dlist.Deque{first: first, last: last}), do: Enum.concat(first, Enum.reverse(last))

end
