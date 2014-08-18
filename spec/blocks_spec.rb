require 'blocks'

describe 'blocks test' do

	NEW_ARRAY = [1,2,3]

	context 'map' do

		it 'returns an array containing values returned by the block' do
			expect(NEW_ARRAY.map2 {|x| x}).to eq [1,2,3]
		end

		it 'returns a new array' do
			expect(NEW_ARRAY.map {|x| x}).not_to be NEW_ARRAY
		end

		it 'invokes the given block once for each element of self' do
			result = []
			for i in NEW_ARRAY 
				result << i * 2
			end
			expect(NEW_ARRAY.map2 { |x| x * 2 }).to eq result
		end

		it 'return an enumerator if no block is given' do
			expect(NEW_ARRAY.map2.class).to eq Enumerator
		end


		it 'should be able to use a proc instead of a block' do
			my_proc = Proc.new {|x| x * 2} 
			result = [1,2,3].map(&my_proc)
			expect(result).to eq([2,4,6])
		end
	end

	context 'select' do

		it 'returns an array containing values returned by the block' do
			expect(NEW_ARRAY.select2 {|x| x}).to eql [1,2,3]
		end


		it 'will only pass through elements as specified to be true in the block' do
			result = []
			for i in NEW_ARRAY
				result << i if i.even?
			end
			expect(NEW_ARRAY.select2 { |x| x.even?}).to eq result

		end

		it 'return an enumerator if no block is given' do
			expect(NEW_ARRAY.select2.class).to eq Enumerator
		end		

	end

	context 'each' do

		it 'returns the same array which it has been passed' do
			expect(NEW_ARRAY.each2 {|x| 2*x}).to be NEW_ARRAY
		end

		it 'returns the same array unchanged' do
			expect(NEW_ARRAY.each2 {|x| 2*x}).to eq [1,2,3]
		end

		it 'return an enumerator if no block is given' do
			expect(NEW_ARRAY.each2.class).to eq Enumerator
		end

	end

	context 'inject' do

		it 'sums up a range of numbers' do
			sum = 100
			initial = sum
			(1..5).each do |i|
				sum += i
			end			
			inject_sum = (1..5).inject (initial) { |sum,n| sum + n}
			expect(inject_sum).to eq sum
		end 

	end

end