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
    # The format should be: `( value ) -you> ( value ) -> ( value ) -> nil`
    str = ''
    current = @head
    until current.nil?
      str << "( #{current.value} ) => "
      current = current.next_node
    end
    str << 'nil'
  end

  def insert_at(value, index); end

  def remove_at(index); end
end