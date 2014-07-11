class Node
	attr_accessor :key , :next
	def initialize(key)
		@key = key
	end
end

class SinglyLinkedList
	attr_accessor :head
	def print_list
		node = @head
		while not node.nil? do
			print "#{node.key} "
			node = node.next
		end
		puts
	end
end
node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)

linked_list = SinglyLinkedList.new
node1.next = node2
node2.next = node3
linked_list.head = node1
linked_list.print_list