class PowerBank

  attr_accessor :total_power
  
  def initialize()
    @total_power = 0
  end

  # refactored to allow single method with second parameter for number of batteries to use
  def find_max_for_row_using(row, num_of_batteries)
    stack = []
    max = 0
    batteries_to_remove = row.size - num_of_batteries
    row.each do |num|
      while !stack.empty? && batteries_to_remove > 0 && stack[-1] < num
        stack.pop
        batteries_to_remove -= 1
      end
      stack << num
    end
    max = stack[0, num_of_batteries].join.to_i
    @total_power += max
  end

end

if __FILE__ == $0
  count = 12 # change to 2 for part 1
  batteries = File.readlines('lib\data\day3.txt').map(&:chomp)
  power = PowerBank.new()
  batteries.each do |grid|
    power.find_max_for_row_using(grid.chars.map(&:to_i), count)
  end

  puts "Total power for #{count} batteries: #{power.total_power}"
end
