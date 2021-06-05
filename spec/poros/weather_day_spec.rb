require 'rails_helper'

RSpec.describe WeatherDay do
  describe 'it encapsulates and returns weather for one day' do
    it 'shows weather attributes' do
    weather_info =
            {
                "location_name": "Denver",
                "location_region": "Colorado",
                "date": "2021-06-05",
                "date_epoch": 1622851200,
                "day": {
                    "maxtemp_c": 31.2,
                    "maxtemp_f": 88.2,
                    "mintemp_c": 18.1,
                    "mintemp_f": 64.6,
                    "avgtemp_c": 24.4,
                    "avgtemp_f": 75.8,
                    "maxwind_mph": 13.6,
                    "maxwind_kph": 22.0,
                    "totalprecip_mm": 0.8,
                    "totalprecip_in": 0.03,
                    "avgvis_km": 9.9,
                    "avgvis_miles": 6.0,
                    "avghumidity": 36.0,
                    "daily_will_it_rain": 1,
                    "daily_chance_of_rain": "89",
                    "daily_will_it_snow": 0,
                    "daily_chance_of_snow": "0",
                    "condition": {
                        "text": "Patchy rain possible",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                        "code": 1063
                    }
                  }
                }
      weather = WeatherDay.new(weather_info)
      expect(weather.date).to eq("2021-06-05")
      expect(weather.location_name).to eq("Denver")
      expect(weather.location_state).to eq("Colorado")
      expect(weather.max_temp).to eq(88.2)
      expect(weather.min_temp).to eq(64.6)
      expect(weather.description).to eq("Patchy rain possible")
      expect(weather.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/176.png")
    end
  end
end
