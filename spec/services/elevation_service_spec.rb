require 'rails_helper'

RSpec.describe "Elevation Service" do
  describe "return elevation" do 
    it "returns elevation when provided with lat and long", :vcr do
      results = ElevationService.fetch_elevation(39.74,-104.98)

      expect(results).to be_a(Hash)
      expect(results[:results].first[:elevation]).to eq(1616.0)
    end
  end
end