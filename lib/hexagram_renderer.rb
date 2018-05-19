class HexagramRenderer
  def do(hexagram: [], first: true)
    make_line_art(hexagram) if first
    render_hexagram(hexagram)
  end

  def make_line_art(hexagram)
    art = hexagram.reverse.map do |l|
      case l.to_i
      when 9
        '---ooo---'
      when 8
        '---   ---'
      when 7
        '---------'
      when 6
        '---xxx---'
      end
    end
    art.each { |l| puts l }
  end

  def render_hexagram(hexagram)
    linkaddr = make_binary_string(hexagram)
    render_file(linkaddr)
  end

  def render_file(linkaddr)
    puts
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
  end

  def make_binary_string(hexagram)
    hexagram.map do |l|
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
  end
end
