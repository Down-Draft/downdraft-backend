class Api::V1::BeersController < ApplicationController
  def index
    trip = Trip.create!(date: "2021-06-08", elevation: 7, name: "Happy Trip", location: 33617, user_id: 1, max_temperature: 100)
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
