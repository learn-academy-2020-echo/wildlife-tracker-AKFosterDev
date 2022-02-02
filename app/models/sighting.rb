class Sighting < ApplicationRecord
  belongs_to :animal

  validates :lat, :lng, :date, presence: true
  
end
