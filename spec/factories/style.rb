FactoryBot.define do
  factory :style do
    style_name { Faker::Beer.style }
  end
end
