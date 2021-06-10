RSpec.describe 'Trip Show' do
  describe 'happy path' do
    it 'shows details for a single trip' do
      trip = create :trip
      beer1 = create :beer
      beer2 = create :beer
      TripBeer.create!(trip_id: trip.id, beer_id: beer1.id)
      TripBeer.create!(trip_id: trip.id, beer_id: beer2.id)
      get "/api/v1/trips/#{trip.id}"
      trips = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(trips).to be_a(Hash)
      expect(trips[:data][:attributes]).to have_key(:location)
      expect(trips[:data][:attributes]).to have_key(:name)
      expect(trips[:data][:attributes]).to have_key(:elevation)
      expect(trips[:data][:attributes]).to have_key(:date)
      expect(trips[:data][:attributes]).to have_key(:user_id)
      expect(trips[:data][:attributes]).to have_key(:max_temperature)
      expect(trips[:data]).to have_key(:relationships)
    end

    it 'shows details for a single trip without relationships' do
      trip = create :trip
      get "/api/v1/trips/#{trip.id}"
      trips = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(trips).to be_a(Hash)
      expect(trips[:data][:attributes]).to have_key(:location)
      expect(trips[:data][:attributes]).to have_key(:name)
      expect(trips[:data][:attributes]).to have_key(:elevation)
      expect(trips[:data][:attributes]).to have_key(:date)
      expect(trips[:data][:attributes]).to have_key(:user_id)
      expect(trips[:data][:attributes]).to have_key(:max_temperature)
      expect(trips[:data][:relationships].count).to eq(0)
    end
  end

  describe 'sad path' do
    it 'shows trip not found if no trips exist' do
      get "/api/v1/trips/3"
      trips = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(trips).to be_a(Hash)
      expect(trips[:data][:attributes]).to have_key(:location)
      expect(trips[:data][:attributes]).to have_key(:name)
      expect(trips[:data][:attributes]).to have_key(:elevation)
      expect(trips[:data][:attributes]).to have_key(:date)
      expect(trips[:data][:attributes]).to have_key(:user_id)
      expect(trips[:data][:attributes]).to have_key(:max_temperature)
      expect(trips[:data]).to have_key(:relationships)
    end
  end
end
