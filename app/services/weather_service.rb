class WeatherService
  def self.conn
    Faraday.new("http://api.weatherapi.com/v1/forecast.json") do |faraday|
      faraday.headers["key"] = ENV['weather_api_key']
    end
  end

  def self.fetch_weather(days, location)
    response = conn.get("?q=#{location}&days=#{days}")
    JSON.parse(response.body, symbolize_names: true)
  end

end
