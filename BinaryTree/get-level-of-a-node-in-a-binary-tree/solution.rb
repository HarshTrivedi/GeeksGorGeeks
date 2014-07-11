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

	def get_level_util(node , level , search_key)
		return nil if node.nil?
		return level if node.key == search_key

		down =  get_level_util(node.left , level +1 , search_key) 
		return down if down
		down =  get_level_util(node.right , level +1 , search_key) 
		return down if down
	end

	def get_level(node , search_key)
		get_level_util(node , 0 , search_key) || -1
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
binaryTree.root.right.right.right = Node.new(10)
# binaryTree.root.left.left.left = Node.new(0)
# binaryTree.print_inorder(binaryTree.root)
# puts

#Considering Root on level 0
# Returns -1 on not finding the search key
puts binaryTree.get_level(binaryTree.root , 100)