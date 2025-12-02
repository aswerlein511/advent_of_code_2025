class SafeDial
  def initialize
    @position = 50
    @zero_count_land = 0
    @zero_count_pass = 0
  end

  attr_accessor :position, :zero_count_land, :zero_count_pass

  def rotate(rotation)
    old_position = @position
    direction = rotation[0]
    steps = rotation[1..-1].to_i
    zero_hits = 0
    pos = @position
    steps.times do
      case direction
      when 'L'
        pos = (pos - 1) % 100
      when 'R'
        pos = (pos + 1) % 100
      end
      zero_hits += 1 if pos == 0
    end
    @position = pos
    @zero_count_pass += zero_hits
    @zero_count_land += 1 if @position == 0
    @position
  end
end

if __FILE__ == $0
  rotations = File.readlines('lib\data\day1.txt').map(&:chomp)
  dial = SafeDial.new
  rotations.each do |rotation|
    dial.rotate(rotation)
  end

  puts "Zero count (lands on 0): #{dial.zero_count_land}"
  puts "Zero count 2 (passes through 0): #{dial.zero_count_pass}"
end