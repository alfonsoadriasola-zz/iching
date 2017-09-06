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
      throw = marbles[Random.new.rand(16)]
      hexagram << throw
    end
    hexagram.map { |e| MAP[e] }
  end
end


class CoinMethodHexagramMaker
  def do
    hexagram = []
    6.times do
      sleep(0.2)
      throw = 3.times.map { Random.new.rand(2); sleep(0.2) }
      hexagram << throw.map { |c| c == 1 ? 3 : 2 }.inject(0, :+)
    end
    hexagram
  end
end

class HexagramChanger
  def do(hexagram)
    hexagram.map do |l|
      case l
        when 9
          7
        when 8
          8
        when 7
          7
        when 6
          8
      end
    end
  end
end

class HexagramRenderer
  def link(hexagram)
    linkaddr = hexagram.map do |l|
      case l.to_i
        when 9
          0
        when 8
          0
        when 7
          1
        when 6
          1
      end
    end.reverse
    puts
    File.open("#{__dir__}/hexagrams/#{linkaddr.join}.md", "r") do |f|
      f.each_line do |line|
        puts line
      end
    end
    puts
  end

  def do(hexagram)
    hexagram.reverse.map do |l|
      case l.to_i
        when 9
          puts '---~  ~---'
        when 8
          puts '--      --'
        when 7
          puts '----------'
        when 6
          puts '---~~~~---'
      end
    end
    link(hexagram)
  end
end

Iching.new.cast
