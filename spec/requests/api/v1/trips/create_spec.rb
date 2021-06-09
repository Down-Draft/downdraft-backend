require 'rails_helper'

RSpec.describe 'Create Trips' do
  describe 'happy path' do
    it 'creates a trip with correct params', :vcr do
      post '/api/v1/trips', params: {location: 80206, name: "Denver",
         date: "2021-06-10", user_id: 1}
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(trip[:data][:attributes]).to have_key(:location)
      expect(trip[:data][:attributes]).to have_key(:name)
      expect(trip[:data][:attributes]).to have_key(:date)
      expect(trip[:data][:attributes]).to have_key(:elevation)
      expect(trip[:data][:attributes]).to have_key(:user_id)
      expect(Trip.count).to eq(1)
    end
  end

  describe 'sad paths' do
    it 'shows an error message when params are incorrect', :vcr do
      post '/api/v1/trips', params: {location: 80206, name: "",
         date: "2021-06-10"}
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(trip[:errors]).to be_a(Array)
    end

    it 'shows an error message if elevation api fails', :vcr do
      post '/api/v1/trips', params: {name: "Denver",
         date: "2021-06-10", user_id: 1}
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(trip[:errors]).to be_a(String)
    end

    it 'shows an error message if weather api fails', :vcr do
      post '/api/v1/trips', params: {name: "Denver", user_id: 1, max_temperature: nil}
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(trip[:errors]).to be_a(String)
      expect(trip[:errors]).to eq("Could not find location. Please ensure zip code is valid or try again later.")
    end
  end
end
