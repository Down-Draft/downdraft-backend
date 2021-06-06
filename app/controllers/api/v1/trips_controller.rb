class Api::V1::TripsController < ApplicationController

  def create
    coordinates = Geocoder.search(params[:location]).first.coordinates
    elevation = ElevationService.fetch_elevation(coordinates[0], coordinates[1])
    params[:elevation] = elevation[:elevation]
    trip = Trip.new(trip_params)
    trip.save
    render json: TripSerializer.new(trip), status: :created
  end

  private

  def trip_params
    params.permit(:location, :name, :date, :user_id, :elevation)
  end
end
