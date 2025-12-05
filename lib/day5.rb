class Ingredients

  attr_accessor :total_fresh, :number_of_fresh_ids

  def is_fresh?(ingredient, ranges)
    @total_fresh ||= 0
  
    if ranges.any? { |min, max| ingredient >= min && ingredient <= max }
      @total_fresh += 1
    end
  end

  def count_fresh_ids(ranges)
    merged_range = []
    ranges.each do |start, last|
      if merged_range.empty? || merged_range.last[1] < start - 1
        merged_range << [start, last]
      else
        merged_range.last[1] = [merged_range.last[1], last].max
      end
    end

    @number_of_fresh_ids = merged_range.map { |min, max| max - min + 1 }.sum
  end
end

if __FILE__ == $0
  input = File.readlines('lib\data\day5.txt').map(&:strip)
  ranges = input[0...input.index('')].map { |r| r.split('-').map(&:to_i) }.sort_by(&:first)
  ingredients = input[(input.index('') + 1)..-1]
  fresh_ingredient = Ingredients.new
  count_of_fresh_ids = fresh_ingredient.count_fresh_ids(ranges)
  ingredients.each do |ingredient|
    fresh_ingredient.is_fresh?(ingredient.strip.to_i, ranges)
  end
  puts "Total fresh ingredients: #{fresh_ingredient.total_fresh}"
  puts "Total fresh ingredient IDs: #{fresh_ingredient.number_of_fresh_ids}"
end