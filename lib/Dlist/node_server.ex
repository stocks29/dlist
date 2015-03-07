defmodule Dlist.NodeServer do
  alias Dlist.Node
  use GenServer

  ## Client API

  def start_link(args, opts \\ []) do
    GenServer.start_link(__MODULE__, args, opts)
  end

  def data(server) do 
    GenServer.call(server, :data)
  end

  def left(server) do 
    GenServer.call(server, :left)
  end

  def right(server) do 
    GenServer.call(server, :right)
  end


  def left(server, left) do
    GenServer.cast(server, {:left, left})
  end

  def right(server, right) do
    GenServer.cast(server, {:right, right})
  end

  def stop(server) do
    GenServer.cast(server, :stop)
  end


  ## Server Callbacks

  def init([data]) do
    {:ok, Node.new(data)}
  end

  def handle_call(:data, _from, node) do
    {:reply, node.data, node}
  end

  def handle_call(:left, _from, node) do
    {:reply, node.left, node}
  end

  def handle_call(:right, _from, node) do
    {:reply, node.right, node}
  end

  def handle_cast({:left, new_left}, node) do
    {:noreply, Node.left(node, new_left)}
  end

  def handle_cast({:right, new_right}, node) do
    {:noreply, Node.right(node, new_right)}
  end

  def handle_cast(:stop, node) do
    {:stop, :normal, node}
  end
end