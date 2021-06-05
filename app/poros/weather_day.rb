class WeatherDay
  def initialize(weather_info)
    @date = weather_info.first[:date]
    @location_name = weather_info.first[:locati]
  end
end
