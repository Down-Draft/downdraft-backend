class Beer < ApplicationRecord
  belongs_to :style
  has_many :trip_beers, dependent: :destroy
  has_many :trips, through: :trip_beers

  def self.find_beers(name)
    where("lower(name) ILIKE '%#{name}%'").order(:name).limit(10)
  end

  def self.recommended_beers_warm(elevation)
    if elevation >= 8000
      set_abv = 5.6
    elsif elevation < 8000 && elevation >= 5000
      set_abv = 8
    else
      set_abv = 100
    end
    require "pry"; binding.pry
    joins(:style).
    where('style.style_name' => warm)
    where("abv <= ?", "#{set_abv}")
  end
end
