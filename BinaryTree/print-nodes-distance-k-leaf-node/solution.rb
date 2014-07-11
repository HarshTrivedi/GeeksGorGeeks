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

	def print_k_distance_from_root(node , level)
		return if node.nil?
		if level == 0
			print "#{node.key} " 
			return
		end
		print_k_distance_from_root(node.left , level - 1)
		print_k_distance_from_root(node.right , level - 1)

	end

end


binaryTree = BinaryTree.new

binaryTree.root = Node.new(10)
binaryTree.root.left = Node.new(8)
binaryTree.root.right = Node.new(12)
binaryTree.root.left.left = Node.new(3)
# binaryTree.root.left.left.left = Node.new(0)
# binaryTree.print_inorder(binaryTree.root)
# puts

#Considering root at level 0
binaryTree.print_k_distance_from_root(binaryTree.root , 0) ; puts
binaryTree.print_k_distance_from_root(binaryTree.root , 1) ; puts
binaryTree.print_k_distance_from_root(binaryTree.root , 2) ; puts