require 'rails_helper'

RSpec.describe WeatherDay do
  describe 'it encapsulates and returns weather for one day' do
    it 'shows weather attributes' do
    weather_info = {
    "location": {
        "name": "Denver",
        "region": "Colorado",
        "country": "USA",
        "lat": 39.73,
        "lon": -104.95,
        "tz_id": "America/Denver",
        "localtime_epoch": 1622908644,
        "localtime": "2021-06-05 9:57"
    },
    "current": {
        "last_updated_epoch": 1622907900,
        "last_updated": "2021-06-05 09:45",
        "temp_c": 23.9,
        "temp_f": 75.0,
        "is_day": 1,
        "condition": {
            "text": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
            "code": 1003
        },
        "wind_mph": 8.1,
        "wind_kph": 13.0,
        "wind_degree": 240,
        "wind_dir": "WSW",
        "pressure_mb": 1015.0,
        "pressure_in": 30.4,
        "precip_mm": 0.0,
        "precip_in": 0.0,
        "humidity": 31,
        "cloud": 25,
        "feelslike_c": 25.0,
        "feelslike_f": 77.0,
        "vis_km": 16.0,
        "vis_miles": 9.0,
        "uv": 5.0,
        "gust_mph": 10.7,
        "gust_kph": 17.3
    },
    "forecast": {
        "forecastday": [
            {
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
                    },
                    "uv": 11.0
                },
                "astro": {
                    "sunrise": "05:33 AM",
                    "sunset": "08:24 PM",
                    "moonrise": "03:11 AM",
                    "moonset": "04:06 PM",
                    "moon_phase": "Waning Crescent",
                    "moon_illumination": "21"
                },
                "hour": [
                    {
                        "time_epoch": 1622916000,
                        "time": "2021-06-05 12:00",
                        "temp_c": 30.5,
                        "temp_f": 86.9,
                        "is_day": 1,
                        "condition": {
                            "text": "Sunny",
                            "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            "code": 1000
                        },
                        "wind_mph": 5.8,
                        "wind_kph": 9.4,
                        "wind_degree": 115,
                        "wind_dir": "ESE",
                        "pressure_mb": 1004.0,
                        "pressure_in": 30.1,
                        "precip_mm": 0.0,
                        "precip_in": 0.0,
                        "humidity": 20,
                        "cloud": 0,
                        "feelslike_c": 28.3,
                        "feelslike_f": 82.9,
                        "windchill_c": 30.5,
                        "windchill_f": 86.9,
                        "heatindex_c": 28.3,
                        "heatindex_f": 82.9,
                        "dewpoint_c": 5.0,
                        "dewpoint_f": 41.0,
                        "will_it_rain": 0,
                        "chance_of_rain": "0",
                        "will_it_snow": 0,
                        "chance_of_snow": "0",
                        "vis_km": 10.0,
                        "vis_miles": 6.0,
                        "gust_mph": 6.7,
                        "gust_kph": 10.8,
                        "uv": 8.0
                    }
                ]
            }
        ]
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
