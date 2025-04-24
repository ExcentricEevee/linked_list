# Data structure that functions as an array but in a different way.
# List of nodes that contain data and references each other
# Pros: insertion/deletion is quick. Cons: lookup is slower
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    puts "LinkedList Initialized"
  end

  def append(data)
    node = Node.new(data)
    head.nil? ? self.head = node : tail.next_node = node
    self.tail = node
  end

  def prepend(data)
    node = Node.new(data)
    node.next_node = head unless head.nil?
    self.head = node
  end
end
