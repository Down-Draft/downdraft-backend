require 'rails_helper'

RSpec.describe TripBeer, type: :model do
  describe 'relationships' do
    it {should belong_to :beer}
    it {should belong_to :trip}
  end
end
