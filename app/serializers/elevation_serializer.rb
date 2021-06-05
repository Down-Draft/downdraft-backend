class ElevationSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :elevation
end
