class Trip < ApplicationRecord
  has_many :trip_beers
  has_many :beers, through: :trip_beers

  validates_presence_of :date, :elevation, :name, :location, :user_id
  validates :user_id, numericality: true
  validates :user_id, numericality: {greater_than: 0}
  validates :elevation, numericality: true
end
