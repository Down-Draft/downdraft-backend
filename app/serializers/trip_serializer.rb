class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :name, :date, :elevation, :user_id
  has_many :beers, if: proc { |record| record.beers.any? }
end
