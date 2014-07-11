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

	@@ancestors = []
	def get_ancestors_util(node , search_key)
		return false if node.nil?
		return true if node.key == search_key		
		is_ancestor = get_ancestors(node.left , search_key ) or get_ancestors(node.right , search_key)
		@@ancestors << node.key if is_ancestor
		return is_ancestor
	end

	def get_ancestors(node , search_key)
		@@ancestors = []
		get_ancestors_util(node , search_key)
		return @@ancestors.inspect
	end

end


binaryTree = BinaryTree.new

binaryTree.root = Node.new(1)
binaryTree.root.left = Node.new(2)
binaryTree.root.right = Node.new(3)
binaryTree.root.left.left = Node.new(4)
binaryTree.root.left.right = Node.new(5)
binaryTree.root.right.left = Node.new(6)
binaryTree.root.right.right = Node.new(7)
# binaryTree.print_inorder(binaryTree.root)
# puts

puts binaryTree.get_ancestors(binaryTree.root , 7)