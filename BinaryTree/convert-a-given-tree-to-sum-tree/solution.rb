class Node
	attr_accessor :left , :right , :key
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

	def toSumTree(node)
		return 0 if node.nil?
		old_value = node.key
		node.key = toSumTree(node.left) + toSumTree(node.right)
		return old_value + node.key
	end

end


binaryTree = BinaryTree.new

binaryTree.root = Node.new(10)
binaryTree.root.left = Node.new(-2)
binaryTree.root.right = Node.new(6)
binaryTree.root.left.left = Node.new(8)
binaryTree.root.left.right = Node.new(-4)
binaryTree.root.right.left = Node.new(7)
binaryTree.root.right.right = Node.new(5)

binaryTree.print_inorder(binaryTree.root)
puts

binaryTree.toSumTree(binaryTree.root)

binaryTree.print_inorder(binaryTree.root)
puts