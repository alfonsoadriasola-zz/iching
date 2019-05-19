require_relative './hexagram_renderer.rb'
class JsonHexagramRenderer < HexagramRenderer

  def out
    JSON.generate([reading1, reading2])
  end

  def render_file(linkaddr)
    lines = ""
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        lines << JSON.generate(line)
      end
    end
    { reading: lines }
  end
end
