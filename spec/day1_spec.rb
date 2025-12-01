require_relative "../lib/day1"

RSpec.describe SafeDial do
  let(:dial) { SafeDial.new }

  it 'will rotate to smaller number when provided input is L10' do
    dial.position = 50
    expect(dial.rotate('L10')).to eq(40)
  end

  it 'will rotate to larger number when provided input is R10' do
    dial.position = 50
    expect(dial.rotate('R10')).to eq(60)
  end

  it 'will wrap around to the end of the dial when rotating left past 0' do
    dial.position = 5
    expect(dial.rotate('L10')).to eq(95)
  end

  it 'will wrap around to the beginning of the dial when rotating right past 99' do
    dial.position = 95
    expect(dial.rotate('R10')).to eq(5)
  end

  it 'will count the number of times the dial lands on 0' do
    rotations = ['R50', 'R50', 'L100', 'R200', 'L150']
    
    rotations.each do |rotation|
      dial.rotate(rotation)
    end

    expect(dial.zero_count_land).to eq(2)
  end

  it 'will validate using the example input from data' do
    rotations = ['L68', 'L30', 'R48', 'L5', 'R60', 'L55', 'L1', 'L99', 'R14', 'L82']

    rotations.each do |rotation|
      dial.rotate(rotation)
    end

    expect(dial.zero_count_land).to eq(3)
    expect(dial.zero_count_pass).to eq(6)
  end

  it 'will count everytime the safe dial crosses 0' do
    dial.position = 50
    dial.rotate('L151')
    expect(dial.zero_count_pass).to eq(2)
  end

  it 'will count each time the safe dial crosses 0 when rotating right' do
    dial.position = 80
    dial.rotate('R1000')
    expect(dial.zero_count_pass).to eq(10)
  end
end