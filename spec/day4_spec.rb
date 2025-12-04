require_relative "../lib/day4"

RSpec.describe ForkLift do

  small_sample = [
    ['.','.','@','.','.'],
    ['.','.','.','.','.'],
  ]

  blocked_sample = [
    ['@','@','@','@','@'],
    ['@','@','@','@','@'],
    ['@','@','@','@','@'],
  ]

  sample_input = '''
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
  '''

  it 'will remove an item that has less than 4 items adjasecent to it' do
    forklift = ForkLift.new
    forklift.items_to_remove_from(small_sample)
    expect(forklift.total_removed).to eq(1)
  end

  it 'will not remove an item that has 4 or more items adjasecent to it' do
    forklift = ForkLift.new
    forklift.items_to_remove_from(blocked_sample)
    expect(forklift.total_removed).to eq(4)
  end

  it 'will process the sample input correctly' do
    forklift = ForkLift.new
    warehouse = sample_input.strip.split("\n").map { |line| line.strip.chars }
    forklift.items_to_remove_from(warehouse)
    expect(forklift.total_removed).to eq(13)
  end

  it 'will process multiple passes correctly when enabled' do
    forklift = ForkLift.new
    warehouse = sample_input.strip.split("\n").map { |line| line.strip.chars }
    forklift.items_to_remove_from(warehouse, true)
    expect(forklift.total_removed).to eq(43)
  end
end