class Node
	attr_accessor :key , :next
	def initialize(key)
		@key = key
	end
end

class SinglyLinkedList
	attr_accessor :head

	def push(key)
		node = Node.new(key)
		node.next = head
		@head = node
	end

	def append(key)
		if @head.nil?
			node = Node.new(key) 
			node.next = head
			@head = node
		else
			node = @head
			while not node.next.nil? do
				node = node.next
			end
			node.next = Node.new(key)
		end
	end

	def get_middle
		node1 = @head
		node2 = @head
		while not node2.nil? and not node2.next.nil? do
			node2 = node2.next.next rescue nil
			node1 = node1.next if node2
		end
		return node1
	end

	def print_list
		node = @head
		while not node.nil? do
			print "#{node.key} "
			node = node.next
		end
		puts
	end
end


linked_list = SinglyLinkedList.new

linked_list.append(1)
linked_list.append(2)
linked_list.append(3)
linked_list.append(4)
linked_list.append(5)
linked_list.append(6)

linked_list.print_list	
puts linked_list.get_middle.key
