defmodule Dlist.DlistServer do
  use GenServer
  alias Dlist.NodeServer, as: NS

  ## Client API

  def start_link(args, opts \\ []) do
    GenServer.start_link(__MODULE__, args, opts)
  end

  def append(server, data) do
    GenServer.call(server, {:append, data})
  end

  def prepend(server, data) do
    GenServer.call(server, {:prepend, data})
  end

  def first(server) do
    GenServer.call(server, :first)
  end

  def last(server) do
    GenServer.call(server, :last)
  end

  def to_list(server) do
    GenServer.call(server, :to_list)
  end

  def stop(server) do
    GenServer.call(server, :stop)
  end


  ## Server API

  def init([]) do
    {:ok, {nil, nil}}
  end

  def handle_call({:append, data}, _from, {nil, nil}) do
    {:ok, node} = NS.start_link([data])
    {:reply, :ok, {node, node}}
  end
  def handle_call({:append, data}, _from, {first, last}) do
    {:ok, node} = NS.start_link([data])
    NS.right(last, node)
    NS.left(node, last)
    {:reply, :ok, {first, node}}
  end

  def handle_call({:prepend, data}, _from, {nil, nil}) do
    {:ok, node} = NS.start_link([data])
    {:reply, :ok, {node, node}}
  end
  def handle_call({:prepend, data}, _from, {first, last}) do
    {:ok, node} = NS.start_link([data])
    NS.left(first, node)
    NS.right(node, first)
    {:reply, :ok, {node, last}}
  end

  def handle_call(:stop, _from, {first, _}) do
    _stop_children(first)
    {:stop, :normal, :ok, {nil, nil}}
  end

  def handle_call(:to_list, _from, {_, last} = state) do
    # Traverse from end to start so we don't have to reverse the list
    {:reply, _to_list(last, []), state}
  end

  def handle_call(:first, _from, {nil, _} = state) do
    {:reply, nil, state}
  end
  def handle_call(:first, _from, {first, _} = state) do
    {:reply, NS.data(first), state}
  end

  def handle_call(:last, _from, {_, nil} = state) do
    {:reply, nil, state}
  end
  def handle_call(:last, _from, {_, last} = state) do
    {:reply, NS.data(last), state}
  end
  
  defp _to_list(nil, acc), do: acc
  defp _to_list(item, acc) do
    _to_list(NS.left(item), [NS.data(item)|acc])
  end

  defp _stop_children(nil), do: :ok
  defp _stop_children(node) do
    right = NS.right(node)
    NS.stop(node)
    _stop_children(right)
  end
end
