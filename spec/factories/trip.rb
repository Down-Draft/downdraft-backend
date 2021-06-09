FactoryBot.define do
  factory :trip do
    location { Faker::Address.zip }
    name { Faker::Lorem.sentence }
    elevation { Faker::Number.number(digits: 5) }
    date { Faker::Date.forward(days: 6) }
    user_id { 1 }
    max_temperature { Array(10..85).sample }
  end
end
