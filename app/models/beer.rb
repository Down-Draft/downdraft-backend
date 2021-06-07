class Beer < ApplicationRecord
  belongs_to :style
  has_many :trip_beers, dependent: :destroy
  has_many :trips, through: :trip_beers
end
