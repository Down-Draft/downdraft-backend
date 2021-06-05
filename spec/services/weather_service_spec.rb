require 'rails_helper'

RSpec.describe "Weather Service" do
  describe "return weather info" do
    it "returns forecast and temperatures for 3 days when provided with zip code", :vcr do
      results = WeatherService.fetch_three_days(80206)

      expect(results).to be_a(Hash)
      expect(results[:forecast][:forecastday].count).to eq(3)
    end

    it "returns forecast and temperatures for one day when provided with zip code and date", :vcr do
      results = WeatherService.fetch_single_day(80206, "2021-06-10")

      expect(results).to be_a(Hash)
      expect(results[:forecast][:forecastday].count).to eq(1)
    end
  end
end
