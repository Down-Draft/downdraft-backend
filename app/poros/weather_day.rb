class WeatherDay
  attr_reader :location_name,
              :location_state,
              :date,
              :max_temp,
              :min_temp,
              :description,
              :icon
  def initialize(weather_info)
    @location_name = weather_info[:location_name]
    @location_state = weather_info[:location_region]
    @date = weather_info[:date]
    @max_temp = weather_info[:day][:maxtemp_f]
    @min_temp = weather_info[:day][:mintemp_f]
    @description = weather_info[:day][:condition][:text]
    @icon = weather_info[:day][:condition][:icon]
  end
end
