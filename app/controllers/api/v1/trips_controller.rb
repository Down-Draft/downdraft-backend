class Api::V1::TripsController < ApplicationController
  # if we do an update action on this controller don't forget to add to set_trip before action block
  before_action :set_trip, only: %i[show destroy]
  before_action :set_elevation, only: %i[create]
  before_action :set_temperature, only: %i[create]

  def create
    trip = Trip.new(trip_params)
    if trip.save
      render json: TripSerializer.new(trip), status: :created
    else
      render json: { errors: trip.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    if @trip.nil?
      render json: TripSerializer.new(Trip.new), status: :not_found
    else
      @trip.destroy
    end
  end

  def index
    trips = Trip.where(user_id: params[:user_id])
    render json: TripSerializer.new(trips)
  end

  def show
    if @trip.nil?
      render json: TripSerializer.new(Trip.new), status: :not_found
    else
      render json: TripSerializer.new(@trip)
    end
  end

  private

  def trip_params
    params.permit(:location, :name, :date, :user_id, :elevation, :max_temperature)
  end

  def set_trip
    @trip = Trip.find_by(id: params[:id])
  end

  def set_elevation
    coordinates = Geocoder.search(params[:location]).first.coordinates
    elevation = ElevationService.fetch_elevation(coordinates[0], coordinates[1])
    params[:elevation] = (elevation[:elevation] * 3.28084)
  rescue NoMethodError
    render json: { errors: 'Could not find location. Please ensure zip code is valid or try again later.' },
           status: :bad_request
  end

  def set_temperature
    max_temp = WeatherFacade.one_day_forecast(params[:location], params[:date])
    params[:max_temperature] = max_temp.max_temp
  rescue NoMethodError
    render json: { errors: 'Could not find location. Please ensure zip code is valid or try again later.' },
           status: 400
  end
end
