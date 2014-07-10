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

	def detect_loop_1
		#Using Hash
		hash = {}
		node = @head
		while not node.nil? do
			if hash[node.__id__]
				return true
			else
				hash[node.__id__] = true
				node = node.next
			end
		end
		return false
	end

	def detect_loop_2
		#Using Floyd's algorithm
		node1 = @head
		node2 = @head
		while true do
			node1 = node1.next
			node2 = node2.next.next rescue nil
			return false if node2.nil?
			return true if node1.__id__ == node2.__id__
		end
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

linked_list.head.next.next.next = linked_list.head

puts linked_list.detect_loop_1
puts linked_list.detect_loop_2
