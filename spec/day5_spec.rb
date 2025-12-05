require_relative "../lib/day5"

RSpec.describe Ingredients do

    let(:simple_example) do
      <<~DATA
        3-5
      
        1
        4
      DATA
    end
  
    let(:actual_example) do
      <<~DATA
        3-5
        10-14
        16-20
        12-18
      
        1
        5
        8
        11
        17
        32
      DATA
    end
  
    let(:simple_input) { simple_example.lines.map(&:strip) }
    let(:ranges) { simple_input[0...simple_input.index("")].map { |r| r.split('-').map(&:to_i) }.sort_by(&:first) }
    let(:ingredient_list) { simple_input[(simple_input.index("") + 1)..-1].map(&:to_i) }

    let(:actual_input) { actual_example.lines.map(&:strip) }
    let(:actual_ranges) { actual_input[0...actual_input.index("")].map { |r| r.split('-').map(&:to_i) }.sort_by(&:first) }
    let(:actual_ingredient_list) { actual_input[(actual_input.index("") + 1)..-1].map(&:to_i) }
    let(:ingredients) { Ingredients.new }

  it 'it will return the number of fresh ingredients' do
    ingredient_list.each do |ingredient|
      ingredients.is_fresh?(ingredient, ranges)
    end
    expect(ingredients.total_fresh).to eq(1)
  end

  it 'will provide the number of possible fresh ingredients' do
    ingredients.count_fresh_ids(ranges)
    expect(ingredients.number_of_fresh_ids).to eq(3)
  end

  it 'will return correct count using the actual sample from the prompt' do
    actual_ingredient_list.each do |ingredient|
      ingredients.is_fresh?(ingredient, actual_ranges)
    end
    expect(ingredients.total_fresh).to eq(3)
  end

  it 'will sum the ranges correct using prompt data' do
    ingredients.count_fresh_ids(actual_ranges)
    expect(ingredients.number_of_fresh_ids).to eq(14)
  end

end