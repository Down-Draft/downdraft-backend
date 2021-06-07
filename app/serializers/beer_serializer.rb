class BeerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :abv
  # attributes :style do |beer|
  #   beer.style.style_name
  # end
end
