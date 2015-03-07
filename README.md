Dlist
=====

An elixir library containing two Deque implementations.

## Dlist.Deque

This implementation is a two list solution. Like all things in elixir, it is immutable.

This supports fast inserts done in constant time. The `first` and `last` operations are worst case O(n). `to_list` is also O(n) worst case.

```elixir
alias Dlist.Deque

deque = Deque.new
deque = Deque.append(deque, 2)
deque = Deque.append(deque, 3)
deque = Deque.prepend(deque, 1)
deque = Deque.prepend(deque, 0)
IO.puts inspect Deque.to_list(deque)
# ==> [0, 1, 2, 3]
```

## Dlist.DoublyLinkedList

This implementation uses a gen_server and therefore is mutable. This is similar to your standard doubly linked list in imperative languages.

It supports fast inserts in constant time. `first` and `last` operations are also done in constant time. `to_list`, is always O(n).

**Be sure to destory the list when you're finished using it.**

```elixir
alias Dlist.DoublyLinkedList, as: DLL

{:ok, dll} = DLL.new
DLL.append(dll, 2)
DLL.append(dll, 3)
DLL.prepend(dll, 1)
DLL.prepend(dll, 0)
IO.puts inspect DLL.to_list(dll)
# ==> [0, 1, 2, 3]

DLL.destroy(dll)
```