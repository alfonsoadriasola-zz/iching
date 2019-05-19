Dir.glob(__dir__ + '/lib/*', &method(:require))
class Iching
  def cast(maker: SixteenMethodHexagramMaker,
           changer: HexagramChanger,
           renderer: PutsHexagramRenderer)

    hexagram = maker.new.do
    hexagram2 = changer.new.do hexagram

    reading1 = renderer.new.do hexagram: hexagram
    reading2 = renderer.new.do hexagram: hexagram2, first: false if hexagram2 != hexagram

    renderer.out(reading1, reading2)
  end
end
Iching.new.cast unless ENV['WEB']
