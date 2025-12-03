class PowerBank

  attr_accessor :total_power
  
  def initialize()
    @total_power = 0
  end

  def find_max_for_row_using(row, count)
    stack = []
    max_val = 0
    batter_to_remove = row.size - count
    row.each do |digit|
      while !stack.empty? && batter_to_remove > 0 && stack[-1] < digit
        stack.pop
        batter_to_remove -= 1
      end
      stack << digit
    end
    max_val = stack[0, count].join.to_i
    @total_power += max_val
  end

end

if __FILE__ == $0
  batteries = File.readlines('lib\data\day3.txt').map(&:chomp)
  power = PowerBank.new()
  batteries.each do |grid|
    power.find_max_for_row_using(grid.chars.map(&:to_i), 12)
  end

  puts "Total power: #{power.total_power}"
end
