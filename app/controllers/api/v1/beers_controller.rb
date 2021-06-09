class Api::V1::BeersController < ApplicationController
  def index
    trip = Trip.find_by_id(params[:trip_id])
    if trip.present?
      if trip.max_temperature > 80.0
        beers = Beer.recommended_beers_hot(trip.elevation)
      elsif trip.max_temperature <= 80.0..61.1
        beers = Beer.recommended_beers_warm(trip.elevation)
      elsif trip.max_temperature <= 61.0..32.0
        beers = Beer.recommended_beers_cool(trip.elevation)
      else
        beers = Beer.recommended_beers_cold(trip.elevation)
      end
      render json: BeerSerializer.new(beers)
    else
      render json: { errors: 'No trip id entered' }, status: :bad_request
    end
  end
end
