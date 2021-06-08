require 'rails_helper'

RSpec.describe 'API V1 Beers Controller', type: :request do
  describe 'beers controller' do
    before(:each) do
      @trip = create(:trip, max_temperature: 70.8, elevation: 8000)
      @style1 = Style.create(style_name: "Lager")
      @style2 = Style.create(style_name: "Wheat")
      @style3 = Style.create(style_name: "Stout")
      @beer1 = create(:beer, style: @style1)
      @beer2 = create(:beer, style: @style2, abv: 2)
      @beer3 = create(:beer, style: @style2, abv: 10)
      @beer4 = create(:beer, style: @style3)
    end

    it 'can render beers based on a trips elevation and max temperature' do
      get '/api/v1/beers', params: {trip_id: "#{@trip.id}"}
      #only beer 2
      # beers = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
