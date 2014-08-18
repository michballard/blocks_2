class Array
	def map2(&input)
		return input.to_enum if input.class != Proc
			c = []
			for i in self
				c << yield(i)
			end
		c
	end
end