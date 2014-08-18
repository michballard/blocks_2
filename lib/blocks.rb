class Array

	def map2(&input)
		return input.to_enum if input.class != Proc
			c = []
			for i in self
				c << yield(i)
			end
		c
	end

	def select2(&input)
		return input.to_enum if input.class != Proc
			c = []
			for i in self
				c << i if yield(i)
			end
		c
	end

	def each2(&input)
		return input.to_enum if input.class != Proc
		for i in self
			yield(i)
		end
		self
	end


end