require_relative './linked_list'

# Creates a linked list (0)->(1)->(5)->(3)->(4)
list = LinkedList.new(Node.new(1))
list.append(5)
list.append(3)
list.append(4)
list.prepend(0)

# Print the linked list and size
puts list.to_s
puts list.size

# Return head and tail
p list.head
p list.tail

# Return the node at index 3 and 20
p list.at(3)
p list.at(20)

# Pop a node off the end
puts list.to_s
list.pop
puts list.to_s

# Check which values are present
Array((-5..5)).each { |x| puts "#{x} in list? : #{list.contains?(x)}" }

# Find the index of first matching value
p list.find(0)
p list.find(3)

# Remove the value at index 1
p list.to_s
list.remove_at(1)
p list.to_s

# Remove the value at index 0
p list.remove_at(0)
p list.to_s

# Insert a value 777 at index 10 (new linked-list should have size 11)
p list.insert_at(777, 10)
p list.to_s
p list.size

# Insert 4 @ 6, 3 @ 2, 55 @ 1, and 10 @ 0
p list.insert_at(4, 6)
p list.insert_at(3, 2)
p list.insert_at(55, 1)
p list.insert_at(10, 0)
p list.to_s
