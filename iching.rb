Dir.glob(__dir__ + '/lib/*', &method(:require))
class Iching
  def cast(maker: SixteenMethodHexagramMaker,
           changer: HexagramChanger,
           renderer: HexagramRenderer)

    hexagram = maker.new.do
    hexagram2 = changer.new.do hexagram

    reading = renderer.new.do hexagram: hexagram
    reading +=  renderer.new.do hexagram: hexagram2, first: false if hexagram2 != hexagram
    reading
  end
end
Iching.new.cast unless ENV['WEB']
