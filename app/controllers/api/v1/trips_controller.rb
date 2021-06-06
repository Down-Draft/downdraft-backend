class Api::V1::TripsController < ApplicationController

  def create
    coordinates = Geocoder.search(params[:location]).first.coordinates
    elevation = ElevationService.fetch_elevation(coordinates[0], coordinates[1])
    params[:elevation] = elevation[:elevation]
    trip = Trip.new(trip_params)
    if trip.save
      render json: TripSerializer.new(trip), status: :created
    else
      render json: {errors: trip.errors.full_messages}, status: :bad_request
    end
  rescue NoMethodError
    render json: {errors: "Could not find location. Please ensure zip code is valid or try again later."}, status: :bad_request
  end

  private

  def trip_params
    params.permit(:location, :name, :date, :user_id, :elevation)
  end
end
