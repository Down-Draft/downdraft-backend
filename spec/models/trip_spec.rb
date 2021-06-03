require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it {should have_many :trip_beers}
    it {should have_many(:beers).through(:trip_beers)}
  end
end
