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

	def get_nth_from_last(n)
		node = @head
		n.times do
			return nil if node.nil?
			node = node.next
		end
		prev_node = @head
		while not node.nil? do
 			prev_node = prev_node.next
 			node = node.next
		end
		return prev_node
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
puts linked_list.get_nth_from_last(1).key
puts linked_list.get_nth_from_last(2).key
puts linked_list.get_nth_from_last(3).key
puts linked_list.get_nth_from_last(4).key
puts linked_list.get_nth_from_last(5).key
puts linked_list.get_nth_from_last(6).key
