require 'rails_helper'

describe 'Weather 1 day forecast' do
  describe '1 day forecast' do
    describe 'Happy Path' do
      it 'sends a 1 day forecast when sent a valid location', :vcr do

        get '/api/v1/1-day-forecast', params: {location:"80206", date: "2021-06-10" }
        weather = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(weather[:data].count).to eq(3)
        expect(weather).to be_a Hash
        expect(weather[:data]).to have_key(:attributes)
        expect(weather[:data][:attributes]).to have_key(:location_name)
        expect(weather[:data][:attributes]).to have_key(:location_state)
        expect(weather[:data][:attributes]).to have_key(:date)
        expect(weather[:data][:attributes]).to have_key(:max_temp)
        expect(weather[:data][:attributes]).to have_key(:min_temp)
        expect(weather[:data][:attributes]).to have_key(:description)
        expect(weather[:data][:attributes]).to have_key(:icon)
      end
    end
    describe 'Sad Path' do
      it 'sends an error when an invalid location is sent', :vcr do

        get '/api/v1/1-day-forecast', params: {location:"1" }
        weather = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(weather).to be_a Hash
        expect(weather).to have_key(:errors)
        expect(weather[:errors]).to eq("Incorrect params")
      end
      it 'sends an error when an invalid date is sent', :vcr do

        get '/api/v1/1-day-forecast', params: {location:"80206", date: "1995-06-10" }
        weather = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(404)
        expect(weather).to be_a Hash
        expect(weather).to have_key(:errors)
        expect(weather[:errors]).to eq("Incorrect params")
      end
    end
  end
end