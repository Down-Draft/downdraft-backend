class BeerInfo
  attr_reader :name, :description, :abv, :style

  def initialize(data)
    @name = data[:name]
    @description = data[:description]
    @abv = data[:abv]
    @style = data[:style]
  end
end
