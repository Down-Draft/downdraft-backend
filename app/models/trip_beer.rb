class TripBeer < ApplicationRecord
  belongs_to :beer
  belongs_to :trip

  validates :beer, :trip, presence: true
end
