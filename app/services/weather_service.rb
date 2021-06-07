class WeatherService
  def self.conn
    Faraday.new('http://api.weatherapi.com') do |faraday|
      faraday.headers['key'] = ENV['weather_api_key']
    end
  end

  def self.fetch_three_days(location)
    response = conn.get("/v1/forecast.json?q=#{location}&days=3&aqi=no&alerts=no&hour=12")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.fetch_single_day(location, date)
    response = conn.get("/v1/forecast.json?q=#{location}&date=#{date}&aqi=no&alerts=no&hour=12")
    JSON.parse(response.body, symbolize_names: true)
  end
end
