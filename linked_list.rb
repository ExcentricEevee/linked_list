require 'pry'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def append(value)
    node = Node.new
    node.value = value

    if @tail == nil
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new
    node.value = value
    
    if @head == nil
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    Node.count
  end

  def at(index)
    pointer = @head

    if index >= self.size
      puts "Error: Index exceeds size"
    else
      until index == 0 || pointer.next_node == nil
        pointer = pointer.next_node
        index -= 1
      end
      pointer.value
    end
  end

  def pop
    pointer = @head
    until pointer.next_node == @tail
      pointer = pointer.next_node
    end
    pointer.next_node = nil
    @tail = pointer
  end

  def contains?(value)
    pointer = @head
    until pointer == nil
      if pointer.value == value
        return true
      end
      pointer = pointer.next_node
    end
    return false
  end

  def find(value)
    pointer = @head
    index = 0

    until pointer == nil
      #binding.pry
      if pointer.value == value
        return index
      else
         pointer = pointer.next_node
         index += 1
      end
    end
    return nil
  end

  def to_s
    pointer = @head

    (self.size\).times do
      if pointer == nil
        print "nil"
      else
       print "( #{pointer.value} ) -> "
      end
      pointer = pointer.next_node
    end
  end
end

class Node
  attr_accessor :value, :next_node
  #attr_reader :count
  @@count = 0

  def initialize
    @value = nil
    @next_node = nil
    @@count += 1
  end

  def self.count
    @@count
  end
end

list = LinkedList.new
list.prepend("H")
list.prepend("U")
list.prepend("L")
list.prepend("K")
list.prepend("A")
puts list