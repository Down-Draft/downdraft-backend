require 'rails_helper'

RSpec.describe "Weather Service" do
  describe "return weather info" do
    it "returns forecast and temperatures when provided with lat and long", :vcr do
      results = WeatherService.fetch_weather(3, 80206)

      expect(results).to be_a(Hash)
    end
  end
end
