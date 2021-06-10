require 'rails_helper'

describe 'Elevation' do
  describe 'Elevation Index' do
    describe 'Happy Path' do
      it 'sends an elevation value when provided with a valid location', :vcr do

        get '/api/v1/elevation', params: {location:"80206" }
        elevation = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(elevation[:data].count).to eq(3)
        expect(elevation).to be_a Hash
        expect(elevation[:data]).to have_key(:attributes)
        expect(elevation[:data][:attributes]).to have_key(:elevation)
      end
    end
    describe 'Sad Path' do
      it 'sends an error when an invalid location is sent', :vcr do

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