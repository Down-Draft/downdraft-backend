class Trip < ApplicationRecord
  has_many :trip_beers, dependent: :destroy
  has_many :beers, through: :trip_beers

  validates :date, :elevation, :name, :location, :user_id, presence: true
  validates :user_id, numericality: true
  validates :user_id, numericality: { greater_than: 0 }
  validates :elevation, numericality: true
end
