require 'rails_helper'

RSpec.describe WeatherDay do
  describe 'it encapsulates and returns weather for one day' do
    it 'shows weather attributes' do
    weather_info =[
            {
                "date": "2021-06-04",
                "date_epoch": 1622764800,
                "day": {
                    "maxtemp_c": 30.0,
                    "maxtemp_f": 86.0,
                    "mintemp_c": 16.9,
                    "mintemp_f": 62.4,
                    "avgtemp_c": 24.0,
                    "avgtemp_f": 75.2,
                    "maxwind_mph": 8.3,
                    "maxwind_kph": 13.3,
                    "totalprecip_mm": 0.1,
                    "totalprecip_in": 0.0,
                    "avgvis_km": 10.0,
                    "avgvis_miles": 6.0,
                    "avghumidity": 35.0,
                    "daily_will_it_rain": 0,
                    "daily_chance_of_rain": "0",
                    "daily_will_it_snow": 0,
                    "daily_chance_of_snow": "0",
                    "condition": {
                        "text": "Partly cloudy",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                        "code": 1003
                    }}}]
      weather = WeatherDay.new(weather_info)
      expect(weather.date).to eq("2021-06-04")
      expect(weather.location_name).to eq("Denver")
      expect(weather.location_state).to eq("Colorado")
      expect(weather.max_temp).to eq(86.0)
      expect(weather.min_temp).to eq(62.4)
      expect(weather.description).to eq("Partly cloudy")
      expect(weather.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/116.png")
    end
  end
end
