class ElevationService
  def self.conn
    Faraday.new("https://api.opentopodata.org")
  end

  def self.fetch_elevation(lat, long)
    response = conn.get("/v1/srtm90m?locations=#{lat},#{long}")
    JSON.parse(response.body, symbolize_names: true)
  end 
end