class HexagramChanger
  def do(hexagram)
    hexagram.map do |l|
      case l
      when 9
        8
      when 8
        8
      when 7
        7
      when 6
        7
      end
    end
  end
end
