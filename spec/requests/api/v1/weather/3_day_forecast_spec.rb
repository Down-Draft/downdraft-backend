require 'rails_helper'

describe 'Weather 3 day forecast' do
  describe '3 day forecast' do
    describe 'Happy Path' do
      it 'sends a 3 day forecast when sent a valid location', :vcr do

        get '/api/v1/3-day-forecast', params: {location:"80206" }
        weather = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(weather[:data].count).to eq(3)
        expect(weather).to be_a Hash
        expect(weather[:data].first).to have_key(:attributes)
        expect(weather[:data].first[:attributes]).to have_key(:location_name)
        expect(weather[:data].first[:attributes]).to have_key(:location_state)
        expect(weather[:data].first[:attributes]).to have_key(:date)
        expect(weather[:data].first[:attributes]).to have_key(:max_temp)
        expect(weather[:data].first[:attributes]).to have_key(:min_temp)
        expect(weather[:data].first[:attributes]).to have_key(:description)
        expect(weather[:data].first[:attributes]).to have_key(:icon)
      end
    end
    describe 'Sad Path' do
      xit 'sends an error when an invalid location is sent', :vcr do

        get '/api/v1/elevation', params: {location:"1" }
        elevation = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(elevation).to be_a Hash
        expect(elevation).to have_key(:errors)
        expect(elevation[:errors]).to eq("Location not found")
      end
    end
  end
end