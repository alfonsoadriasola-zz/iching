require_relative 'test_helper'
require_relative '../lib/../lib/hexagram_changer'
describe HexagramChanger do

  it 'changes array of changing numbers to fixed ones' do
    hex = [6, 6, 6, 6, 6, 6]
    hex2 = HexagramChanger.new.do(hex)
    hex2.must_equal [7, 7, 7, 7, 7, 7]
  end

  it 'changes array of yang change numbers to fixed ones' do
    hex = [6, 9, 6, 9, 9, 6]
    hex2 = HexagramChanger.new.do(hex)
    hex2.must_equal [7, 8, 7, 8, 8, 7]
  end

  it 'produces immutatable hex' do
    hex = [6, 9, 6, 9, 9, 6]
    hex2 = HexagramChanger.new.do(hex)
    HexagramChanger.new.do(hex2).must_equal hex2
  end

end