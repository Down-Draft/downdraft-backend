class Api::V1::ForecastController < ApplicationController
  def three_day
 
    forecasts = WeatherFacade.three_day_forecast(params[:location])
    if forecasts.is_a? Hash
      render json: {errors: "Location not found"}, status: :not_found
    else
      render json: ForecastSerializer.new(forecasts)
    end
  end
end