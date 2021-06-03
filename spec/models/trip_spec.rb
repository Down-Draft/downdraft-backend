require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it {should have_many :trip_beers}
    it {should have_many(:beers).through(:trip_beers)}
  end

  describe 'validations' do
    it {should validate_presence_of :date}
    it {should validate_presence_of :elevation}
    it {should validate_presence_of :name}
    it {should validate_presence_of :location}
    it {should validate_presence_of :user_id}
    it {should validate_numericality_of :user_id}
    it {should validate_numericality_of(:user_id).is_greater_than(0)}
    it {should validate_numericality_of :elevation}
  end
end
