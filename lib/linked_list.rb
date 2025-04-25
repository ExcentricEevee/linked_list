# Data structure that functions as an array but in a different way.
# List of nodes that contain data and references each other
# Pros: insertion/deletion is quick. Cons: lookup is slower
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(data)
    node = Node.new(data)
    head.nil? ? self.head = node : tail.next_node = node
    self.tail = node
    self.size += 1
  end

  def prepend(data)
    self.head = Node.new(data, head)
    self.size += 1
  end

  # like Array, assumes counting from 0
  def at(index)
    temp = head
    index.times do
      return nil if temp.next_node.nil?

      temp = temp.next_node
    end
    temp
  end

  def pop
    temp = head
    temp = temp.next_node until temp.next_node == tail
    temp.next_node = nil
    self.tail = temp
    self.size -= 1
  end

  def contains?(data)
    temp = head
    until temp.next_node.nil?
      return true if temp.value == data

      temp = temp.next_node
    end
    false
  end

  def find(data)
    temp = head
    index = 0
    until temp.nil?
      return index if temp.value == data

      temp = temp.next_node
      index += 1
    end

    nil
  end

  private

  attr_writer :head, :tail, :size
end
