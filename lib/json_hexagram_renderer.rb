require_relative './hexagram_renderer.rb'
class JsonHexagramRenderer < HexagramRenderer
  def self.out(reading1, reading2)
    json = { iching: { first: reading1 }}
    json.merge second:reading2 if reading2
    json
  end

  def render_file(linkaddr)
    lines = ""
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        lines << line
      end
    end
    { reading: lines }
  end
end
