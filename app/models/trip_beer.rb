class TripBeer < ApplicationRecord
  belongs_to :beer
  belongs_to :trip

  validates_presence_of :beer, :trip
end
