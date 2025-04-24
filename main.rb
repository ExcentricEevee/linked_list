require_relative "lib/linked_list"
require_relative "lib/node"

list = LinkedList.new
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")
list.prepend("cat")
list.prepend("dog")
p list
