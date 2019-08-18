require_relative "./hexagram_renderer.rb"
class HtmlHexagramRenderer < HexagramRenderer
  def self.out(reading1, reading2)
    "#{reading1} \n #{reading2}"
  end

  def do(hexagram: [], first: true)
    out = []
    out += make_line_art(hexagram) if first
    out += render_hexagram(hexagram)
    out.join("\n")
  end

  def make_line_art(hexagram = Array.new(7, 7))
    i = -1
    hexagram.reverse.map do |l|
      line = "<pre>"
      line << case l.to_i
      when 9
        "---ooo---"
      when 8
        "---   ---"
      when 7
        "---------"
      when 6
        "---xxx---"
      end
      i += 1
      line << " #{6 - i}</pre>"
    end
  end

  def render_file(linkaddr)
    lines = []
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", "r") do |f|
      f.each_line do |line|
        lines << line
      end
    end
    lines
  end
end
