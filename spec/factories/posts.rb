FactoryBot.define do
  factory :post do
    date       { Faker::Date.backward(14) }
    rationale  { Faker::StarWars.quote }
    association :user
  end
end
