class TripSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :location, :name, :date, :elevation, :user_id
end
