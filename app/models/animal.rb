class Animal < ApplicationRecord
  has_many :sightings
  accepts_nested_attributes_for :sightings
  
  validates :common_name, :latin_name, presence: true
  validates :common_name, uniqueness: true
  validates :latin_name, uniqueness: true
  # validates :common_name, confirmation: true, unless: -> {common_name == latin_name}

  validates :check_common_and_latin_names


  # private
  def check_common_and_latin_names
    errors.add(:common_name, 'cannot be the same as the latin name') 
    if latin_name == common_name
    end
  end
end

