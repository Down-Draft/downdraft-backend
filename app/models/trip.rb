class Trip < ApplicationRecord
  has_many :trip_beers
  has_many :beers, through: :trip_beers
end
