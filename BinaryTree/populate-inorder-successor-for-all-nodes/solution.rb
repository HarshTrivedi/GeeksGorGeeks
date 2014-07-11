class Node
	attr_accessor :left , :right , :next ,:key
	def initialize(key)
		@key = key
	end

end

class BinaryTree
	attr_accessor :root

	def print_inorder(node)		
		return if node.nil?
		print_inorder(node.left)
		print "#{node.key} "
		print_inorder(node.right)			
	end

	def print_inorder_using_next(node)		
		while not node.nil? do
			print "#{node.key} "
			node = node.next
		end
		puts
	end

	@@previous_visited = nil
	def populateNext(node )
		return if node.nil?
		populateNext(node.right)
		node.next = @@previous_visited
		@@previous_visited = node
		populateNext(node.left)
	end

end


binaryTree = BinaryTree.new

binaryTree.root = Node.new(10)
binaryTree.root.left = Node.new(8)
binaryTree.root.right = Node.new(12)
binaryTree.root.left.left = Node.new(3)

binaryTree.print_inorder(binaryTree.root)
puts
binaryTree.populateNext(binaryTree.root )
binaryTree.print_inorder_using_next(binaryTree.root.left.left)

