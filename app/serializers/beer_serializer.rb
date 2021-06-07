class BeerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :abv
  attributes :style_id do |beer|
    beer.style.id
  end
end
