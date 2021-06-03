require 'rails_helper'

RSpec.describe TripBeer, type: :model do
  describe 'relationships' do
    it {should belong_to :beer}
    it {should belong_to :trip}
  end

  describe 'validations' do
    it {should validate_presence_of :beer}
    it {should validate_presence_of :trip}
  end
end
