require_relative 'test_helper'
require_relative '../lib/sixteen_method_hexagram_maker'
describe SixteenMethodHexagramMaker do
  describe 'when invoked' do
    it 'returns array of toss' do
      SixteenMethodHexagramMaker.new.do.size.must_equal 6
    end
  end
end
