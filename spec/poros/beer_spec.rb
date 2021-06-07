require 'rails_helper'

RSpec.describe Beer do
  describe 'it encapsulates and returns beers' do
    it 'returns the beer object with attributes' do
      beer_info = {
        "name": 'Denver Lager',
        "description": 'tastes like Denver',
        "abv": 5.5,
        "style": 'Lager'
      }
      beer = BeerInfo.new(beer_info)
      expect(beer).to be_a BeerInfo
      expect(beer.name).to eq('Denver Lager')
      expect(beer.description).to eq('tastes like Denver')
      expect(beer.abv).to eq(5.5)
      expect(beer.style).to eq('Lager')
    end
  end
end
