class WeatherService
  def self.conn
    Faraday.new("http://api.weatherapi.com") do |faraday|
      faraday.headers["key"] = ENV['weather_api_key']
    end
  end

  def self.fetch_weather(days, location)
    response = conn.get("/v1/forecast.json?q=#{location}&days=#{days}")
    JSON.parse(response.body, symbolize_names: true)[:forecast]
  end

end
