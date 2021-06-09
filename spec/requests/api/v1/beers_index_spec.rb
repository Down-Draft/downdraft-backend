require 'rails_helper'

RSpec.describe 'API V1 Beers Controller', type: :request do
  describe 'beers controller' do
    before(:each) do
      @trip = create(:trip, max_temperature: 70.8, elevation: 8000)
      @style1 = Style.create(style_name: "Lager")
      @style2 = Style.create(style_name: "Wheat")
      @style3 = Style.create(style_name: "Stout")
      @beer1 = create(:beer, style: @style1, abv: 3)
      @beer2 = create(:beer, style: @style2, abv: 2)
      @beer3 = create(:beer, style: @style2, abv: 10)
      @beer4 = create(:beer, style: @style3, abv: 11)
    end

    it 'can render beers based on a trips elevation and max temperature' do
      get '/api/v1/beers', params: {trip_id: "#{@trip.id}"}
      beers = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(beers[:data].count).to eq(1)
      expect(beers[:data].first[:attributes][:name]).to eq(@beer2.name)
    end

    it 'renders a 400 page if trip id does not exist' do
      get '/api/v1/beers', params: {trip_id: 0}
      expect(response.status).to eq(400)
      expect(response.body).to eq("{\"errors\":\"No trip id entered\"}")
    end
  end
end
