require 'blocks'

describe 'blocks test' do

	context 'map' do
		NEW_ARRAY = [1,2,3]

		it 'returns an array containing values returned by the block' do
			expect(NEW_ARRAY.map2 {|x| x}).to eql [1,2,3]
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

	end

end