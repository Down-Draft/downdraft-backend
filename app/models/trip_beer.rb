class TripBeer < ApplicationRecord
  belongs_to :beer
  belongs_to :trip
end
