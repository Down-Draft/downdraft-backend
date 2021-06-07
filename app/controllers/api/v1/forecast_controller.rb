class Api::V1::ForecastController < ApplicationController
  def three_day
    forecasts = WeatherFacade.three_day_forecast(params[:location])
    if forecasts.is_a? Hash
      render json: { errors: 'Location not found' }, status: :not_found
    else
      render json: ForecastSerializer.new(forecasts)
    end
  end

  def one_day
    forecast = WeatherFacade.one_day_forecast(params[:location], params[:date])

    if (forecast.is_a? Hash) || forecast.nil?
      render json: { errors: 'Incorrect params' }, status: :not_found
    else
      render json: ForecastSerializer.new(forecast)
    end
  end
end
