require_relative "node"

# Data structure that functions as an array but in a different way.
# List of nodes that contain data and references each other
# Pros: insertion/deletion is quick. Cons: lookup is slower
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    node = Node.new(data)
    head.nil? ? self.head = node : tail.next_node = node
    self.tail = node
  end

  def prepend(data)
    self.head = Node.new(data, head)
  end

  def size
    temp = head
    count = 0
    until temp.nil?
      count += 1
      temp = temp.next_node
    end

    count
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
    if size == 1
      self.head = nil
      self.tail = nil
    else
      temp = head
      temp = temp.next_node until temp.next_node == tail
      temp.next_node = nil
      self.tail = temp
    end
  end

  def contains?(data)
    temp = head
    until temp.nil?
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

  def remove_at(index)
    return if index.negative? || index >= size

    if index.zero?
      result = head
      self.head = head.next_node
    else
      temp = head
      (index - 1).times { temp = temp.next_node }
      result = temp.next_node
      temp.next_node = temp.next_node.next_node
    end

    # returns removed entry
    result
  end

  def to_s
    temp = head
    str = ""
    until temp.nil?
      str << "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    str << "nil"
  end

  private

  attr_writer :head, :tail
end
