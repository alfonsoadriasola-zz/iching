Dir.glob(__dir__ + '/lib/*', &method(:require))

class Iching
  def cast(maker: SixteenMethodHexagramMaker,
           changer: HexagramChanger,
           renderer: HexagramRenderer)

    puts "#{ARGV[0]}"

    hexagram = maker.new.do
    hexagram2 = changer.new.do hexagram

    renderer.new.do hexagram
    renderer.new.do hexagram2
  end
end

Iching.new.cast
