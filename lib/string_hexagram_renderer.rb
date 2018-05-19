require_relative './hexagram_renderer.rb'
class StringHexagramRenderer < HexagramRenderer
  def do(hexagram: [], first: true)
    out = []
    out += make_line_art(hexagram) if first
    out += render_hexagram(hexagram)
    out.join("\n")
  end

  def make_line_art(hexagram)
    hexagram.reverse.map do |l|
      case l.to_i
      when 9
        '<pre>---ooo---</pre>'
      when 8
        '<pre>---   ---</pre>'
      when 7
        '<pre>---------</pre>'
      when 6
        '<pre>---xxx---</pre>'
      end
    end
  end

  def render_file(linkaddr)
    lines = []
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        lines << line
      end
    end
    lines
  end
end
