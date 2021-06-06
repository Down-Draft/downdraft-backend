class TripSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :location, :name, :date, :elevation, :user_id
  has_many :beers, if: Proc.new{|record| record.beers.any?}
end
