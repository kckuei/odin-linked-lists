# Linked Lists
My OOP implementation of linked lists in `ruby`.

### Background
Linked lists are one of the most basic and fundamental data structures in computer science. The principal benefit of a linked list over a conventional array is that the list elements can easily be inserted or removed without reallocation of any other elements.
* A linked list is a linear collection of data elements called nodes that “point” to the next node by means of a pointer.
* Each node holds a single element of data and a link or pointer to the next node in the list.
* A head node is the first node in the list, a tail node is the last node in the list. Below is a basic representation of a linked list: `[ NODE(head) ] -> [ NODE ] -> [ NODE(tail) ] -> nil`

### Implementation 
**Two classes:**
1. `LinkedList` class, which will represent the full list.
2. `Node` class, containing a `#value` method and a link to the `#next_node`, set both as `nil` by default.

**Methods**
1. `#append(value)` adds a new node containing `value` to the end of the list
2. `#prepend(value)` adds a new node containing `value` to the start of the list
3. `#size` returns the total number of nodes in the list
4. `#head` returns the returns the first node in the list
5. `#tail` returns the last node in the list
6. `#at(index)` returns the node at the given `index`
7. `#pop` removes the last element from the list
8. `#contains?(value)` returns true if the passed in value is in the list and otherwise returns false.
9. `#find(value)` returns the index of the node containing value, or nil if not found.
10. `#to_s` represent LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: `( value ) -> ( value ) -> ( value ) -> nil`
11. `#insert_at(value, index)` that inserts a new node with the provided `value` at the given `index`.
12. `#remove_at(index)` that removes the node at the given `index`.