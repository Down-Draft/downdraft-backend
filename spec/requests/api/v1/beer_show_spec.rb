require 'rails_helper'

RSpec.describe 'beer show' do
  describe 'returns one beer' do
    before :each do
      @beer1 = create(:beer, name: 'Denver Lager', id: 1)
    end
    it 'can reuturn one beer details' do
      get "/api/v1/beers/#{@beer1.id}"
      beer = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(beer).to be_a(Hash)
      expect(beer[:data]).to have_key(:attributes)
      expect(beer[:data]).to have_key(:id)
      expect(beer[:data][:attributes]).to have_key(:name)
      expect(beer[:data][:attributes]).to have_key(:description)
      expect(beer[:data][:attributes]).to have_key(:abv)
      expect(beer[:data][:attributes]).to have_key(:style)
    end

    it 'sends a 404 if no beer found' do
      get '/api/v1/beers/2'
      beer = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(beer).to be_a(Hash)
      expect(beer).to have_key(:errors)
      expect(beer[:errors]).to eq("No beer found")

    end
  end 
end 
