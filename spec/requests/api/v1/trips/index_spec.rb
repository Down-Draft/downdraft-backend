require 'rails_helper'

RSpec.describe 'Trip Index' do
  describe 'happy path' do
    it 'shows all trips for a user' do
      create_list :trip, 3
      get '/api/v1/trips', params: {user_id: 1}
      trips = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(trips).to be_a(Hash)
      expect(trips[:data].count).to eq(3)
      expect(trips[:data].first[:attributes]).to have_key(:location)
      expect(trips[:data].first[:attributes]).to have_key(:name)
      expect(trips[:data].first[:attributes]).to have_key(:elevation)
      expect(trips[:data].first[:attributes]).to have_key(:date)
      expect(trips[:data].first[:attributes]).to have_key(:user_id)
      expect(trips[:data].first[:attributes]).to have_key(:max_temperature)

    end
  end
end
