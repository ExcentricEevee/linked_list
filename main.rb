require_relative "lib/linked_list"
require_relative "lib/node"

list = LinkedList.new
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")
list.prepend("cat")
list.prepend("dog")
p list.find('dog') # 0
p list.find('turtle') # 4
p list.find('fox') # nil
p list.contains?('turtle')
