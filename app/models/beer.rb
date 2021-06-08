class Beer < ApplicationRecord
  belongs_to :style
  has_many :trip_beers, dependent: :destroy
  has_many :trips, through: :trip_beers

  def self.find_beers(name)
    where("lower(name) ILIKE '%#{name}%'").order(:name).limit(10)
  end

  def self.beer_by_temp_and_elevation
    # need location and date to get elevation & date
    # will need to join w/ style and trips

    # return beer if >5000ft-7999, abv <8%
      # 8,000ft+, abv = <5.6%
  end
end
