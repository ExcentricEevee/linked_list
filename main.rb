require_relative "lib/linked_list"

list = LinkedList.new
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")
list.prepend("cat")
list.prepend("dog")

puts list
p list.size
