require 'rails_helper'

RSpec.describe Elevation do
  describe 'it encapsulates and returns elevation' do
    it 'returns the elevation object with an elevation attribute' do
      elevation_info = {
        "dataset": 'srtm90m',
        "elevation": 1616.0,
        "location": {
          "lat": 39.74,
          "lng": -104.98
        }
      }
      elevation = Elevation.new(elevation_info)

      expect(elevation.elevation).to eq(5301.83744)
    end
  end
end
