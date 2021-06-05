class Api::V1::ForecastController < ApplicationController
  def three_day
    forecasts = WeatherFacade.three_day_forecast(params[:location])
    render json: ForecastSerializer.new(forecasts)

  end
end