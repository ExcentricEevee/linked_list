# Pieces of data that also reference sequential nodes. Used in linked lists.
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
