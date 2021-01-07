FactoryBot.define do
  factory :review do
    taste            { Faker::Number.within(range: -5..5) }
    scent            { Faker::Number.within(range: -5..5) }
    recommend_score  { Faker::Number.within(range: 1..3) }
    otsumami         { Faker::Lorem.word }
    comment          { Faker::Lorem.paragraph }
    association :user
    association :item
  end
end
