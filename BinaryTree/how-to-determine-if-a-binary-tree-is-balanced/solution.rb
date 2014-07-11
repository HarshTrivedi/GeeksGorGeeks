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

	def is_height_balanced_one(node)
		return true if node.nil?
		return true if  ( height(node.left) - height(node.right)  ).abs <= 1
		return false
	end

	def height(node)
		return -1 if node.nil?
		return [ height(node.left) , height(node.right) ].max + 1
	end

	@height = nil
	def is_height_balanced_two(node )
		if node.nil?
			@height = -1
			return true
		end
		left_balanced = is_height_balanced_two(node.left )
		left_height = @height

		right_balanced = is_height_balanced_two(node.right)
		right_height = @height

		@height = [left_height , right_height].max + 1

		if left_balanced and right_balanced and (left_height - right_height).abs <= 1
			return true
		else
			return false
		end
	end


end


binaryTree = BinaryTree.new

binaryTree.root = Node.new(10)
binaryTree.root.left = Node.new(8)
binaryTree.root.right = Node.new(12)
binaryTree.root.left.left = Node.new(3)
# binaryTree.root.left.left.left = Node.new(0)
binaryTree.print_inorder(binaryTree.root)
puts
puts binaryTree.is_height_balanced_one(binaryTree.root )
puts binaryTree.is_height_balanced_two(binaryTree.root)

