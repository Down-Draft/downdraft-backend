require 'rails_helper'

RSpec.describe Style, type: :model do
  describe 'relationships' do
    it {should have_many :beers}
  end
end
