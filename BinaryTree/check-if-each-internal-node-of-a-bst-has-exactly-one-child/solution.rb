

pre_order_array = [20, 10, 11, 13, 12]


def has_only_one_child(pre_order_array )
	return true if pre_order_array.length < 3
	max = pre_order_array.take(2).max
	min = pre_order_array.take(2).min

	if pre_order_array.first == max
		min = -Float::INFINITY
	else
		max = Float::INFINITY
	end

	for i in 2..(pre_order_array.length-1)
		return false if not ( min..max) === pre_order_array[i]		
		if pre_order_array[i] > pre_order_array[i-1]
			#if value has increased in this iteration , then update the lower bound
			min = [min , pre_order_array[i-1]].max
		elsif pre_order_array[i] < pre_order_array[i-1]
			#if value has decreased in this iteration , then update the upper bound
			max = [max , pre_order_array[i-1]].min
		else
			min = pre_order_array[i]
			max = pre_order_array[i]
		end
	end
	return true
end

puts has_only_one_child(pre_order_array)