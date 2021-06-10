require 'rails_helper'

RSpec.describe 'Create Trip beers' do
  describe 'happy path' do
    it 'creates a trip beers when all data is accurate and exists in the DB' do
      create :trip, id: 1
      create :beer, id: 1
      post '/api/v1/trips/1/beers', params: {beer_id: 1}
      trip_beer = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(trip_beer[:data][:attributes]).to have_key(:location)
      expect(trip_beer[:data][:attributes]).to have_key(:name)
      expect(trip_beer[:data][:attributes]).to have_key(:date)
      expect(trip_beer[:data][:attributes]).to have_key(:elevation)
      expect(trip_beer[:data][:attributes]).to have_key(:user_id)
      expect(trip_beer[:data][:attributes]).to have_key(:max_temperature)
      expect(trip_beer[:data][:relationships]).to have_key(:beers)
      expect(trip_beer[:data][:relationships][:beers][:data].count).to eq(1)
    end
  end

  describe 'sad paths' do
    it 'shows an error message no trip found' do
      create :beer, id: 1
      post '/api/v1/trips/1/beers', params: {beer_id: 1}

      trip = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(trip).to be_a(Hash)
      expect(trip[:errors]).to eq("Trip or Beer not found")
    end
    it 'shows an error message no beer found' do
      create :trip, id: 1
      post '/api/v1/trips/1/beers', params: {beer_id: 1}
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(trip).to be_a(Hash)
      expect(trip[:errors]).to eq("Trip or Beer not found")
    end
  end
end