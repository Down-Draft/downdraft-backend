class WeatherDay
  attr_reader :location_name,
              :location_state,
              :date,
              :max_temp,
              :min_temp,
              :description,
              :icon
  def initialize(weather_info)
    @location_name = weather_info[:location][:name]
    @location_state = weather_info[:location][:region]
    @date = weather_info[:forecast][:forecastday].first[:date]
    @max_temp = weather_info[:forecast][:forecastday].first[:day][:maxtemp_f]
    @min_temp = weather_info[:forecast][:forecastday].first[:day][:mintemp_f]
    @description = weather_info[:forecast][:forecastday].first[:day][:condition][:text]
    @icon = weather_info[:forecast][:forecastday].first[:day][:condition][:icon]
  end
end
