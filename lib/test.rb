require_relative './linked_list'

list = LinkedList.new(Node.new(1))
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
