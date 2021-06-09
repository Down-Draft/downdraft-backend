class Api::V1::BeersController < ApplicationController
  def index
    if trip.max_temperature > 80.0
      beers = Beer.recommended_beers_hot(trip.elevation)
    elsif trip.max_temperature <= 80.0..61.0
      beers = Beer.recommended_beers_warm(trip.elevation)
    elsif trip.max_temperature <= 61.0..32.0
      beers = Beer.recommended_beers_cool(trip.elevation)
    else
      beers = Beer.recommended_beers_cold(trip.elevation)
    end
  end
end
