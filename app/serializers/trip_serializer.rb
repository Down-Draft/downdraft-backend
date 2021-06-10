class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :name, :date, :elevation, :user_id, :max_temperature
  has_many :beers, if: proc { |record| record.beers.any? }
end
