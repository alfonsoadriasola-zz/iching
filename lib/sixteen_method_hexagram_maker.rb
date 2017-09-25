require 'securerandom'
class SixteenMethodHexagramMaker
  MAP={old_yin: 6, young_yang: 7, young_yin: 8, old_yang: 9}

  def do
    marbles = []
    marbles += [:old_yin]
    marbles += 5.times.map { :young_yang }
    marbles += 7.times.map { :young_yin }
    marbles += 3.times.map { :old_yang }
    hexagram = []
    6.times do
      sleep(0.2)
      throw = marbles[Random.new(SecureRandom.random_number*10000000).rand(16)]
      hexagram << throw
    end
    hexagram.map { |e| MAP[e] }
  end
end
