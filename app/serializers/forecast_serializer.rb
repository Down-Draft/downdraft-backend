class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :location_name, :location_state, :date, :max_temp, :min_temp, :description, :icon
end
