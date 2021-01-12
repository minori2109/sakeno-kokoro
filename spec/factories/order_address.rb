FactoryBot.define do
  factory :order_address do
    postcode         { '123-4567' }
    prefecture_id    { Faker::Number.between(from: 1, to: 47) }
    city             { Gimei.city.kanji }
    block            { '中央区1-1' }
    building         { 'テストビル101' }
    phone_number     { Faker::Number.leading_zero_number(digits: 11) }
    user_id          { Faker::Number.between(from: 1, to: 100) }
    item_id          { Faker::Number.between(from: 1, to: 100) }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
