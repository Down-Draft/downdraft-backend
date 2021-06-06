require 'rails_helper'

RSpec.describe 'Delete Trips' do
  describe 'happy path' do
    it 'can delete a trip for a given trip id', :vcr do
      trip = Trip.create!(location: 80206, name: "Denver", elevation: 5280, user_id: 1, date: "2021-06-10")
      beer1 = create :beer
      beer2 = create :beer
      TripBeer.create!(trip_id: trip.id, beer_id: beer1.id)
      TripBeer.create!(trip_id: trip.id, beer_id: beer2.id)
      delete "/api/v1/trips/#{trip.id}"
      expect(response.status).to eq(204)
      expect(Trip.count).to eq(0)
      expect(TripBeer.count).to eq(0)
    end
  end

  describe 'sad path' do
    it 'returns not found if trip does not exist', :vcr do
      delete "/api/v1/trips/1"
      expect(response.status).to eq(404)
    end
  end
end
