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
		node = @head
		while(not node.next.nil?)
			node = node.next
		end
		node.next = Node.new(key)
	end

	def search(key)
		node = @head
		while not node.nil? and not node.key == key do
			node = node.next			
		end
		return node
	end

	def delete_node(node)
		if node == @head
			@head = node.next
			node = nil
		else
			walker_node = @head
			prev_node = nil
			while( not walker_node.nil?  and not walker_node.key == node.key ) do
				prev_node = walker_node
				walker_node = walker_node.next
			end
			next_node = node.next 
			prev_node.next = next_node
			node = nil
		end
	end

	def delete_key(key)
		node = search(key)
		delete_node(node) if not node.nil?
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

linked_list.push(3)
linked_list.push(2)
linked_list.push(1)
linked_list.append(4)
linked_list.append(5)
linked_list.append(6)
linked_list.delete_key(3)
linked_list.delete_key(4)
linked_list.print_list	