require 'rails_helper'

RSpec.describe 'WeatherFacade' do
  it 'returns an array of WeatherDay objects', :vcr do
    response = WeatherFacade.three_day_forecast(80206)
    expect(response).to be_an(Array)
    expect(response.first).to be_a(WeatherDay)
    expect(response.count).to eq(3)
  end
end
