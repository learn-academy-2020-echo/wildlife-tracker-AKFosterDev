require 'rails_helper'

RSpec.describe Sighting, type: :model do
  
  it 'is not valid without latitude' do
    sighting_test = Sighting.create lng: '-118.74264', date: '2020-12-20 12:45:11'
    expect(sighting_test.errors[:lat]).to_not be_empty
  end

  it 'is not valid without longitude' do
    sighting_test = Sighting.create lat: '45.66918', date: '2020-12-20 12:45:11'
    expect(sighting_test.errors[:lng]).to_not be_empty
  end

  it 'is not valid without date' do
    sighting_test = Sighting.create lat: '45.66918', lng: '-118.74264'
    expect(sighting_test.errors[:date]).to_not be_empty
  end

end
