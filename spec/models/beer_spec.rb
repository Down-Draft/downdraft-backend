require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe 'relationships' do
    it {should belong_to :style}
    it {should have_many(:trip_beers).dependent(:destroy)}
    it {should have_many(:trips).through(:trip_beers)}
  end
end
