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
end
