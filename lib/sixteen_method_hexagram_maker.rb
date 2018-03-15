require 'securerandom'
class SixteenMethodHexagramMaker
  MAP = { old_yin: 6, young_yang: 7, young_yin: 8, old_yang: 9 }.freeze

  def do
    marbles = []
    marbles += [:old_yin]
    marbles += Array.new(5) { :young_yang }
    marbles += Array.new(7) { :young_yin }
    marbles += Array.new(3) { :old_yang }
    hexagram = []
    6.times do
      sleep(0.2)
      throw = marbles[Random.new(SecureRandom.random_number * 10_000_000).rand(16)]
      hexagram << throw
    end
    hexagram.map { |e| MAP[e] }
  end
end
