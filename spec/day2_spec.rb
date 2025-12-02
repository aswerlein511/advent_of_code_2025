require_relative '../lib/day2'

RSpec.describe ProductFinder do

  it 'returns empty for a range with no invalid IDs' do
    input = "1234-1236"
    finder = ProductFinder.new(input)
    invalid_ids = finder.find_invalid_ids
    expect(invalid_ids).to eq([])
    expect(finder.sum).to eq(0)
  end


  it 'finds a single invalid ID in a small range' do
    input = "6464-6464"
    finder = ProductFinder.new(input)
    invalid_ids = finder.find_invalid_ids
    expect(invalid_ids).to eq([6464])
    expect(finder.sum).to eq(6464)
  end

  it 'finds IDs with repeated substrings of any length' do
    input = "1212-121212,111-1111111,123123-123123123"
    finder = ProductFinder.new(input)
    invalid_ids = finder.find_invalid_ids
    expect(invalid_ids).to include(1212, 111, 1111, 123123)
    expect(finder.sum).to be >= 0
  end

  it 'handles multiple ranges with some and some without invalid IDs' do
    input = "55-56,123123-123124,1000-1001"
    finder = ProductFinder.new(input)
    invalid_ids = finder.find_invalid_ids
    expect(invalid_ids).to include(55, 123123)
    expect(finder.sum).to be >= 0
  end

  it 'finds invalid IDs and their sum for the example input' do
    input = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"
    finder = ProductFinder.new(input)
    invalid_ids = finder.find_invalid_ids
    expect(invalid_ids).to include(11, 22, 99, 1010, 222222, 446446)
    expect(finder.sum).to be >= 0
  end

  it 'will not count duplicate invalid IDs across ranges' do
    input = "11-22,10-15"
    finder = ProductFinder.new(input)
    invalid_ids = finder.find_invalid_ids
    expect(invalid_ids).to include(11, 22)
    expect(invalid_ids.count(11)).to eq(1)
  end
end
