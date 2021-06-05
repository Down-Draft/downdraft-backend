class WeatherFacade
  def self.three_day_forecast(location)
    json = WeatherService.fetch_three_days(location)
    location_name = json[:location][:name]
    location_region = json[:location][:region]
    json[:forecast][:forecastday].map do |day|
      day[:location_name] = location_name
      day[:location_region] = location_region
      WeatherDay.new(day)
    end
  end
end
