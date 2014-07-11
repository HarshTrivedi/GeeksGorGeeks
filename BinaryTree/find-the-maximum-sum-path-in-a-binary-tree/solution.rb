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

	@@max = -10000
	def max_sum_path_util(node , sum=0)
		if node.left.nil? and node.right.nil?
			@@max = ( sum + node.key ) if @@max < ( sum + node.key )
			return
		end
		max_sum_path_util(node.left , sum + node.key)
		max_sum_path_util(node.right , sum + node.key)
	end

	def max_sum_path(node)
		@@max = -10000
		max_sum_path_util(node)
		return @@max
	end
end


binaryTree = BinaryTree.new

binaryTree.root = Node.new(10)
binaryTree.root.left = Node.new(-2)
binaryTree.root.right = Node.new(7)
binaryTree.root.left.left = Node.new(8)
binaryTree.root.left.right = Node.new(-4)

binaryTree.print_inorder(binaryTree.root)
puts


puts binaryTree.max_sum_path(binaryTree.root)


