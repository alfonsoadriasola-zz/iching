require_relative 'test_helper'
require_relative '../lib/hexagram_renderer'

describe HexagramRenderer do
  before do
    @renderer = HexagramRenderer.new
  end

  describe 'when asked to render' do
    it 'can given a good hex' do
      hexagram = [9, 9, 9, 9, 9, 9]
      expected = %w[---ooo--- ---ooo--- ---ooo--- ---ooo--- ---ooo--- ---ooo---]
      @renderer.make_line_art(hexagram).must_equal expected
    end

    it 'can do more kinds of hexes' do
      hexagram = [6, 6, 6, 6, 6, 6]
      expected = %w[---xxx--- ---xxx--- ---xxx--- ---xxx--- ---xxx--- ---xxx---]
      @renderer.make_line_art(hexagram).must_equal expected
    end

    it 'can given a unchanging hex' do
      hexagram = [7, 7, 7, 7, 7, 7]
      expected = %w[--------- --------- --------- --------- --------- ---------]
      @renderer.make_line_art(hexagram).must_equal expected
    end

    it 'can do more kinds of hexes' do
      hexagram = [8, 8, 8, 8, 8, 8]
      expected = ['---   ---', '---   ---', '---   ---',
                  '---   ---', '---   ---', '---   ---']
      @renderer.make_line_art(hexagram).must_equal expected
    end
  end

  describe 'when asked about blending possibilities' do
    it 'wont say no' do
      @renderer.make_line_art([]).must_be_empty
    end
  end

  describe 'when asked to do' do
    it 'will do to hexes but line art only 1' do
      @renderer.do(hexagram: [6, 6, 6, 6, 6, 6], first: false)
    end
  end
end
