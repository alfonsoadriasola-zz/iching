Dir.glob(__dir__ + '/lib/*', &method(:require))

class Iching
  def cast(maker: SixteenMethodHexagramMaker,
           changer: HexagramChanger,
           renderer: HexagramRenderer)

    hexagram = maker.new.do
    hexagram2 = changer.new.do hexagram

    renderer.new.do hexagram: hexagram
    renderer.new.do hexagram: hexagram2, first: false if hexagram2 != hexagram
  end
end
Iching.new.cast(renderer: StringHexagramRenderer) if ENV['WEB']
Iching.new.cast unless ENV['WEB']
