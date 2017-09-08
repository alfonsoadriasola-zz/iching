class HexagramChanger
  def do(hexagram)
    hexagram.map do |l|
      case l
        when 9
          7
        when 8
          8
        when 7
          7
        when 6
          8
      end
    end
  end
end