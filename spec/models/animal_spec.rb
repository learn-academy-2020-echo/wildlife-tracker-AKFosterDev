require 'rails_helper'

RSpec.describe Animal, type: :model do
  
  it 'is not valid without a common name' do
    animal_test = Animal.create latin_name: 'equus caballus', kingdom: 'mammal'
    expect(animal_test.errors[:common_name]).to_not be_empty 
  end

  it 'is not valid without a latin name' do 
    animal_test = Animal.create common_name: 'horse', kingdom: 'mammal'
    expect(animal_test.errors[:latin_name]).to_not be_empty 
  end

  it 'is not valid if the common name and the latin name are the same' do
    animal_test = Animal.create common_name: 'horse', latin_name: 'horse', kingdom: 'mammal'
    expect(animal_test.errors).to_not be_empty
    end

  it 'it is not valid if the common name is not unique' do 
    animal_test1 = Animal.create common_name: 'horse', latin_name: 'equus caballus', kingdom: 'mammal'
    animal_test2 = Animal.create common_name: 'horse', latin_name: 'equus caballus', kingdom: 'mammal'
    expect(animal_test2.errors[:common_name, :latin_name]).to_not be_empty 
  end
    
end
