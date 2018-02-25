require_relative 'test_helper'
require_relative '../iching'
describe Iching do
  before do
    @iching = Iching.new
  end

  describe 'casting' do
    it 'works' do
      @iching.cast
    end

    it 'works with other renderer' do
      @iching.cast(maker: CoinMethodHexagramMaker)
    end
  end
end
