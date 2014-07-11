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

	@@hash = {}
	def vertical_sums_util(node , horizontal_distance)
		return if node.nil?
		@@hash[horizontal_distance] = @@hash[horizontal_distance].to_i + node.key
		vertical_sums_util(node.left , horizontal_distance - 1)
		vertical_sums_util(node.right , horizontal_distance + 1)
	end

	def print_vertical_sums(node)
		@@hash = {}
		vertical_sums_util(node , 0)
		puts @@hash.sort.map(&:last).inspect
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
# binaryTree.root.left.left.left = Node.new(0)
# binaryTree.print_inorder(binaryTree.root)
# puts

binaryTree.print_vertical_sums(binaryTree.root) 