class Api::V1::Trips::BeersController < ApplicationController
  before_action :set_trip, only: %i[create]
  before_action :set_beer, only: %i[create]
  def create
    @trip.beers << @beer
    render json: TripSerializer.new(@trip), status: :created
  rescue StandardError
    render json: {errors: "Trip or Beer not found"}, status: :not_found
  end

  private

  def set_trip
    @trip = Trip.find_by(id: params[:trip_id])
  rescue NoMethodError
    render json: { errors: 'Could not find trip' },
           status: :bad_request
  end

  def set_beer
    @beer = Beer.find_by(id: params[:beer_id])
  rescue NoMethodError
    render json: { errors: 'Could not find beer' },
           status: :bad_request
  end
  
end
