Dir.glob(__dir__ + '/lib/*', &method(:require))
# In chanrge of performing the oracle
# returns 1 or two hexagrams either in STDOUT (output is blank) or String ;
# output of renderer in string format
class Iching
  def cast(maker: SixteenMethodHexagramMaker,
           changer: HexagramChanger,
           renderer: PutsHexagramRenderer)

    hexagram = maker.new.do
    hexagram2 = changer.new.do hexagram

    reading1 = renderer.new.do hexagram: hexagram
    reading2 = renderer.new.do hexagram: hexagram2, first: false if hexagram2 != hexagram
    "#{reading1}\n#{reading2}"
  end
end
Iching.new.cast unless ENV['WEB']
