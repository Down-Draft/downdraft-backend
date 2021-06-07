class Beer < ApplicationRecord
  belongs_to :style
  has_many :trip_beers, dependent: :destroy
  has_many :trips, through: :trip_beers

  def self.find_beers(name)
    where("lower(name) ILIKE '%#{name}%'").order(:name)
  end
end
