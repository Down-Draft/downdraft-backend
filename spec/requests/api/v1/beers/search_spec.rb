require 'rails_helper'

RSpec.describe 'Search Controller' do
  describe 'Find all beers by name' do
    before :each do
      @beer1 = create(:beer, name: 'Denver Lager')
      @beer2 = create(:beer, name: 'Denver Lambic')
      @beer3 = create(:beer, name: 'Gold Ale')
      @beer4 = create(:beer, name: 'Den of Stouts')
      @beer5 = create(:beer, name: 'Coors Light')
    end
    it 'can find all beers matching name fragment searched' do
      get '/api/v1/beers/search?name=den', as: :json
      beers = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(beers[:data].count).to eq(3)
      expect(beers[:data].first[:attributes][:name]).to eq(@beer4.name)
      expect(beers[:data].second[:attributes][:name]).to eq(@beer1.name)
      expect(beers[:data].last[:attributes][:name]).to eq(@beer2.name)
    end

    it 'sends a 404 if name fragment is not found' do
      get '/api/v1/beers/search?name=xqzy', as: :json
      expect(response.status).to eq(404)
      expect(response.body).to eq("{\"errors\":\"No beers found\"}")
    end
  end
end
