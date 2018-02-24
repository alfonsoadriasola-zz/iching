require_relative 'test_helper'
require_relative '../lib/../lib/coin_method_hexagram_maker'


describe CoinMethodHexagramMaker do
  describe 'when invoked' do
    it 'returns array of toss' do
      CoinMethodHexagramMaker.new.do.size.must_equal 6
    end
  end
end