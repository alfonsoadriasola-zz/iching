require_relative './hexagram_renderer.rb'
class PutsHexagramRenderer < HexagramRenderer
  def render_file(linkaddr)
    puts
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
  end
end
