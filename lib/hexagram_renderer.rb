class HexagramRenderer
  def link(hexagram)
    linkaddr = hexagram.map do |l|
      case l.to_i
        when 9
          1
        when 8
          0
        when 7
          1
        when 6
          0
      end
    end.reverse
    puts
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", "r") do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
  end

  def do(hexagram)
    hexagram.reverse.map do |l|
      case l.to_i
        when 9
          puts '---ooo---'
        when 8
          puts '---   ---'
        when 7
          puts '---------'
        when 6
          puts '---xxx---'
      end
    end
    link(hexagram)
  end
end
