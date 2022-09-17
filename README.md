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

**Code**
```ruby
# Node class
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

# LinkedList class
class LinkedList
  attr_reader :head

  def initialize(node = nil)
    @head = node
  end

  def append(val)
    current = @head
    current = current.next_node until current.next_node.nil?
    current.next_node = Node.new(val)
  end

  def prepend(val)
    new_head = Node.new(val)
    new_head.next_node = @head
    @head = new_head
  end

  def size
    current = @head
    count = current.nil? ? 0 : 1
    until current.next_node.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  def tail
    return nil if @head.nil?

    current = @head
    loop do
      break if current.next_node.nil?

      current = current.next_node
    end
    current
  end

  def at(index)
    return nil if @head.nil?
    return nil if index > size - 1

    current = @head
    i = 0
    loop do
      break if current.next_node.nil? || index == i

      current = current.next_node
      i += 1
    end
    current.value
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      removed = @head
      @next_node = nil
      return removed
    end

    current = @head
    loop do
      break if current.next_node.next_node.nil?

      current = current.next_node
    end
    removed = current.next_node
    current.next_node = nil
    removed
  end

  def contains?(value)
    current = @head
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    i = 0
    until current.nil?
      break if current.value == value

      current = current.next_node
      i += 1
    end
    i
  end

  def to_s
    str = ''
    current = @head
    until current.nil?
      str << if current.value.nil?
               '( nil ) => '
             else
               "( #{current.value} ) => "
             end
      current = current.next_node
    end
    str << 'nil'
  end

  def insert_at(value, index)
    if @head.nil?
      @head = Node.new(value)
      return
    end

    if index.zero?
      node = Node.new(value)
      node.next_node = @head.next_node
      @head = node
      return
    end

    previous = current = @head
    i = 0
    loop do
      break if index == i

      append(nil) if current.next_node.nil?

      previous = current
      current = current.next_node
      i += 1
    end
    node = Node.new(value)
    previous.next_node = node
    node.next_node = current.next_node
  end

  def remove_at(index)
    return nil if @head.nil?
    return nil if index > size - 1

    if index.zero?
      removed = @head
      @head = @head.next_node
      return removed
    end

    previous = @head
    current = @head
    i = 0
    loop do
      break if current.next_node.nil? || index == i

      previous = current
      current = current.next_node
      i += 1
    end
    if current.next_node.nil?
      removed = nil
    else
      removed = current.next_node
      previous.next_node = current.next_node
    end
    removed
  end
end
```

**Example**
```
ist = LinkedList.new(Node.new(1))
list.append(5)
list.append(3)
list.append(4)
list.prepend(0)
p list
p list.size
p list.head
p list.tail
p list.at(3)
p list.at(20)
p list
p list.pop
p list
Array((-5..5)).each { |x| puts "#{x} in list? : #{list.contains?(x)}" }
p list.find(0)
p list.find(3)
p list.to_s
p list.remove_at(1)
p list.to_s
p list.remove_at(0)
p list.to_s
p list.insert_at(777, 10)
p list.to_s
p list.size
p list.insert_at(4, 6)
p list.insert_at(3, 2)
p list.insert_at(55, 1)
p list.insert_at(10, 0)
p list.to_s
```

**Example Output**
```
#<LinkedList:0x00007f318de01648 @head=#<Node:0x00007f318de01440 @value=0, @next_node=#<Node:0x00007f318de01738 @value=1, @next_node=#<Node:0x00007f318de01558 @value=5, @next_node=#<Node:0x00007f318de014e0 @value=3, @next_node=#<Node:0x00007f318de014b8 @value=4, @next_node=nil>>>>>>
5
#<Node:0x00007f318de01440 @value=0, @next_node=#<Node:0x00007f318de01738 @value=1, @next_node=#<Node:0x00007f318de01558 @value=5, @next_node=#<Node:0x00007f318de014e0 @value=3, @next_node=#<Node:0x00007f318de014b8 @value=4, @next_node=nil>>>>>
#<Node:0x00007f318de014b8 @value=4, @next_node=nil>
3
nil
#<LinkedList:0x00007f318de01648 @head=#<Node:0x00007f318de01440 @value=0, @next_node=#<Node:0x00007f318de01738 @value=1, @next_node=#<Node:0x00007f318de01558 @value=5, @next_node=#<Node:0x00007f318de014e0 @value=3, @next_node=#<Node:0x00007f318de014b8 @value=4, @next_node=nil>>>>>>
#<Node:0x00007f318de014b8 @value=4, @next_node=nil>
#<LinkedList:0x00007f318de01648 @head=#<Node:0x00007f318de01440 @value=0, @next_node=#<Node:0x00007f318de01738 @value=1, @next_node=#<Node:0x00007f318de01558 @value=5, @next_node=#<Node:0x00007f318de014e0 @value=3, @next_node=nil>>>>>
-5 in list? : false
-4 in list? : false
-3 in list? : false
-2 in list? : false
-1 in list? : false
0 in list? : true
1 in list? : true
2 in list? : false
3 in list? : true
4 in list? : false
5 in list? : true
0
3
"( 0 ) => ( 1 ) => ( 5 ) => ( 3 ) => nil"
#<Node:0x00007f318de01558 @value=5, @next_node=#<Node:0x00007f318de014e0 @value=3, @next_node=nil>>
"( 0 ) => ( 5 ) => ( 3 ) => nil"
#<Node:0x00007f318de01440 @value=0, @next_node=#<Node:0x00007f318de01558 @value=5, @next_node=#<Node:0x00007f318de014e0 @value=3, @next_node=nil>>>
"( 5 ) => ( 3 ) => nil"
nil
"( 5 ) => ( 3 ) => ( nil ) => ( nil ) => ( nil ) => ( nil ) => ( nil ) => ( nil ) => ( nil ) => ( nil ) => ( 777 ) => nil"
11
#<Node:0x00007f318de09d98 @value=nil, @next_node=#<Node:0x00007f318de09d48 @value=nil, @next_node=#<Node:0x00007f318de09cf8 @value=nil, @next_node=#<Node:0x00007f318de09af0 @value=777, @next_node=nil>>>>
#<Node:0x00007f318de0a0b8 @value=nil, @next_node=#<Node:0x00007f318de0a040 @value=nil, @next_node=#<Node:0x00007f318de09fc8 @value=nil, @next_node=#<Node:0x00007f318de09258 @value=4, @next_node=#<Node:0x00007f318de09d98 @value=nil, @next_node=#<Node:0x00007f318de09d48 @value=nil, @next_node=#<Node:0x00007f318de09cf8 @value=nil, @next_node=#<Node:0x00007f318de09af0 @value=777, @next_node=nil>>>>>>>>
#<Node:0x00007f318de08e70 @value=3, @next_node=#<Node:0x00007f318de0a0b8 @value=nil, @next_node=#<Node:0x00007f318de0a040 @value=nil, @next_node=#<Node:0x00007f318de09fc8 @value=nil, @next_node=#<Node:0x00007f318de09258 @value=4, @next_node=#<Node:0x00007f318de09d98 @value=nil, @next_node=#<Node:0x00007f318de09d48 @value=nil, @next_node=#<Node:0x00007f318de09cf8 @value=nil, @next_node=#<Node:0x00007f318de09af0 @value=777, @next_node=nil>>>>>>>>>
nil
"( 10 ) => ( 55 ) => ( 3 ) => ( nil ) => ( nil ) => ( nil ) => ( 4 ) => ( nil ) => ( nil ) => ( nil ) => ( 777 ) => nil"
```