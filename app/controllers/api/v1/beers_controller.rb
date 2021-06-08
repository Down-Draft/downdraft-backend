class Api::V1::BeersControlller < ApplicationController
  def index
    #search by temp and elevation, happens when "Submit new trip" on /trips/new
    require "pry"; binding.pry
    trip = Trip.find_by_id(params[:trip_id])
    beers = Beer.recommended_beers(trip.elevation, trip.max_temp)
  end
end
