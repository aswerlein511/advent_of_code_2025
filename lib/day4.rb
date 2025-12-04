class ForkLift

  attr_accessor :total_removed

  def items_to_remove_from(grid, many_passes = false)
    rows = grid.length
    columns = grid[0].length
    to_remove = 0
    updated_grid = grid.map(&:dup)

    (0...rows).each do |row|
      (0...columns).each do |column|
        if grid[row][column] == '@'
          adjacent_count = count_adjacent_items_for_grid(grid, row, column)
          if adjacent_count < 4
            updated_grid[row][column] = '.'
            to_remove += 1
          end
        end
      end
    end

    if many_passes && to_remove > 0
      to_remove += items_to_remove_from(updated_grid, true)
    end
    
    @total_removed = to_remove
  end

  def count_adjacent_items_for_grid(grid, row, col)
    directions = {
      up: [-1, 0],
      down: [1, 0],
      left: [0, -1],
      right: [0, 1],
      up_left: [-1, -1],
      up_right: [-1, 1],
      down_left: [1, -1],
      down_right: [1, 1]
    }

    count = 0

    directions.keys.each do |direction|
      direction_row, direction_col = directions[direction]
      new_row = row + direction_row
      new_column = col + direction_col
      if new_row >= 0 && new_row < grid.length && new_column >= 0 && new_column < grid[0].length && grid[new_row][new_column] == '@'
        count += 1
      end
    end
    count
  end
end

if __FILE__ == $0
  warehouse = File.readlines('lib\data\day4.txt').map(&:chomp).map { |line| line.strip.chars }
  forklift = ForkLift.new()
  forklift.items_to_remove_from(warehouse, true) # true enables multiple passes

  puts "Total rolls removed from warehouse: #{forklift.total_removed}"
end