class ProductFinder
  attr_accessor :numbers, :invalid_ids, :sum

  def initialize(numbers)
    @numbers = numbers
    @invalid_ids = []
    @sum = 0
  end

  def find_invalid_ids
    @numbers.split(',').map { |r| Range.new(*r.split('-').map(&:to_i)) }.each do |range|
      min_digits, max_digits = range.begin.to_s.length, range.end.to_s.length
      (min_digits..max_digits).each do |num|
        (1..(num/2)).each do |pattern|
          next if pattern == 0
          generate_repeated_numbers(pattern, num, range) { |num| @invalid_ids << num }
        end
      end
    end
    @invalid_ids.uniq!
    @sum = @invalid_ids.sum
    @invalid_ids
  end

  private

  def generate_repeated_numbers(pattern_length, total_length, range)
    min_pattern = 10**(pattern_length - 1)
    max_pattern = 10**pattern_length - 1
    (min_pattern..max_pattern).each do |pattern|
      rep = 2
      while (pattern.to_s.length * rep) <= total_length
        match = pattern.to_s * rep
        if match.length == total_length
          match = match.to_i
          if match >= range.begin && match <= range.end
            yield match
          end
        end
        rep += 1
      end
    end
  end
end

if __FILE__ == $0
  input = File.read('lib\data\day2.txt').strip
  finder = ProductFinder.new(input)
  finder.find_invalid_ids
  puts "Invalid IDs: #{finder.invalid_ids}"
  puts "Sum: #{finder.sum}"
end