defmodule Dlist.Node do
  defstruct left: nil, right: nil, data: nil

  def new, do: %Dlist.Node{}
  def new(data), do: %Dlist.Node{data: data}
  def new(data, left, right), do: %Dlist.Node{data: data, left: left, right: right}

  def left(node, left), do: %{node | left: left}
  def right(node, right), do: %{node | right: right}

end