class Api::V1::BeersController < ApplicationController
  def index
    #search by temp and elevation, happens when "Submit new trip" on /trips/new
    trip = Trip.find_by_id(params[:trip_id])
    if trip.max_temperature <= 80.0..61.0
      beers = Beer.recommended_beers_warm(trip.elevation)
    end
  end
end
