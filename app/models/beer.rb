class Beer < ApplicationRecord
  belongs_to :style
  has_many :trip_beers, dependent: :destroy
  has_many :trips, through: :trip_beers
  class << self
    def find_beers(name)
      where("lower(name) ILIKE '%#{name}%'").order(:name).limit(10)
    end

    def recommended_beers_hot(elevation)
      joins(:style)
        .where('styles.style_name ILIKE ANY(ARRAY[?])', hot)
        .where('abv < ?', set_abv(elevation))
        .order('RANDOM()')
        .limit(9)
    end

    def recommended_beers_warm(elevation)
      joins(:style)
        .where('styles.style_name ILIKE ANY(ARRAY[?])', warm)
        .where('abv < ?', set_abv(elevation))
        .order('RANDOM()')
        .limit(9)
    end

    def recommended_beers_cool(elevation)
      joins(:style)
        .where('styles.style_name ILIKE ANY(ARRAY[?])', cool)
        .where('abv < ?', set_abv(elevation))
        .order('RANDOM()')
        .limit(9)
    end

    def recommended_beers_cold(elevation)
      joins(:style)
        .where('styles.style_name ILIKE ANY(ARRAY[?])', cold)
        .where('abv < ?', set_abv(elevation))
        .order('RANDOM()')
        .limit(9)
    end

    def set_abv(elevation)
      if elevation >= 8000
        5.6
      elsif elevation < 8000 && elevation >= 5000
        8
      else
        100
      end
    end
  end
end
