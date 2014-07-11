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


	def insert_after_node(node_x , key)
		#Insert node_y after node_x
		node_y = Node.new(key)
		if not node_x.nil?
			next_node = node_x.next
			node_y.next = next_node
			node_x.next = node_y
		end
	end

	def insert_after_key(prev_key , key)
		node_x = search(prev_key)
		node_y = Node.new(key)
		if not node_x.nil?
			next_node = node_x.next
			node_y.next = next_node
			node_x.next = node_y
		end
	end

	def search(key)
		node = @head
		while not node.nil? and not node.key == key do
			node = node.next			
		end
		return node
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

linked_list.push(1)
linked_list.push(2)
linked_list.push(3)
linked_list.append(4)
linked_list.append(5)
linked_list.append(6)
linked_list.print_list	