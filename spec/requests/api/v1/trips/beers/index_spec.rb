require 'rails_helper'

RSpec.describe 'Trips Beer Controller', type: :request do
  describe 'The trip beer controller' do
    before(:each) do
      @trip = create(:trip, elevation: 8000, date: '2021-06-07')
      @beer1 = create(:beer, abv: 4.2, style: 'Lager')
      @beer2 = create(:beer, abv: 9, style: 'Sour')
      @beer3 = create(:beer, abv: 1, style: 'IPA')
      @beer4 = create(:beer, abv: 6, style: 'IPA')
      @beer5 = create(:beer, abv: 3.4, style: 'Stout')
      # @trip.beers.create)
    end

    it 'can get a list of beers for a given trip' do
      get "/trips/#{@trip.id}/beers", as: :json

    end
  end
end
