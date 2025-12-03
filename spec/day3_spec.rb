require_relative "../lib/day3"

RSpec.describe PowerBank do
  it 'will add the add largest digits in array together [9,1,1,3,7] would be 97' do
    batteries = [9,1,1,3,7]
    power_bank = PowerBank.new()
    power_bank.find_max_for_row_using(batteries, 2)
    expect(power_bank.total_power).to eq(97)
  end

  it 'will add the add largest digits in array together [6,1,1,3,7,9] would be 69' do
    batteries = [6,1,1,3,7,9]
    power_bank = PowerBank.new()
    power_bank.find_max_for_row_using(batteries, 2)
    expect(power_bank.total_power).to eq(79)
  end

  it 'will add multiple rows maxes together' do
    batteries = [[6,1,1,3,7,9], [2,4,5,8,3]]
    power_bank = PowerBank.new()
    batteries.each do |row|
      power_bank.find_max_for_row_using(row, 2)
    end
    expect(power_bank.total_power).to eq(162)
  end

  it 'will add the largest 2 digits from sample input' do
    batteries = ['987654321111111', '811111111111119', '234234234234278', '818181911112111']
    power_bank = PowerBank.new()
    batteries.each do |row|
      power_bank.find_max_for_row_using(row.chars.map(&:to_i), 2)
    end
    expect(power_bank.total_power).to eq(357)
  end

  it 'will now add using 12 of the batteries' do
    batteries = '987654321111111'.chars.map(&:to_i)
    power_bank = PowerBank.new()
    power_bank.find_max_for_row_using(batteries, 12)
    expect(power_bank.total_power).to eq(987654321111)
  end

  it 'will add rows max together using sample input' do
    batteries = ['987654321111111', '811111111111119', '234234234234278', '818181911112111']
    power_bank = PowerBank.new()
    batteries.each do |row|
      power_bank.find_max_for_row_using(row.chars.map(&:to_i), 12)
    end
    expect(power_bank.total_power).to eq(3121910778619)
  end
end