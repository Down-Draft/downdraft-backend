FactoryBot.define do
  factory :beer do
    name { Faker::Beer.name }
    description { Faker::Lorem.sentence }
    abv { Faker::Beer.alcohol }
    brewery_id { 1 }
    association :style, factory: :style
  end
end
